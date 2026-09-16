defmodule Inttegro.ResourceSemanticsTest do
  use ExUnit.Case, async: true

  test "payment and order answer lifecycle questions" do
    payment =
      Inttegro.Payments.Payment.new!(
        id: "py_123",
        status: :requires_action,
        statement_descriptor: "INTTEGRO",
        amount: Inttegro.Money.Amount.new!(currency: :ghs, value: 1_000),
        initiated_at: DateTime.utc_now(),
        next_action: Inttegro.Payments.NextAction.new!(type: :redirect)
      )

    order =
      Inttegro.Orders.Order.new!(
        customer: Inttegro.Orders.Customer.new!(guest: false, id: "cu_123", name: "Ama"),
        id: "or_123",
        initiated_at: DateTime.utc_now(),
        payment: payment,
        status: :requires_payment
      )

    assert Inttegro.Payments.requires_action?(payment)
    refute Inttegro.Payments.terminal?(payment)
    assert Inttegro.Payments.required_action(payment).type == :redirect
    assert Inttegro.Orders.requires_payment?(order)
    assert Inttegro.Orders.required_payment_action(order).type == :redirect
  end

  test "catalog and payment methods answer protocol questions" do
    intent =
      Inttegro.PurchaseIntents.PurchaseIntent.new!(
        allow_variants: false,
        created_at: DateTime.utc_now(),
        id: "sale_123",
        quantity: Inttegro.PurchaseIntents.Quantity.new!(min: 1),
        status: :used,
        usage:
          Inttegro.PurchaseIntents.Usage.new!(
            order:
              Inttegro.PurchaseIntents.UsageOrder.new!(
                created_at: DateTime.utc_now(),
                id: "or_123"
              ),
            single_use: true
          )
      )

    product =
      Inttegro.Products.Product.new!(
        active: true,
        created_at: DateTime.utc_now(),
        id: "prod_123",
        name: "Tea guide",
        published_at: DateTime.utc_now(),
        type: :digital
      )

    method =
      Inttegro.PaymentMethods.PaymentMethod.new!(
        active: true,
        created_at: DateTime.utc_now(),
        customer_id: "cu_123",
        fingerprint: "ifp_v1_app_customer",
        id: "pm_123",
        type: :mobile_money,
        verified_at: DateTime.utc_now()
      )

    assert Inttegro.PurchaseIntents.single_use?(intent)
    assert Inttegro.PurchaseIntents.used_order_id(intent) == "or_123"
    assert Inttegro.Products.published?(product)
    assert Inttegro.Products.ever_published?(product)
    assert Inttegro.PaymentMethods.verified?(method)
    assert Inttegro.PaymentMethods.reusable?(method)

    assert Inttegro.PaymentMethods.PaymentMethod.to_map(method)["fingerprint"] ==
             "ifp_v1_app_customer"
  end

  test "custom data keeps open-ended JSON behind immutable semantic values" do
    input =
      Inttegro.CustomDataInput.new!(%{"campaign" => "launch", "attempt" => 1})
      |> Inttegro.CustomDataInput.put("context", %{"source" => "studio"})

    assert Inttegro.CustomDataInput.to_map(input) == %{
             "attempt" => 1,
             "campaign" => "launch",
             "context" => %{"source" => "studio"}
           }

    patch =
      Inttegro.CustomDataPatch.new!()
      |> Inttegro.CustomDataPatch.set("campaign", "fall")
      |> Inttegro.CustomDataPatch.unset("legacy")

    assert Inttegro.CustomDataPatch.to_map(patch) == %{"campaign" => "fall", "legacy" => nil}

    customer =
      Inttegro.Customers.Customer.from_map(%{
        "balance" => %{},
        "created_at" => "2026-09-16T00:00:00Z",
        "custom_data" => %{"segment" => "enterprise"},
        "guest" => false,
        "id" => "cu_123",
        "name" => "Ama"
      })

    assert %Inttegro.CustomData{} = customer.custom_data

    assert Inttegro.Customers.Customer.to_map(customer)["custom_data"] == %{
             "segment" => "enterprise"
           }
  end
end
