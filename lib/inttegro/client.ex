defmodule Inttegro.Client.RequestOptions do
  @moduledoc """
  Options accepted by resource operations.

  Pass these values as a keyword list in the final argument of a resource function. Use
  `:idempotency_key` when a request creates or changes state; reuse the same value only when
  retrying the same logical operation. `:headers` is intended for application-owned correlation
  headers and must never be used to replace the SDK's authorization header.
  """
  defstruct idempotency_key: nil, headers: []

  @typedoc "Per-request transport options."
  @type t :: %__MODULE__{idempotency_key: String.t() | nil, headers: [{String.t(), String.t()}]}
end

defmodule Inttegro.Files.Download do
  @moduledoc """
  Original file bytes returned by `Inttegro.Files.contents/3` or `Inttegro.FileLinks.open/2`.

  `bytes` contains the complete response body. `content_type` and `filename` are derived from the
  delivery response when available. The SDK does not write files to disk automatically.
  """
  defstruct [:bytes, :content_type, :filename]

  @typedoc "Downloaded bytes and their response metadata."
  @type t :: %__MODULE__{
          bytes: binary(),
          content_type: String.t() | nil,
          filename: String.t() | nil
        }
end

defmodule Inttegro.Files.CreateRequest do
  @moduledoc """
  Binary upload input for `Inttegro.Files.create/3`.

  `file_name` is the client-visible name sent in the multipart request, `bytes` is the complete
  binary payload, and `purpose` selects the server-side file policy. Wrap open-ended `custom_data`
  values in `Inttegro.CustomDataInput`. For large inputs, account for the fact that this SDK
  currently holds the payload in memory while constructing the multipart request.
  """
  @enforce_keys [:file_name, :bytes, :purpose]
  defstruct [:file_name, :bytes, :purpose, :title, :custom_data]

  @typedoc "The bytes and metadata needed to create a file."
  @type t :: %__MODULE__{
          file_name: String.t(),
          bytes: binary(),
          purpose: String.t(),
          title: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil
        }

  @doc "Builds an upload request and raises `KeyError` when a required field is missing."
  @spec new!(map() | keyword()) :: t()
  def new!(attrs), do: struct!(__MODULE__, attrs)
end

defmodule Inttegro.UploadRequests.FulfillRequest do
  @moduledoc """
  Public binary input for `Inttegro.UploadRequests.fulfill/3`.

  The `id` and `token` identify the upload capability presented to the uploader. Fulfilment does
  not use the application's secret key. Keep the token out of logs and discard it after the upload
  reaches a terminal state.
  """
  @enforce_keys [:id, :token, :file_name, :bytes]
  defstruct [:id, :token, :file_name, :bytes]

  @typedoc "An upload-request capability and the bytes supplied through it."
  @type t :: %__MODULE__{
          id: String.t(),
          token: String.t(),
          file_name: String.t(),
          bytes: binary()
        }

  @doc "Builds a fulfilment request and raises `KeyError` when a required field is missing."
  @spec new!(map() | keyword()) :: t()
  def new!(attrs), do: struct!(__MODULE__, attrs)
end

defmodule Inttegro.FileLinks.OpenRequest do
  @moduledoc """
  Public capability used to open an Inttegro file link.

  Both the link `id` and its `token` are required. Opening a link intentionally omits the
  application's secret key, which allows the capability to be handed to its intended recipient.
  Treat the token as sensitive until the link expires or is revoked.
  """
  @enforce_keys [:id, :token]
  defstruct [:id, :token]
  @typedoc "The ID and token required to open a file link."
  @type t :: %__MODULE__{id: String.t(), token: String.t()}

  @doc "Builds an open request and raises `KeyError` when the ID or token is missing."
  @spec new!(map() | keyword()) :: t()
  def new!(attrs), do: struct!(__MODULE__, attrs)
end

defmodule Inttegro.Telemetry.SDKContext do
  @moduledoc """
  Identifies the SDK implementation and version that produced an error report.

  Use this context when grouping failures across language SDKs or correlating a decoding problem
  with a particular released contract. It contains no application or customer identity.
  """
  @enforce_keys [:language, :version]
  defstruct [:language, :version]

  @type t :: %__MODULE__{language: String.t(), version: String.t()}
end

defimpl Jason.Encoder, for: Inttegro.Telemetry.SDKContext do
  def encode(value, options) do
    Jason.Encode.map(%{"language" => value.language, "version" => value.version}, options)
  end
end

defmodule Inttegro.Telemetry.HTTPContext do
  @moduledoc """
  Privacy-safe HTTP metadata included in an error report.

  The route is the static SDK route rather than a URL containing identifiers or query parameters.
  The request ID comes from the Inttegro response and can be used for support correlation.
  """
  @enforce_keys [:method, :server_address, :duration_ms]
  defstruct [:method, :route, :server_address, :status_code, :request_id, :duration_ms]

  @type t :: %__MODULE__{
          method: String.t(),
          route: String.t() | nil,
          server_address: String.t(),
          status_code: integer() | nil,
          request_id: String.t() | nil,
          duration_ms: non_neg_integer()
        }
end

defimpl Jason.Encoder, for: Inttegro.Telemetry.HTTPContext do
  def encode(value, options) do
    Jason.Encode.map(
      %{
        "method" => value.method,
        "route" => value.route,
        "serverAddress" => value.server_address,
        "statusCode" => value.status_code,
        "requestId" => value.request_id,
        "durationMs" => value.duration_ms
      },
      options
    )
  end
end

defmodule Inttegro.Telemetry.APIErrorContext do
  @moduledoc """
  Structured, safe Inttegro API error details included in an error report.

  The fields are stable machine-readable classifications intended for grouping and recovery. Raw
  response bodies and human-readable error messages are deliberately excluded.
  """
  defstruct [:type, :code, :fix_code]

  @type t :: %__MODULE__{
          type: String.t() | nil,
          code: String.t() | nil,
          fix_code: String.t() | nil
        }
end

defimpl Jason.Encoder, for: Inttegro.Telemetry.APIErrorContext do
  def encode(value, options) do
    Jason.Encode.map(
      %{"type" => value.type, "code" => value.code, "fixCode" => value.fix_code},
      options
    )
  end
end

defmodule Inttegro.Telemetry.TraceContext do
  @moduledoc """
  Optional distributed-trace identifiers attached by the host integration.

  Trace and span IDs let an application correlate a privacy-safe SDK report with its own trace. The
  SDK does not create or export spans and leaves this context empty unless an integration supplies it.
  """
  @enforce_keys [:trace_id, :span_id]
  defstruct [:trace_id, :span_id]

  @type t :: %__MODULE__{trace_id: String.t(), span_id: String.t()}
end

defimpl Jason.Encoder, for: Inttegro.Telemetry.TraceContext do
  def encode(value, options) do
    Jason.Encode.map(%{"traceId" => value.trace_id, "spanId" => value.span_id}, options)
  end
end

defmodule Inttegro.Telemetry.ErrorReport do
  @moduledoc """
  A privacy-safe failure report delivered to an application-owned reporter.

  Reports describe the logical SDK operation, static route, duration, safe API codes, request ID,
  and SDK identity. They deliberately exclude credentials, headers, bodies, resource IDs, dynamic
  URLs, error messages, and stack traces. No report is constructed unless a reporter is configured.
  """
  @enforce_keys [
    :schema_version,
    :event_id,
    :occurred_at,
    :severity,
    :category,
    :operation,
    :sdk,
    :http,
    :exception_type,
    :fingerprint
  ]
  defstruct [
    :schema_version,
    :event_id,
    :occurred_at,
    :severity,
    :category,
    :operation,
    :sdk,
    :http,
    :api_error,
    :trace,
    :exception_type,
    :fingerprint
  ]

  @type t :: %__MODULE__{
          schema_version: pos_integer(),
          event_id: String.t(),
          occurred_at: String.t(),
          severity: String.t(),
          category: String.t(),
          operation: String.t(),
          sdk: Inttegro.Telemetry.SDKContext.t(),
          http: Inttegro.Telemetry.HTTPContext.t(),
          api_error: Inttegro.Telemetry.APIErrorContext.t() | nil,
          trace: Inttegro.Telemetry.TraceContext.t() | nil,
          exception_type: String.t(),
          fingerprint: String.t()
        }
end

defimpl Jason.Encoder, for: Inttegro.Telemetry.ErrorReport do
  def encode(value, options) do
    Jason.Encode.map(
      %{
        "schemaVersion" => value.schema_version,
        "eventId" => value.event_id,
        "occurredAt" => value.occurred_at,
        "severity" => value.severity,
        "category" => value.category,
        "operation" => value.operation,
        "sdk" => value.sdk,
        "http" => value.http,
        "apiError" => value.api_error,
        "trace" => value.trace,
        "exceptionType" => value.exception_type,
        "fingerprint" => value.fingerprint
      },
      options
    )
  end
end

defmodule Inttegro.Errors.APIError do
  @moduledoc """
  An unsuccessful HTTP response returned by the Inttegro API.

  `status` is the HTTP status, `code`, `type`, and `fix_code` are structured recovery hints when the
  endpoint provides them, and `request_id` identifies the server request for support and tracing.
  The optional `report` is present only when error reporting is configured for this failure class.
  """
  defexception [:status, :code, :type, :fix_code, :request_id, :report]
  @impl true
  def message(error),
    do: "Inttegro API request failed with status #{error.status} (#{error.code})"
end

defmodule Inttegro.Errors.TransportError do
  @moduledoc """
  A failure to send a request to, or receive a response from, the Inttegro API.

  Transport failures have no authoritative API outcome. Retry only when the operation is safe to
  repeat, and reuse its idempotency key for mutations.
  """
  defexception [:reason]
  @impl true
  def message(error), do: "Inttegro transport failed: #{inspect(error.reason)}"
end

defmodule Inttegro.Errors.DecodingError do
  @moduledoc """
  A successful HTTP response that could not be decoded into its documented domain type.

  This normally indicates contract drift or a malformed upstream response. Treat it as an
  unexpected SDK failure and retain the corresponding request ID or error report for diagnosis.
  """
  defexception [:reason]
  @impl true
  def message(error), do: "Inttegro response could not be decoded: #{inspect(error.reason)}"
end

defmodule Inttegro.Client do
  @moduledoc """
  Configures transport, authentication, telemetry, and error reporting for Inttegro operations.

  The client is a plain immutable struct, not a process. Create it once in your application
  supervision tree or runtime configuration and safely share it between callers. Resource modules
  such as `Inttegro.Orders` receive the client as their first argument.

  ## Creating a client

      client = Inttegro.Client.new!(System.fetch_env!("INTTEGRO_API_KEY"))

  `new!/2` accepts:

  * `:base_url` — alternate API origin, primarily for tests. Defaults to
    `https://api.inttegro.com`.
  * `:http` — a configured `Req.Request` used as the transport.
  * `:telemetry` — a one-argument callback receiving privacy-safe lifecycle event maps.
  * `:error_reporter` — a one-argument callback receiving
    `Inttegro.Telemetry.ErrorReport.t()` values.
  * `:error_reporting_policy` — `:unexpected` (the default) or `:all`.

  The SDK does not configure an exporter or send reports to Inttegro on its own. See the
  Observability guide for the event contract and privacy guarantees.
  """
  @version "0.6.0"
  @enforce_keys [:api_key, :base_url, :http]
  defstruct [
    :api_key,
    :base_url,
    :http,
    :telemetry,
    :error_reporter,
    error_reporting_policy: :unexpected
  ]

  @typedoc "A configured Inttegro API client."
  @type t :: %__MODULE__{
          api_key: String.t(),
          base_url: String.t(),
          http: Req.Request.t(),
          telemetry: (map() -> term()) | nil,
          error_reporter: (Inttegro.Telemetry.ErrorReport.t() -> term()) | nil,
          error_reporting_policy: :unexpected | :all
        }

  @doc """
  Creates a client from a server-side secret key.

  Raises `ArgumentError` when `api_key` is empty. Keep the key in environment-backed secret
  configuration; never embed it in browser JavaScript or a mobile application.
  """
  @spec new!(String.t(), keyword()) :: t()
  def new!(api_key, options \\ []) when is_binary(api_key) do
    if String.trim(api_key) == "", do: raise(ArgumentError, "api key cannot be empty")

    base_url =
      Keyword.get(options, :base_url, "https://api.inttegro.com") |> String.trim_trailing("/")

    %__MODULE__{
      api_key: api_key,
      base_url: base_url,
      http: Keyword.get_lazy(options, :http, fn -> Req.new(base_url: base_url, retry: false) end),
      telemetry: options[:telemetry],
      error_reporter: options[:error_reporter],
      error_reporting_policy: Keyword.get(options, :error_reporting_policy, :unexpected)
    }
  end

  @doc false
  def request(client, method, path, body, options, operation, field, authenticated) do
    started = System.monotonic_time(:millisecond)
    headers = headers(client, options, authenticated)
    record(client, "inttegro.request.prepared", operation, method, path, nil, started)

    case Req.request(client.http,
           method: method |> String.downcase() |> String.to_existing_atom(),
           url: path,
           json: body,
           headers: headers
         ) do
      {:ok, %{status: status, body: response_body, headers: response_headers}}
      when status in 200..299 ->
        record(client, "inttegro.response.received", operation, method, path, status, started)

        case select(response_body, field) do
          {:ok, _value} = result ->
            record(client, "inttegro.response.decoded", operation, method, path, status, started)
            result

          {:error, %Inttegro.Errors.DecodingError{}} = result ->
            _ =
              finish_failure(
                client,
                operation,
                method,
                path,
                started,
                status,
                header(response_headers, "x-request-id"),
                nil,
                "decoding",
                nil
              )

            result
        end

      {:ok, %{status: status, body: response_body, headers: response_headers}} ->
        record(client, "inttegro.response.received", operation, method, path, status, started)

        detail =
          if is_map(response_body), do: Map.get(response_body, "error", response_body), else: %{}

        code = Map.get(detail, "code", "api_error")
        type = Map.get(detail, "type")
        fix_code = Map.get(detail, "fix_code")
        request_id = header(response_headers, "x-request-id")

        report =
          finish_failure(
            client,
            operation,
            method,
            path,
            started,
            status,
            request_id,
            code,
            type || "api",
            fix_code
          )

        {:error,
         %Inttegro.Errors.APIError{
           status: status,
           code: code,
           type: type,
           fix_code: fix_code,
           request_id: request_id,
           report: report
         }}

      {:error, reason} ->
        _ =
          finish_failure(
            client,
            operation,
            method,
            path,
            started,
            nil,
            nil,
            nil,
            "transport",
            nil
          )

        {:error, %Inttegro.Errors.TransportError{reason: reason}}
    end
  end

  @doc false
  def download(client, method, path, body, options, operation, authenticated) do
    started = System.monotonic_time(:millisecond)
    record(client, "inttegro.request.prepared", operation, method, path, nil, started)

    case Req.request(client.http,
           method: method |> String.downcase() |> String.to_existing_atom(),
           url: path,
           json: body,
           headers: headers(client, options, authenticated),
           decode_body: false
         ) do
      {:ok, %{status: status, body: bytes, headers: response_headers}} when status in 200..299 ->
        record(client, "inttegro.response.received", operation, method, path, status, started)

        {:ok,
         %Inttegro.Files.Download{
           bytes: bytes,
           content_type: header(response_headers, "content-type")
         }}

      {:ok, %{status: status, headers: response_headers}} ->
        record(client, "inttegro.response.received", operation, method, path, status, started)
        request_id = header(response_headers, "x-request-id")

        report =
          finish_failure(
            client,
            operation,
            method,
            path,
            started,
            status,
            request_id,
            "download_failed",
            "api",
            nil
          )

        {:error,
         %Inttegro.Errors.APIError{
           status: status,
           code: "download_failed",
           request_id: request_id,
           report: report
         }}

      {:error, reason} ->
        _ =
          finish_failure(
            client,
            operation,
            method,
            path,
            started,
            nil,
            nil,
            nil,
            "transport",
            nil
          )

        {:error, %Inttegro.Errors.TransportError{reason: reason}}
    end
  end

  @doc false
  def upload_file(client, path, request, options, operation, field) do
    {body, content_type} =
      multipart(request.file_name, request.bytes, %{
        "purpose" => request.purpose,
        "title" => request.title,
        "custom_data" =>
          request.custom_data && Jason.encode!(Inttegro.Codec.encode(request.custom_data))
      })

    upload(client, path, body, content_type, [], options, operation, field, true)
  end

  @doc false
  def fulfill_upload(client, path, request, options, operation) do
    {body, content_type} = multipart(request.file_name, request.bytes, %{})

    upload(
      client,
      path,
      body,
      content_type,
      [id: request.id, token: request.token],
      options,
      operation,
      nil,
      false
    )
  end

  @doc false
  def open_file_link(client, path, request, operation) do
    started = System.monotonic_time(:millisecond)
    record(client, "inttegro.request.prepared", operation, "GET", path, nil, started)

    case Req.get(client.http,
           url: path,
           params: [id: request.id, token: request.token],
           headers: [{"user-agent", "inttegro-elixir/#{@version}"}],
           decode_body: false
         ) do
      {:ok, %{status: status, body: bytes, headers: response_headers}} when status in 200..299 ->
        record(client, "inttegro.response.received", operation, "GET", path, status, started)

        {:ok,
         %Inttegro.Files.Download{
           bytes: bytes,
           content_type: header(response_headers, "content-type")
         }}

      {:ok, %{status: status, headers: response_headers}} ->
        record(client, "inttegro.response.received", operation, "GET", path, status, started)
        request_id = header(response_headers, "x-request-id")

        report =
          finish_failure(
            client,
            operation,
            "GET",
            path,
            started,
            status,
            request_id,
            "file_link_failed",
            "api",
            nil
          )

        {:error,
         %Inttegro.Errors.APIError{
           status: status,
           code: "file_link_failed",
           request_id: request_id,
           report: report
         }}

      {:error, reason} ->
        _ =
          finish_failure(
            client,
            operation,
            "GET",
            path,
            started,
            nil,
            nil,
            nil,
            "transport",
            nil
          )

        {:error, %Inttegro.Errors.TransportError{reason: reason}}
    end
  end

  defp upload(client, path, body, content_type, params, options, operation, field, authenticated) do
    started = System.monotonic_time(:millisecond)
    record(client, "inttegro.request.prepared", operation, "POST", path, nil, started)

    case Req.post(client.http,
           url: path,
           params: params,
           body: body,
           headers: [{"content-type", content_type} | headers(client, options, authenticated)]
         ) do
      {:ok, %{status: status, body: response_body, headers: response_headers}}
      when status in 200..299 ->
        record(client, "inttegro.response.received", operation, "POST", path, status, started)

        case select(response_body, field) do
          {:ok, _value} = result ->
            record(client, "inttegro.response.decoded", operation, "POST", path, status, started)
            result

          {:error, %Inttegro.Errors.DecodingError{}} = result ->
            _ =
              finish_failure(
                client,
                operation,
                "POST",
                path,
                started,
                status,
                header(response_headers, "x-request-id"),
                nil,
                "decoding",
                nil
              )

            result
        end

      {:ok, %{status: status, headers: response_headers}} ->
        record(client, "inttegro.response.received", operation, "POST", path, status, started)
        request_id = header(response_headers, "x-request-id")

        report =
          finish_failure(
            client,
            operation,
            "POST",
            path,
            started,
            status,
            request_id,
            "upload_failed",
            "api",
            nil
          )

        {:error,
         %Inttegro.Errors.APIError{
           status: status,
           code: "upload_failed",
           request_id: request_id,
           report: report
         }}

      {:error, reason} ->
        _ =
          finish_failure(
            client,
            operation,
            "POST",
            path,
            started,
            nil,
            nil,
            nil,
            "transport",
            nil
          )

        {:error, %Inttegro.Errors.TransportError{reason: reason}}
    end
  end

  defp select(value, nil), do: {:ok, value}

  defp select(value, field) when is_map(value) do
    case Map.fetch(value, field) do
      {:ok, selected} ->
        {:ok, selected}

      :error ->
        {:error, %Inttegro.Errors.DecodingError{reason: "missing #{field} in Inttegro response"}}
    end
  end

  defp headers(client, options, authenticated) do
    options = struct(Inttegro.Client.RequestOptions, options)
    base = [{"user-agent", "inttegro-elixir/#{@version}"} | options.headers]

    base =
      if authenticated, do: [{"authorization", "Bearer #{client.api_key}"} | base], else: base

    if options.idempotency_key,
      do: [{"idempotency-key", options.idempotency_key} | base],
      else: base
  end

  defp header(headers, name) do
    headers
    |> Enum.find_value(fn {key, value} ->
      if String.downcase(to_string(key)) == name, do: List.first(List.wrap(value))
    end)
  end

  defp multipart(file_name, bytes, fields) do
    boundary = "inttegro-#{System.unique_integer([:positive])}"

    field_parts =
      fields
      |> Enum.reject(fn {_name, value} -> is_nil(value) end)
      |> Enum.map(fn {name, value} ->
        "--#{boundary}\r\nContent-Disposition: form-data; name=\"#{name}\"\r\n\r\n#{value}\r\n"
      end)

    body =
      IO.iodata_to_binary([
        field_parts,
        "--#{boundary}\r\nContent-Disposition: form-data; name=\"file\"; filename=\"#{file_name}\"\r\nContent-Type: application/octet-stream\r\n\r\n",
        bytes,
        "\r\n--#{boundary}--\r\n"
      ])

    {body, "multipart/form-data; boundary=#{boundary}"}
  end

  defp record(%{telemetry: nil}, _name, _operation, _method, _route, _status, _started), do: :ok

  defp record(client, name, operation, method, route, status, started) do
    try do
      client.telemetry.(%{
        name: name,
        operation: operation,
        method: method,
        route: route,
        status_code: status,
        duration_ms: System.monotonic_time(:millisecond) - started
      })
    rescue
      _ -> :ok
    catch
      _, _ -> :ok
    end
  end

  defp finish_failure(
         client,
         operation,
         method,
         route,
         started,
         status,
         request_id,
         code,
         category,
         fix_code
       ) do
    record(client, "inttegro.request.failed", operation, method, route, status, started)

    if is_nil(client.error_reporter) or
         (client.error_reporting_policy == :unexpected and is_integer(status) and status < 500 and
            category not in ["decoding", "unknown_error"]) do
      nil
    else
      api_error =
        if status,
          do: %Inttegro.Telemetry.APIErrorContext{type: category, code: code, fix_code: fix_code}

      report = %Inttegro.Telemetry.ErrorReport{
        schema_version: 1,
        event_id: Integer.to_string(System.unique_integer([:positive, :monotonic])),
        occurred_at: DateTime.utc_now() |> DateTime.to_iso8601(),
        severity: "error",
        category: category,
        operation: operation,
        sdk: %Inttegro.Telemetry.SDKContext{language: "elixir", version: @version},
        http: %Inttegro.Telemetry.HTTPContext{
          method: String.upcase(method),
          route: route,
          server_address: client.base_url,
          status_code: status,
          request_id: request_id,
          duration_ms: System.monotonic_time(:millisecond) - started
        },
        api_error: api_error,
        trace: nil,
        exception_type:
          if(status, do: "Inttegro.Errors.APIError", else: "Inttegro.Errors.TransportError"),
        fingerprint: "inttegro:elixir:#{operation}:#{category}:#{status || "none"}"
      }

      try do
        client.error_reporter.(report)
      rescue
        _ -> :ok
      catch
        _, _ -> :ok
      end

      report
    end
  end
end
