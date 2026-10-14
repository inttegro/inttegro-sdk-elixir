# Typed Inttegro API resource.

defmodule Inttegro.Apps do
  @moduledoc Inttegro.Docs.resource_doc(__MODULE__)
  alias Inttegro.Client

  @doc """
  Creates an Inttegro application, initial secret key, and direct parent-child relationship for the authenticated creator app.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Apps.CreateApplicationRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Apps.Application.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Apps.CreateApplicationRequest.new!(request_attributes)

      case Inttegro.Apps.create(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec create(Client.t(), Inttegro.Apps.CreateApplicationRequest.t(), keyword()) ::
          {:ok, Inttegro.Apps.Application.t()} | {:error, Exception.t()}
  def create(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/apps/create",
             Inttegro.Codec.encode(request),
             options,
             "apps.create",
             "app",
             true
           ) do
      {:ok, Inttegro.Apps.Application.from_map(value)}
    end
  end

  @doc """
  Retrieves the application associated with the API key used to authenticate the request.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Apps.Application.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      Inttegro.Apps.lookup(client)
  """
  @spec lookup(Client.t(), keyword()) ::
          {:ok, Inttegro.Apps.Application.t()} | {:error, Exception.t()}
  def lookup(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/apps/lookup",
             %{},
             options,
             "apps.lookup",
             "app",
             true
           ) do
      {:ok, Inttegro.Apps.Application.from_map(value)}
    end
  end

  @doc "Retrieves the authenticated application's payment and payout capabilities."
  @spec capabilities(Client.t(), keyword()) ::
          {:ok, Inttegro.Apps.Capabilities.t()} | {:error, Exception.t()}
  def capabilities(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/apps/capabilities",
             %{},
             options,
             "apps.capabilities",
             "capabilities",
             true
           ) do
      {:ok, Inttegro.Apps.Capabilities.from_map(value)}
    end
  end

  @doc """
  Updates one or more mutable attributes of the application associated with the API key used to authenticate the request.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Apps.UpdateApplicationRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Apps.Application.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Apps.UpdateApplicationRequest.new!(request_attributes)

      case Inttegro.Apps.update(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec update(Client.t(), Inttegro.Apps.UpdateApplicationRequest.t(), keyword()) ::
          {:ok, Inttegro.Apps.Application.t()} | {:error, Exception.t()}
  def update(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/apps/update",
             Inttegro.Codec.encode(request),
             options,
             "apps.update",
             "app",
             true
           ) do
      {:ok, Inttegro.Apps.Application.from_map(value)}
    end
  end
end
