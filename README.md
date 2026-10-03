# Inttegro Elixir SDK

The official typed Elixir client for server-side Inttegro integrations.

[API documentation](https://hexdocs.pm/inttegro/) · [Integration guides](https://studio.inttegro.com/sdks/elixir) · [Source](https://github.com/inttegro/inttegro-sdk-elixir)

## Install

Add `inttegro` to your dependencies:

```elixir
def deps do
  [
    {:inttegro, "~> 0.8"}
  ]
end
```

Fetch the package:

```console
mix deps.get
```

Store your Inttegro secret key in the server environment:

```console
export INTTEGRO_API_KEY="your_secret_key"
```

Never put this key in browser code, a mobile application, source control, or logs. The client uses
`https://api.inttegro.com` unless you explicitly configure another origin.

## Make your first request

Create one client and pass it to the resource module you need:

```elixir
client = Inttegro.Client.new!(System.fetch_env!("INTTEGRO_API_KEY"))
request = Inttegro.Orders.LookupRequest.new!(order_id: "or_...")

case Inttegro.Orders.lookup(client, request) do
  {:ok, order} ->
    IO.inspect(order.status, label: "order status")

  {:error, %Inttegro.Errors.APIError{} = error} ->
    IO.warn("Inttegro rejected the request: #{error.code}")

  {:error, %Inttegro.Errors.TransportError{} = error} ->
    IO.warn("Inttegro could not be reached: #{Exception.message(error)}")
end
```

The client is a plain immutable struct. It does not start a process and can be safely shared between
requests, tasks, and supervised application components.

## API organization

The package follows Elixir module conventions instead of placing hundreds of unrelated schemas in
the root namespace:

| Concern | Operations | Representative values |
| --- | --- | --- |
| Orders and payment | `Inttegro.Orders` | `Inttegro.Orders.Order`, `Inttegro.Payments.Payment` |
| Customers and saved methods | `Inttegro.Customers`, `Inttegro.PaymentMethods` | `Inttegro.Customers.Customer`, `Inttegro.PaymentMethods.PaymentMethod` |
| Catalog | `Inttegro.Products`, `Inttegro.Prices`, `Inttegro.PurchaseIntents` | Domain values below the corresponding operation module |
| Funds | `Inttegro.Balances`, `Inttegro.BalanceTransactions`, `Inttegro.Payouts`, `Inttegro.Refunds` | Ledger, payout, and refund values below their domains |
| Messaging | `Inttegro.Chimes`, `Inttegro.Broadcasts`, `Inttegro.MessageTemplates` | Delivery and template values below their domains |
| Files | `Inttegro.Files`, `Inttegro.FileLinks`, `Inttegro.UploadRequests` | File metadata, downloads, links, and upload capabilities |
| Platform | `Inttegro.Apps`, `Inttegro.Keys`, `Inttegro.Specifications` | Application, credential, and country capability values |

Resource functions return `{:ok, domain_value}` or `{:error, exception}`. HTTP envelopes and JSON
codec helpers are private implementation details.

## Safe retries

Supply an idempotency key for every logical mutation:

```elixir
Inttegro.Customers.create(client, request,
  idempotency_key: "create-customer-account-8342"
)
```

Reuse that key only when retrying the same operation with the same intent. A transport error does
not prove that the server rejected the request, so mutations without stable idempotency cannot be
retried safely.

## Errors

Pattern match on the failure class:

```elixir
case Inttegro.Refunds.lookup(client, request) do
  {:ok, refund} ->
    refund

  {:error, %Inttegro.Errors.APIError{status: 404}} ->
    :not_found

  {:error, %Inttegro.Errors.APIError{} = error} ->
    {:rejected, error.code, error.fix_code}

  {:error, %Inttegro.Errors.TransportError{}} ->
    :outcome_unknown

  {:error, %Inttegro.Errors.DecodingError{}} ->
    :contract_mismatch
end
```

API errors include the HTTP status and safe structured codes when available. They never expose the
secret key or raw request body.

## Observability

The SDK can send privacy-safe lifecycle events to a callback owned by your application:

```elixir
client =
  Inttegro.Client.new!(System.fetch_env!("INTTEGRO_API_KEY"),
    telemetry: fn event -> MyApp.Telemetry.record(event) end,
    error_reporter: fn report -> MyApp.ErrorReporter.enqueue(report) end
  )
```

No exporter is installed and no error report is constructed unless you configure these callbacks.
Events exclude API keys, headers, bodies, resource IDs, dynamic URLs, error messages, and stack
traces. See the Observability guide for the event names and policy controls.

## Learn the workflows

HexDocs includes guides for:

* getting started and configuring the client;
* creating orders and reconciling asynchronous payments;
* API errors, transport uncertainty, and idempotent retries;
* file uploads, delivery, links, and upload requests; and
* telemetry and application-owned error reporting.

The [Studio API reference](https://studio.inttegro.com/api-reference) remains authoritative for HTTP
contracts and business rules. The HexDocs reference explains the Elixir types and how they work
together.
