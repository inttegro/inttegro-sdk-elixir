defmodule Inttegro.BankAccounts do
  @moduledoc Inttegro.Docs.namespace_doc(__MODULE__)
end

defmodule Inttegro.Checkout do
  @moduledoc Inttegro.Docs.namespace_doc(__MODULE__)
end

defmodule Inttegro.Errors do
  @moduledoc """
  Failure classes returned by Inttegro resource operations.

  `Inttegro.Errors.APIError` represents an unsuccessful server response,
  `Inttegro.Errors.TransportError` represents an unknown network outcome, and
  `Inttegro.Errors.DecodingError` represents a response that did not match the SDK contract. Match
  these classes separately because they require different recovery behavior.

  See the Errors and retries guide before adding automatic retries to financial mutations.
  """
end

defmodule Inttegro.Invoices do
  @moduledoc Inttegro.Docs.namespace_doc(__MODULE__)
end

defmodule Inttegro.Money do
  @moduledoc """
  Currency and amount values shared by commerce and money-movement APIs.

  Inttegro represents amounts as integers in the currency's minor unit. For example, a value of
  `5_000` with currency `:ghs` represents GHS 50.00. Never use floating-point arithmetic for an
  amount sent to the API.
  """
end

defmodule Inttegro.Shared do
  @moduledoc Inttegro.Docs.namespace_doc(__MODULE__)
end

defmodule Inttegro.Telemetry do
  @moduledoc """
  Privacy-safe lifecycle and error-reporting values emitted to application-owned callbacks.

  The SDK does not install an exporter or transmit these records by itself. Configure callbacks in
  `Inttegro.Client.new!/2`, then decide how your application maps them into logs, metrics, traces, or
  an error collector. See the Observability guide for event names and excluded data.
  """
end

defmodule Inttegro.Wallets do
  @moduledoc Inttegro.Docs.namespace_doc(__MODULE__)
end
