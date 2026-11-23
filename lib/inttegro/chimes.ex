# Typed Inttegro API resource.

defmodule Inttegro.Chimes do
  @moduledoc Inttegro.Docs.resource_doc(__MODULE__)
  alias Inttegro.Client

  @doc """
  Send one SMS or email notification immediately.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Chimes.SendRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Chimes.Chime.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Chimes.SendRequest.new!(request_attributes)

      case Inttegro.Chimes.send(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec send(Client.t(), Inttegro.Chimes.SendRequest.t(), keyword()) ::
          {:ok, Inttegro.Chimes.Chime.t()} | {:error, Exception.t()}
  def send(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/chimes/send",
             Inttegro.Codec.encode(request),
             options,
             "chimes.send",
             "chime",
             true
           ) do
      {:ok, Inttegro.Chimes.Chime.from_map(value)}
    end
  end

  @doc """
  Retrieve a sent Chime and its current transmission state.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Chimes.LookupRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Chimes.Chime.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Chimes.LookupRequest.new!(request_attributes)

      case Inttegro.Chimes.lookup(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec lookup(Client.t(), Inttegro.Chimes.LookupRequest.t(), keyword()) ::
          {:ok, Inttegro.Chimes.Chime.t()} | {:error, Exception.t()}
  def lookup(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/chimes/lookup",
             Inttegro.Codec.encode(request),
             options,
             "chimes.lookup",
             "chime",
             true
           ) do
      {:ok, Inttegro.Chimes.Chime.from_map(value)}
    end
  end

  @doc """
  Retrieve Chimes, optionally filtered by customer or recipient address.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Chimes.PageRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Chimes.Page.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Chimes.PageRequest.new!(request_attributes)

      case Inttegro.Chimes.page(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec page(Client.t(), Inttegro.Chimes.PageRequest.t(), keyword()) ::
          {:ok, Inttegro.Chimes.Page.t()} | {:error, Exception.t()}
  def page(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/chimes/page",
             Inttegro.Codec.encode(request),
             options,
             "chimes.page",
             "page",
             true
           ) do
      {:ok, Inttegro.Chimes.Page.from_map(value)}
    end
  end

  @doc """
  Retrieve the effective, non-secret SMS and email delivery settings.
  """
  @spec settings(Client.t(), keyword()) ::
          {:ok, Inttegro.Chimes.Settings.t()} | {:error, Exception.t()}
  def settings(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/chimes/settings",
             %{},
             options,
             "chimes.settings",
             "settings",
             true
           ) do
      {:ok, Inttegro.Chimes.Settings.from_map(value)}
    end
  end

  @doc """
  Schedule one or more SMS or email notifications for future delivery.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Chimes.ScheduleRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Chimes.ScheduleCreationDetail.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Chimes.ScheduleRequest.new!(request_attributes)

      case Inttegro.Chimes.schedule(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec schedule(Client.t(), Inttegro.Chimes.ScheduleRequest.t(), keyword()) ::
          {:ok, Inttegro.Chimes.ScheduleCreationDetail.t()} | {:error, Exception.t()}
  def schedule(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/chimes/schedule",
             Inttegro.Codec.encode(request),
             options,
             "chimes.schedule",
             "scheduled_chime",
             true
           ) do
      {:ok, Inttegro.Chimes.ScheduleCreationDetail.from_map(value)}
    end
  end

  @doc """
  Start an asynchronous SMS or email broadcast to one or more recipients.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Chimes.BroadcastRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Chimes.BroadcastCreationDetail.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Chimes.BroadcastRequest.new!(request_attributes)

      case Inttegro.Chimes.broadcast(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec broadcast(Client.t(), Inttegro.Chimes.BroadcastRequest.t(), keyword()) ::
          {:ok, Inttegro.Chimes.BroadcastCreationDetail.t()} | {:error, Exception.t()}
  def broadcast(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/chimes/broadcast",
             Inttegro.Codec.encode(request),
             options,
             "chimes.broadcast",
             "broadcast",
             true
           ) do
      {:ok, Inttegro.Chimes.BroadcastCreationDetail.from_map(value)}
    end
  end
end
