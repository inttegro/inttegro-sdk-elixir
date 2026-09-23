defmodule Inttegro.MixProject do
  use Mix.Project

  @version "0.7.0"

  def project do
    [
      app: :inttegro,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: "Official typed server-side Elixir SDK for Inttegro",
      source_url: "https://github.com/inttegro/inttegro-sdk-elixir",
      homepage_url: "https://studio.inttegro.com/sdks/elixir",
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps do
    [
      {:req, "~> 0.5"},
      {:jason, "~> 1.4"},
      {:plug, "~> 1.16", only: :test},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/inttegro/inttegro-sdk-elixir"},
      files: ~w(lib guides mix.exs README.md CHANGELOG.md LICENSE)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/inttegro/#{@version}",
      nest_modules_by_prefix: [
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
      ],
      extras: [
        "README.md",
        "guides/getting-started.md",
        "guides/orders-and-payments.md",
        "guides/errors-and-retries.md",
        "guides/pagination.md",
        "guides/files-and-uploads.md",
        "guides/observability.md",
        "CHANGELOG.md"
      ],
      groups_for_extras: [
        Guides: ~r/guides\//,
        Releases: ["CHANGELOG.md"]
      ],
      groups_for_modules: [
        Foundation: [
          Inttegro,
          Inttegro.Client,
          Inttegro.CustomData,
          Inttegro.CustomDataInput,
          Inttegro.CustomDataPatch,
          Inttegro.Errors,
          Inttegro.Telemetry,
          ~r/^Inttegro\.Client\./,
          ~r/^Inttegro\.Errors\./,
          ~r/^Inttegro\.Telemetry\./
        ],
        "Orders and payments": [
          ~r/^Inttegro\.Checkout/,
          ~r/^Inttegro\.Orders/,
          ~r/^Inttegro\.Payments/,
          ~r/^Inttegro\.PaymentMethods/,
          ~r/^Inttegro\.Refunds/,
          ~r/^Inttegro\.Invoices/
        ],
        "Customers and catalog": [
          ~r/^Inttegro\.Customers/,
          ~r/^Inttegro\.Products/,
          ~r/^Inttegro\.Prices/,
          ~r/^Inttegro\.PurchaseIntents/
        ],
        "Balances and payouts": [
          ~r/^Inttegro\.Balances/,
          ~r/^Inttegro\.BalanceTransactions/,
          ~r/^Inttegro\.FinancialAccounts/,
          ~r/^Inttegro\.BankAccounts/,
          ~r/^Inttegro\.Wallets/,
          ~r/^Inttegro\.Payouts/,
          ~r/^Inttegro\.Money/
        ],
        "Messaging and files": [
          ~r/^Inttegro\.Chimes/,
          ~r/^Inttegro\.Broadcasts/,
          ~r/^Inttegro\.MessageTemplates/,
          ~r/^Inttegro\.Otp/,
          ~r/^Inttegro\.Files/,
          ~r/^Inttegro\.FileLinks/,
          ~r/^Inttegro\.FileReferences/,
          ~r/^Inttegro\.UploadRequests/
        ],
        Platform: [
          ~r/^Inttegro\.Apps/,
          ~r/^Inttegro\.Keys/,
          ~r/^Inttegro\.Specifications/,
          ~r/^Inttegro\.Schedules/,
          ~r/^Inttegro\.Shared/
        ]
      ]
    ]
  end
end
