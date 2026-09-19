defmodule Inttegro.PublicAPITest do
  use ExUnit.Case, async: true

  test "client and typed values are available" do
    client = Inttegro.Client.new!("sk_test_example")
    assert %Inttegro.Client{} = client

    assert %Inttegro.Money.AmountParams{value: 5_000} =
             Inttegro.Money.AmountParams.new!(currency: :ghs, value: 5_000)
  end

  test "OTP purposes encode to their closed wire values" do
    assert Inttegro.Otp.Purpose.encode(:sign_in) == "sign_in"
    assert Inttegro.Otp.Purpose.decode("payment_confirmation") == :payment_confirmation
  end

  test "wire envelopes are unwrapped into domain values" do
    Req.Test.stub(__MODULE__, fn conn ->
      Req.Test.json(conn, %{
        "app" => %{"id" => "app_test", "name" => "Test", "created_at" => "2026-09-07T00:00:00Z"}
      })
    end)

    http = Req.new(base_url: "https://api.inttegro.test", plug: {Req.Test, __MODULE__})
    client = Inttegro.Client.new!("sk_test_example", http: http)
    assert {:ok, %Inttegro.Apps.Application{id: "app_test"}} = Inttegro.Apps.lookup(client)
  end

  test "error reports encode with the shared camel-case schema" do
    report = %Inttegro.Telemetry.ErrorReport{
      schema_version: 1,
      event_id: "event_test",
      occurred_at: "2026-09-07T00:00:00Z",
      severity: "error",
      category: "api",
      operation: "orders.lookup",
      sdk: %Inttegro.Telemetry.SDKContext{language: "elixir", version: "0.2.0"},
      http: %Inttegro.Telemetry.HTTPContext{
        method: "POST",
        route: "/orders/lookup",
        server_address: "https://api.inttegro.com",
        status_code: 500,
        request_id: "request_test",
        duration_ms: 12
      },
      api_error: %Inttegro.Telemetry.APIErrorContext{
        type: "api",
        code: "internal_error",
        fix_code: nil
      },
      trace: nil,
      exception_type: "Inttegro.Errors.APIError",
      fingerprint: "inttegro:elixir:orders.lookup:api:500"
    }

    payload = Jason.encode!(report)
    assert payload =~ ~s("schemaVersion":1)
    assert payload =~ ~s("serverAddress":"https://api.inttegro.com")
    refute payload =~ "schema_version"
  end

  test "domain values live in their owning namespaces" do
    assert Code.ensure_loaded?(Inttegro.Files.File)
    assert Code.ensure_loaded?(Inttegro.Orders.Order)
    assert Code.ensure_loaded?(Inttegro.Orders.Address)
    assert Code.ensure_loaded?(Inttegro.PaymentMethods.PaymentMethod)
    assert Code.ensure_loaded?(Inttegro.Payments.Attempt)

    refute Code.ensure_loaded?(Inttegro.File)
    refute Code.ensure_loaded?(Inttegro.Order)
    refute Code.ensure_loaded?(Inttegro.PaymentMethod)
    refute Code.ensure_loaded?(Inttegro.Orders.OrderAddress)
    refute Code.ensure_loaded?(Inttegro.Payments.PaymentAttempt)
  end

  test "supporting type names do not repeat their domain namespace" do
    {:ok, modules} = :application.get_key(:inttegro, :modules)

    domain_names = %{
      "BalanceTransactions" => "BalanceTransaction",
      "Balances" => "Balance",
      "BankAccounts" => "BankAccount",
      "Broadcasts" => "Broadcast",
      "Checkout" => "Checkout",
      "Chimes" => "Chime",
      "Customers" => "Customer",
      "FileLinks" => "FileLink",
      "FileReferences" => "FileReference",
      "Files" => "File",
      "FinancialAccounts" => "FinancialAccount",
      "Invoices" => "Invoice",
      "MessageTemplates" => "MessageTemplate",
      "Orders" => "Order",
      "Otp" => "OTP",
      "PaymentMethods" => "PaymentMethod",
      "Payments" => "Payment",
      "Payouts" => "Payout",
      "Prices" => "Price",
      "Products" => "Product",
      "PurchaseIntents" => "PurchaseIntent",
      "Refunds" => "Refund",
      "Schedules" => "Schedule",
      "UploadRequests" => "UploadRequest",
      "Wallets" => "Wallet"
    }

    Enum.each(modules, fn module ->
      case Module.split(module) do
        ["Inttegro", namespace, leaf] ->
          case domain_names[namespace] do
            nil ->
              :ok

            domain when leaf == domain ->
              :ok

            domain ->
              refute leaf =~ domain,
                     "#{inspect(module)} repeats the #{namespace} domain in its leaf name"
          end

        _ ->
          :ok
      end
    end)
  end

  test "balance response exposes ghs statically" do
    balance =
      Inttegro.Balances.Balance.from_map(%{
        "ghs" => %{
          "available" => %{"amount" => 1_000},
          "includes_transactions_before" => "2026-09-09T12:00:00Z",
          "pending" => %{"amount" => 200},
          "refund" => %{"amount" => 50},
          "reserved" => %{"amount" => 100}
        }
      })

    assert balance.ghs.available.amount == 1_000
    assert %DateTime{} = balance.ghs.includes_transactions_before
    assert DateTime.to_iso8601(balance.ghs.includes_transactions_before) == "2026-09-09T12:00:00Z"

    assert get_in(Inttegro.Balances.Balance.to_map(balance), [
             "ghs",
             "includes_transactions_before"
           ]) ==
             "2026-09-09T12:00:00Z"
  end

  test "purchase intent exposes nested response types" do
    intent =
      Inttegro.PurchaseIntents.PurchaseIntent.from_map(%{
        "allow_variants" => false,
        "created_at" => "2026-09-09T12:00:00Z",
        "id" => "sale_123",
        "merchant" => %{"organization_name" => "Tea House Ltd"},
        "product" => %{
          "active" => true,
          "created_at" => "2026-09-09T11:00:00Z",
          "dimensions" => %{"digital" => %{"bytes" => 1_024}},
          "id" => "prod_123",
          "name" => "Tea guide",
          "type" => "digital"
        },
        "quantity" => %{"min" => 1},
        "status" => "active",
        "usage" => %{
          "order" => %{"created_at" => "2026-09-09T12:02:00Z", "id" => "or_123"},
          "single_use" => true
        }
      })

    assert intent.merchant.organization_name == "Tea House Ltd"
    assert intent.product.dimensions.digital.bytes == 1_024
    assert intent.usage.order.id == "or_123"
    assert %DateTime{} = intent.created_at
  end

  test "payout settings expose known destinations statically" do
    settings =
      Inttegro.Payouts.SettingsMutation.from_map(%{
        "destinations" => %{"ghs" => "fa_123"},
        "fx_enabled" => true,
        "id" => "settings_123"
      })

    assert settings.destinations.ghs == "fa_123"
    assert settings.fx_enabled

    assert Inttegro.Payouts.SettingsMutation.to_map(settings)["destinations"] == %{
             "ghs" => "fa_123"
           }
  end

  test "refund settlement is discriminated and contains only masked account details" do
    refund =
      Inttegro.Refunds.Refund.from_map(%{
        "created_at" => "2026-09-09T12:00:00Z",
        "id" => "rf_123",
        "line_items" => [
          %{
            "id" => "rli_123",
            "order_line_item_id" => "oli_123",
            "order_line_item" => %{
              "id" => "oli_123",
              "type" => "product",
              "quantity" => 2,
              "product" => %{"id" => "prod_123", "name" => "Premium subscription"}
            },
            "original_amount_paid" => %{"currency" => "ghs", "value" => 200},
            "refund_amount" => %{"currency" => "ghs", "value" => 100}
          }
        ],
        "order_id" => "or_123",
        "reason" => "requested_by_customer",
        "settlement" => %{
          "type" => "payment_method",
          "payment_method" => %{
            "id" => "pm_123",
            "type" => "bank_account",
            "bank_account" => %{
              "type" => "ghana_bank_account",
              "ghana_bank_account" => %{
                "account_number" => "****1234",
                "last4" => "1234"
              }
            }
          }
        },
        "status" => "pending",
        "total" => %{"currency" => "ghs", "value" => 100}
      })

    assert refund.settlement.type == :payment_method
    assert refund.settlement.payment_method.type == :bank_account

    assert refund.settlement.payment_method.bank_account.ghana_bank_account.account_number ==
             "****1234"

    assert refund.line_items |> hd() |> Map.fetch!(:order_line_item) |> Map.fetch!(:type) ==
             :product

    assert refund.line_items
           |> hd()
           |> Map.fetch!(:order_line_item)
           |> Map.fetch!(:product)
           |> Map.fetch!(:id) == "prod_123"

    assert_raise FunctionClauseError, fn ->
      Inttegro.Refunds.Settlement.from_map(%{
        "type" => "offline",
        "payment_method" => %{"id" => "pm_123"}
      })
    end

    assert_raise FunctionClauseError, fn ->
      Inttegro.Refunds.Settlement.from_map(%{"type" => "payment_method"})
    end
  end

  test "public reference modules contain meaningful documentation" do
    {:ok, modules} = :application.get_key(:inttegro, :modules)

    modules =
      Enum.filter(modules, fn module ->
        String.starts_with?(inspect(module), "Inttegro.") and
          module not in [Inttegro.Codec, Inttegro.CustomData.Validation, Inttegro.Docs]
      end)

    Enum.each(modules, fn module ->
      assert {:docs_v1, _, :elixir, _, %{"en" => module_doc}, _, _} = Code.fetch_docs(module)
      assert String.length(module_doc) >= 80, "thin documentation for #{inspect(module)}"
      refute module_doc =~ "Typed Inttegro"
      refute module_doc =~ "Operations for Inttegro"
    end)

    file_doc = module_doc(Inttegro.Files.File)
    assert file_doc =~ "storage-provider credentials"
    assert file_doc =~ "scan_status"
    assert file_doc =~ "Inttegro.Files.contents/3"
  end

  test "the root namespace contains only domain entry points" do
    {:ok, modules} = :application.get_key(:inttegro, :modules)

    root_modules =
      modules
      |> Enum.filter(&(Module.split(&1) |> length() == 2))
      |> Enum.reject(&(&1 in [Inttegro.Codec, Inttegro.Docs]))

    allowed = [
      Inttegro.Apps,
      Inttegro.BalanceTransactions,
      Inttegro.Balances,
      Inttegro.BankAccounts,
      Inttegro.Broadcasts,
      Inttegro.Checkout,
      Inttegro.Chimes,
      Inttegro.Client,
      Inttegro.CustomData,
      Inttegro.CustomDataInput,
      Inttegro.CustomDataPatch,
      Inttegro.Customers,
      Inttegro.Errors,
      Inttegro.FileLinks,
      Inttegro.FileReferences,
      Inttegro.Files,
      Inttegro.FinancialAccounts,
      Inttegro.Invoices,
      Inttegro.Keys,
      Inttegro.MessageTemplates,
      Inttegro.Money,
      Inttegro.Orders,
      Inttegro.Otp,
      Inttegro.PaymentMethods,
      Inttegro.Payments,
      Inttegro.Payouts,
      Inttegro.Prices,
      Inttegro.Products,
      Inttegro.PurchaseIntents,
      Inttegro.Refunds,
      Inttegro.Schedules,
      Inttegro.Shared,
      Inttegro.Specifications,
      Inttegro.Telemetry,
      Inttegro.UploadRequests,
      Inttegro.Wallets
    ]

    assert Enum.sort(root_modules) == Enum.sort(allowed)
  end

  test "every resource operation has an ExDoc entry" do
    resource_modules = [
      Inttegro.Apps,
      Inttegro.BalanceTransactions,
      Inttegro.Balances,
      Inttegro.Broadcasts,
      Inttegro.Chimes,
      Inttegro.Customers,
      Inttegro.FileLinks,
      Inttegro.FileReferences,
      Inttegro.Files,
      Inttegro.FinancialAccounts,
      Inttegro.Keys,
      Inttegro.MessageTemplates,
      Inttegro.Orders,
      Inttegro.Otp,
      Inttegro.PaymentMethods,
      Inttegro.Payouts,
      Inttegro.Prices,
      Inttegro.Products,
      Inttegro.PurchaseIntents,
      Inttegro.Refunds,
      Inttegro.Schedules,
      Inttegro.Specifications,
      Inttegro.UploadRequests
    ]

    Enum.each(resource_modules, fn module ->
      assert {:docs_v1, _, :elixir, _, %{"en" => _}, _, entries} = Code.fetch_docs(module)

      missing =
        for {{:function, name, arity}, _, _, :none, _} <- entries,
            do: "#{name}/#{arity}"

      assert missing == [], "undocumented functions in #{inspect(module)}: #{inspect(missing)}"
    end)
  end

  test "financial account documentation explains workflows and real inputs" do
    module_doc = module_doc(Inttegro.FinancialAccounts)
    assert module_doc =~ "Push"
    assert module_doc =~ "Pull"
    assert module_doc =~ "Typical lifecycle"

    assert {:docs_v1, _, :elixir, _, _, _, entries} =
             Code.fetch_docs(Inttegro.FinancialAccounts)

    operation_docs =
      for {{:function, name, _arity}, _, _, %{"en" => doc}, _} <- entries,
          into: %{},
          do: {name, doc}

    expected_operations = [
      :connect,
      :create,
      :disable_pull,
      :disable_push,
      :disconnect,
      :enable_pull,
      :enable_push,
      :lookup,
      :page,
      :reconnect,
      :update
    ]

    Enum.each(expected_operations, fn operation ->
      doc = Map.fetch!(operation_docs, operation)
      assert String.length(doc) >= 500, "thin documentation for #{operation}"
      refute doc =~ "request_attributes"
      refute doc =~ "concrete_request"
    end)

    assert operation_docs.enable_pull =~ ~r/real\s+payer IP address/
    assert operation_docs.disable_push =~ "unset_as_payout_destination"
    assert operation_docs.connect =~ "FinancialAccounts.WalletRequest"
  end

  defp module_doc(module) do
    {:docs_v1, _, :elixir, _, %{"en" => module_doc}, _, _} = Code.fetch_docs(module)
    module_doc
  end
end
