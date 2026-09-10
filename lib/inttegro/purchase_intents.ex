# Typed Inttegro API resource.

defmodule Inttegro.PurchaseIntents do
  @moduledoc Inttegro.Docs.resource_doc(__MODULE__)
  alias Inttegro.Client

  @doc "Reports whether the purchase intent is currently active."
  @spec active?(Inttegro.PurchaseIntents.PurchaseIntent.t()) :: boolean()
  def active?(%Inttegro.PurchaseIntents.PurchaseIntent{status: status}),
    do: status in [:active, "active"]

  @doc "Reports whether the purchase intent can create at most one order."
  @spec single_use?(Inttegro.PurchaseIntents.PurchaseIntent.t()) :: boolean()
  def single_use?(%Inttegro.PurchaseIntents.PurchaseIntent{usage: usage}),
    do: usage.single_use == true

  @doc "Returns the order ID that consumed a single-use purchase intent."
  @spec used_order_id(Inttegro.PurchaseIntents.PurchaseIntent.t()) :: String.t() | nil
  def used_order_id(%Inttegro.PurchaseIntents.PurchaseIntent{} = intent) do
    order = if single_use?(intent), do: intent.usage.order

    case order do
      %{id: id} when is_binary(id) and id != "" -> id
      _ -> nil
    end
  end

  @doc """
  Creates a controlled, shareable Buy link for a catalog product without requiring you to build a product page, cart, or checkout UI. The returned `sale_...` ID becomes `https://pages.inttegro.com/buy/{purchase_intent_id}`. An order is created only when a customer checks out from that link. This operation supports idempotency. Reuse the same `Idempotency-Key` and request body when retrying an uncertain request.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.PurchaseIntents.CreateRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.PurchaseIntents.CreateRequest.new!(request_attributes)

      case Inttegro.PurchaseIntents.create(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec create(Client.t(), Inttegro.PurchaseIntents.CreateRequest.t(), keyword()) ::
          {:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()} | {:error, Exception.t()}
  def create(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/purchase_intents/create",
             Inttegro.Codec.encode(request),
             options,
             "purchase_intents.create",
             "purchase_intent",
             true
           ) do
      {:ok, Inttegro.PurchaseIntents.PurchaseIntent.from_map(value)}
    end
  end

  @doc """
  Changes quantity bounds or expiry without changing what an already-shared Buy link sells. `reactivate: true` clears cancellation state and any existing elapsed expiry. Product, price, usage mode, and variant selection remain immutable after creation. This operation supports idempotency. Reuse the same `Idempotency-Key` and request body when retrying an uncertain request.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.PurchaseIntents.UpdateRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.PurchaseIntents.UpdateRequest.new!(request_attributes)

      case Inttegro.PurchaseIntents.update(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec update(Client.t(), Inttegro.PurchaseIntents.UpdateRequest.t(), keyword()) ::
          {:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()} | {:error, Exception.t()}
  def update(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/purchase_intents/update",
             Inttegro.Codec.encode(request),
             options,
             "purchase_intents.update",
             "purchase_intent",
             true
           ) do
      {:ok, Inttegro.PurchaseIntents.PurchaseIntent.from_map(value)}
    end
  end

  @doc """
  Stops a Buy link from creating new orders immediately. Cancellation is an explicit merchant action and is distinct from time-driven expiry. Repeating cancellation for an already inactive intent returns its current state, but a single-use intent that already created an order cannot be canceled. This operation supports idempotency. Reuse the same `Idempotency-Key` and request body when retrying an uncertain request.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.PurchaseIntents.CancelRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.PurchaseIntents.CancelRequest.new!(request_attributes)

      case Inttegro.PurchaseIntents.cancel(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec cancel(Client.t(), Inttegro.PurchaseIntents.CancelRequest.t(), keyword()) ::
          {:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()} | {:error, Exception.t()}
  def cancel(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/purchase_intents/cancel",
             Inttegro.Codec.encode(request),
             options,
             "purchase_intents.cancel",
             "purchase_intent",
             true
           ) do
      {:ok, Inttegro.PurchaseIntents.PurchaseIntent.from_map(value)}
    end
  end

  @doc """
  Resolves the offer behind a hosted Buy link using only its opaque ID. Public lookup requires no API key and returns active or expired intents; canceled and used single-use intents are returned as not found. When the owning application authenticates the request, lookup is application-scoped, returns all lifecycle states, and may include recent activity.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.PurchaseIntents.LookupRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.PurchaseIntents.LookupRequest.new!(request_attributes)

      case Inttegro.PurchaseIntents.lookup(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec lookup(Client.t(), Inttegro.PurchaseIntents.LookupRequest.t(), keyword()) ::
          {:ok, Inttegro.PurchaseIntents.PurchaseIntent.t()} | {:error, Exception.t()}
  def lookup(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/purchase_intents/lookup",
             Inttegro.Codec.encode(request),
             options,
             "purchase_intents.lookup",
             "purchase_intent",
             true
           ) do
      {:ok, Inttegro.PurchaseIntents.PurchaseIntent.from_map(value)}
    end
  end

  @doc """
  Lists purchase intents for the authenticated application, newest first. Pagination is numbered. The response `page.size` is the number of records actually returned, not the requested limit, and no total count or next-page token is included.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.PurchaseIntents.PageRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.PurchaseIntents.Page.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.PurchaseIntents.PageRequest.new!(request_attributes)

      case Inttegro.PurchaseIntents.page(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec page(Client.t(), Inttegro.PurchaseIntents.PageRequest.t(), keyword()) ::
          {:ok, Inttegro.PurchaseIntents.Page.t()} | {:error, Exception.t()}
  def page(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/purchase_intents/page",
             Inttegro.Codec.encode(request),
             options,
             "purchase_intents.page",
             "page",
             true
           ) do
      {:ok, Inttegro.PurchaseIntents.Page.from_map(value)}
    end
  end
end
