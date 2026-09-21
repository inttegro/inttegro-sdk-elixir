# Typed Inttegro API resource.

defmodule Inttegro.Payouts do
  @moduledoc Inttegro.Docs.resource_doc(__MODULE__)
  alias Inttegro.Client

  @doc """
  Create and schedule a payout to move funds from your available balance to a connected financial account. The request chooses the destination, caps the maximum amount that may leave your balance, and optionally delays execution until a future timestamp.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Payouts.ScheduleRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.Payout.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Payouts.ScheduleRequest.new!(request_attributes)

      case Inttegro.Payouts.schedule(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec schedule(Client.t(), Inttegro.Payouts.ScheduleRequest.t(), keyword()) ::
          {:ok, Inttegro.Payouts.Payout.t()} | {:error, Exception.t()}
  def schedule(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/schedule",
             Inttegro.Codec.encode(request),
             options,
             "payouts.schedule",
             "payout",
             true
           ) do
      {:ok, Inttegro.Payouts.Payout.from_map(value)}
    end
  end

  @doc """
  Retrieve the current state of a payout by ID. Use this to monitor execution, inspect timestamps, review bundled balance transactions, and reconcile the final amount that moved to the destination account.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Payouts.LookupRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.Payout.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Payouts.LookupRequest.new!(request_attributes)

      case Inttegro.Payouts.lookup(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec lookup(Client.t(), Inttegro.Payouts.LookupRequest.t(), keyword()) ::
          {:ok, Inttegro.Payouts.Payout.t()} | {:error, Exception.t()}
  def lookup(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/lookup",
             Inttegro.Codec.encode(request),
             options,
             "payouts.lookup",
             "payout",
             true
           ) do
      {:ok, Inttegro.Payouts.Payout.from_map(value)}
    end
  end

  @doc """
  Configure which financial account should be used for payouts in each currency. This endpoint accepts a map of currency codes to financial account IDs. Each financial account must be owned by your application, have push operations enabled, and its currency must match the currency key in the destinations map.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Payouts.SetDestinationsRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.SettingsMutation.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Payouts.SetDestinationsRequest.new!(request_attributes)

      case Inttegro.Payouts.set_destinations(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec set_destinations(Client.t(), Inttegro.Payouts.SetDestinationsRequest.t(), keyword()) ::
          {:ok, Inttegro.Payouts.SettingsMutation.t()} | {:error, Exception.t()}
  def set_destinations(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/set_destinations",
             Inttegro.Codec.encode(request),
             options,
             "payouts.set_destinations",
             "settings",
             true
           ) do
      {:ok, Inttegro.Payouts.SettingsMutation.from_map(value)}
    end
  end

  @doc """
  Retrieve the current payout settings for your application, including configured payout destinations and schedule information.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.SettingsLookup.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      Inttegro.Payouts.settings(client)
  """
  @spec settings(Client.t(), keyword()) ::
          {:ok, Inttegro.Payouts.SettingsLookup.t()} | {:error, Exception.t()}
  def settings(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/settings",
             %{},
             options,
             "payouts.settings",
             "settings",
             true
           ) do
      {:ok, Inttegro.Payouts.SettingsLookup.from_map(value)}
    end
  end

  @doc """
  Disables automatic payouts for your application by switching the payout schedule to manual mode. When automatic payouts are disabled, the system will not automatically schedule payouts - you must manually trigger them using the /payouts/schedule endpoint. Balance transactions must still be at least 7 days old before they can be paid out, but the payout will only occur when you explicitly request it.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.SettingsMutation.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      Inttegro.Payouts.disable(client)
  """
  @spec disable(Client.t(), keyword()) ::
          {:ok, Inttegro.Payouts.SettingsMutation.t()} | {:error, Exception.t()}
  def disable(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/disable",
             %{},
             options,
             "payouts.disable",
             "settings",
             true
           ) do
      {:ok, Inttegro.Payouts.SettingsMutation.from_map(value)}
    end
  end

  @doc """
  Re-enable automatic payouts for your application. Inttegro restores the configured automatic payout schedule so eligible balance transactions can be queued without a manual scheduling request.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.SettingsMutation.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      Inttegro.Payouts.enable(client)
  """
  @spec enable(Client.t(), keyword()) ::
          {:ok, Inttegro.Payouts.SettingsMutation.t()} | {:error, Exception.t()}
  def enable(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/enable",
             %{},
             options,
             "payouts.enable",
             "settings",
             true
           ) do
      {:ok, Inttegro.Payouts.SettingsMutation.from_map(value)}
    end
  end

  @doc """
  Retrieve a page of payouts for the authenticated application.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Payouts.PageRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.Page.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Payouts.PageRequest.new!(request_attributes)

      case Inttegro.Payouts.page(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec page(Client.t(), Inttegro.Payouts.PageRequest.t(), keyword()) ::
          {:ok, Inttegro.Payouts.Page.t()} | {:error, Exception.t()}
  def page(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/page",
             Inttegro.Codec.encode(request),
             options,
             "payouts.page",
             "page",
             true
           ) do
      {:ok, Inttegro.Payouts.Page.from_map(value)}
    end
  end

  @doc """
  Cancel a payout that is still scheduled for a future execution time. A payout that has started processing, completed, was already canceled, or whose execution time has passed cannot be canceled.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Payouts.CancelRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Payouts.Payout.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Payouts.CancelRequest.new!(request_attributes)

      case Inttegro.Payouts.cancel(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec cancel(Client.t(), Inttegro.Payouts.CancelRequest.t(), keyword()) ::
          {:ok, Inttegro.Payouts.Payout.t()} | {:error, Exception.t()}
  def cancel(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/cancel",
             Inttegro.Codec.encode(request),
             options,
             "payouts.cancel",
             "payout",
             true
           ) do
      {:ok, Inttegro.Payouts.Payout.from_map(value)}
    end
  end

  @doc "Search payouts with a typed resource-local query."
  @spec search(Client.t(), Inttegro.Search.Request.t(), keyword()) ::
          {:ok, Inttegro.Search.Page.t()} | {:error, Exception.t()}
  def search(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/payouts/search",
             Inttegro.Codec.encode(request),
             options,
             "payouts.search",
             "search",
             true
           ) do
      {:ok, Inttegro.Search.Page.from_map(value)}
    end
  end
end
