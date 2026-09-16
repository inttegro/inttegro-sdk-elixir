# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.UploadRequests.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :pending | :uploading | :fulfilled | :expired | :canceled | :failed | String.t()
  @values %{
    pending: "pending",
    uploading: "uploading",
    fulfilled: "fulfilled",
    expired: "expired",
    canceled: "canceled",
    failed: "failed"
  }
  @doc Inttegro.Docs.enum_values_doc(__MODULE__)
  @spec values() :: [t()]
  def values, do: Map.keys(@values)
  @doc false
  @spec encode(t()) :: String.t()
  def encode(value) when is_atom(value), do: Map.fetch!(@values, value)
  def encode(value) when is_binary(value), do: value
  @doc false
  @spec decode(String.t()) :: t()
  def decode(value),
    do: Enum.find_value(@values, value, fn {key, wire} -> if wire == value, do: key end)
end

defmodule Inttegro.UploadRequests.UploadReviewDecision do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :approved | :rejected | String.t()
  @values %{
    approved: "approved",
    rejected: "rejected"
  }
  @doc Inttegro.Docs.enum_values_doc(__MODULE__)
  @spec values() :: [t()]
  def values, do: Map.keys(@values)
  @doc false
  @spec encode(t()) :: String.t()
  def encode(value) when is_atom(value), do: Map.fetch!(@values, value)
  def encode(value) when is_binary(value), do: value
  @doc false
  @spec decode(String.t()) :: t()
  def decode(value),
    do: Enum.find_value(@values, value, fn {key, wire} -> if wire == value, do: key end)
end

defmodule Inttegro.UploadRequests.UploadReviewType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :automatic | :manual | String.t()
  @values %{
    automatic: "automatic",
    manual: "manual"
  }
  @doc Inttegro.Docs.enum_values_doc(__MODULE__)
  @spec values() :: [t()]
  def values, do: Map.keys(@values)
  @doc false
  @spec encode(t()) :: String.t()
  def encode(value) when is_atom(value), do: Map.fetch!(@values, value)
  def encode(value) when is_binary(value), do: value
  @doc false
  @spec decode(String.t()) :: t()
  def decode(value),
    do: Enum.find_value(@values, value, fn {key, wire} -> if wire == value, do: key end)
end

defmodule Inttegro.UploadRequests.ReviewAttemptRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.UploadRequests.ReviewAttemptByIDRequest.t()
          | Inttegro.UploadRequests.ReviewAttemptByOrdinalRequest.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.UploadRequests.ReviewAttemptByIDRequest,
        Inttegro.UploadRequests.ReviewAttemptByOrdinalRequest
      ],
      value,
      fn module ->
        try do
          module.from_map(value)
        rescue
          _ -> nil
        end
      end
    )
  end
end

defmodule Inttegro.UploadRequests.CancelRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:id]
  defstruct canceled_by: nil, id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          canceled_by: Inttegro.Files.ActorInput.t() | nil,
          id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      canceled_by:
        if(is_nil(Map.get(map, "canceled_by")),
          do: nil,
          else: Inttegro.Files.ActorInput.from_map(Map.get(map, "canceled_by"))
        ),
      id: Map.fetch!(map, "id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "canceled_by" =>
        if(is_nil(value.canceled_by), do: nil, else: Inttegro.Codec.encode(value.canceled_by)),
      "id" => Inttegro.Codec.encode(value.id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:purpose]
  defstruct constraints: nil,
            display: nil,
            subject: nil,
            recipient: nil,
            resource: nil,
            requester: nil,
            attempts: nil,
            custom_data: nil,
            expires_at: nil,
            purpose: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          constraints: Inttegro.UploadRequests.ConstraintsInput.t() | nil,
          display: Inttegro.UploadRequests.DisplayInput.t() | nil,
          subject: Inttegro.Files.PartyInput.t() | nil,
          recipient: Inttegro.Files.PartyInput.t() | nil,
          resource: Inttegro.Files.ResourceInput.t() | nil,
          requester: Inttegro.Files.ActorInput.t() | nil,
          attempts: Inttegro.UploadRequests.AttemptsRequest.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          expires_at: DateTime.t() | nil,
          purpose: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      constraints:
        if(is_nil(Map.get(map, "constraints")),
          do: nil,
          else: Inttegro.UploadRequests.ConstraintsInput.from_map(Map.get(map, "constraints"))
        ),
      display:
        if(is_nil(Map.get(map, "display")),
          do: nil,
          else: Inttegro.UploadRequests.DisplayInput.from_map(Map.get(map, "display"))
        ),
      subject:
        if(is_nil(Map.get(map, "subject")),
          do: nil,
          else: Inttegro.Files.PartyInput.from_map(Map.get(map, "subject"))
        ),
      recipient:
        if(is_nil(Map.get(map, "recipient")),
          do: nil,
          else: Inttegro.Files.PartyInput.from_map(Map.get(map, "recipient"))
        ),
      resource:
        if(is_nil(Map.get(map, "resource")),
          do: nil,
          else: Inttegro.Files.ResourceInput.from_map(Map.get(map, "resource"))
        ),
      requester:
        if(is_nil(Map.get(map, "requester")),
          do: nil,
          else: Inttegro.Files.ActorInput.from_map(Map.get(map, "requester"))
        ),
      attempts:
        if(is_nil(Map.get(map, "attempts")),
          do: nil,
          else: Inttegro.UploadRequests.AttemptsRequest.from_map(Map.get(map, "attempts"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      expires_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))
        ),
      purpose: Map.fetch!(map, "purpose")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "constraints" =>
        if(is_nil(value.constraints), do: nil, else: Inttegro.Codec.encode(value.constraints)),
      "display" => if(is_nil(value.display), do: nil, else: Inttegro.Codec.encode(value.display)),
      "subject" => if(is_nil(value.subject), do: nil, else: Inttegro.Codec.encode(value.subject)),
      "recipient" =>
        if(is_nil(value.recipient), do: nil, else: Inttegro.Codec.encode(value.recipient)),
      "resource" =>
        if(is_nil(value.resource), do: nil, else: Inttegro.Codec.encode(value.resource)),
      "requester" =>
        if(is_nil(value.requester), do: nil, else: Inttegro.Codec.encode(value.requester)),
      "attempts" =>
        if(is_nil(value.attempts), do: nil, else: Inttegro.Codec.encode(value.attempts)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at)),
      "purpose" => Inttegro.Codec.encode(value.purpose)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:id]
  defstruct id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct purpose: nil, status: nil, resource: nil, page_number: nil, page_size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          purpose: String.t() | nil,
          status: Inttegro.UploadRequests.Status.t() | nil,
          resource: Inttegro.Files.ResourceInput.t() | nil,
          page_number: integer() | nil,
          page_size: integer() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      status:
        if(is_nil(Map.get(map, "status")),
          do: nil,
          else: Inttegro.UploadRequests.Status.decode(Map.get(map, "status"))
        ),
      resource:
        if(is_nil(Map.get(map, "resource")),
          do: nil,
          else: Inttegro.Files.ResourceInput.from_map(Map.get(map, "resource"))
        ),
      page_number:
        if(is_nil(Map.get(map, "page_number")), do: nil, else: Map.get(map, "page_number")),
      page_size: if(is_nil(Map.get(map, "page_size")), do: nil, else: Map.get(map, "page_size"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "status" =>
        if(is_nil(value.status),
          do: nil,
          else: Inttegro.UploadRequests.Status.encode(value.status)
        ),
      "resource" =>
        if(is_nil(value.resource), do: nil, else: Inttegro.Codec.encode(value.resource)),
      "page_number" =>
        if(is_nil(value.page_number), do: nil, else: Inttegro.Codec.encode(value.page_number)),
      "page_size" =>
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.ReviewAttemptByIDRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:attempt_id, :decision, :id]
  defstruct public_message: nil, reasons: nil, attempt_id: nil, decision: nil, id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          public_message: String.t() | nil,
          reasons: [Inttegro.UploadRequests.ReviewReasonInput.t()] | nil,
          attempt_id: String.t(),
          decision: Inttegro.UploadRequests.UploadReviewDecision.t(),
          id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      public_message:
        if(is_nil(Map.get(map, "public_message")), do: nil, else: Map.get(map, "public_message")),
      reasons:
        if(is_nil(Map.get(map, "reasons")),
          do: nil,
          else:
            Enum.map(Map.get(map, "reasons"), fn item ->
              Inttegro.UploadRequests.ReviewReasonInput.from_map(item)
            end)
        ),
      attempt_id: Map.fetch!(map, "attempt_id"),
      decision: Inttegro.UploadRequests.UploadReviewDecision.decode(Map.fetch!(map, "decision")),
      id: Map.fetch!(map, "id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "public_message" =>
        if(is_nil(value.public_message),
          do: nil,
          else: Inttegro.Codec.encode(value.public_message)
        ),
      "reasons" =>
        if(is_nil(value.reasons),
          do: nil,
          else: Enum.map(value.reasons, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "attempt_id" => Inttegro.Codec.encode(value.attempt_id),
      "decision" => Inttegro.UploadRequests.UploadReviewDecision.encode(value.decision),
      "id" => Inttegro.Codec.encode(value.id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.ReviewAttemptByOrdinalRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:attempt_ordinal, :decision, :id]
  defstruct public_message: nil, reasons: nil, attempt_ordinal: nil, decision: nil, id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          public_message: String.t() | nil,
          reasons: [Inttegro.UploadRequests.ReviewReasonInput.t()] | nil,
          attempt_ordinal: integer(),
          decision: Inttegro.UploadRequests.UploadReviewDecision.t(),
          id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      public_message:
        if(is_nil(Map.get(map, "public_message")), do: nil, else: Map.get(map, "public_message")),
      reasons:
        if(is_nil(Map.get(map, "reasons")),
          do: nil,
          else:
            Enum.map(Map.get(map, "reasons"), fn item ->
              Inttegro.UploadRequests.ReviewReasonInput.from_map(item)
            end)
        ),
      attempt_ordinal: Map.fetch!(map, "attempt_ordinal"),
      decision: Inttegro.UploadRequests.UploadReviewDecision.decode(Map.fetch!(map, "decision")),
      id: Map.fetch!(map, "id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "public_message" =>
        if(is_nil(value.public_message),
          do: nil,
          else: Inttegro.Codec.encode(value.public_message)
        ),
      "reasons" =>
        if(is_nil(value.reasons),
          do: nil,
          else: Enum.map(value.reasons, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "attempt_ordinal" => Inttegro.Codec.encode(value.attempt_ordinal),
      "decision" => Inttegro.UploadRequests.UploadReviewDecision.encode(value.decision),
      "id" => Inttegro.Codec.encode(value.id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.UploadFulfillment do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:upload_request, :file]
  defstruct upload_request: nil, file: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          upload_request: Inttegro.UploadRequests.UploadRequest.t(),
          file: Inttegro.Files.UploadReceipt.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      upload_request:
        Inttegro.UploadRequests.UploadRequest.from_map(Map.fetch!(map, "upload_request")),
      file: Inttegro.Files.UploadReceipt.from_map(Map.fetch!(map, "file"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "upload_request" => Inttegro.Codec.encode(value.upload_request),
      "file" => Inttegro.Codec.encode(value.file)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.UploadRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [
    :id,
    :purpose,
    :status,
    :active,
    :constraints,
    :display,
    :subject,
    :recipient,
    :resource,
    :requester,
    :attempts,
    :created_at,
    :updated_at,
    :expires_at
  ]
  defstruct id: nil,
            purpose: nil,
            status: nil,
            active: nil,
            file_id: nil,
            upload_url: nil,
            constraints: nil,
            display: nil,
            subject: nil,
            recipient: nil,
            resource: nil,
            requester: nil,
            attempts: nil,
            latest_error: nil,
            canceled_by: nil,
            custom_data: nil,
            metadata: nil,
            created_at: nil,
            updated_at: nil,
            expires_at: nil,
            uploading_at: nil,
            fulfilled_at: nil,
            expired_at: nil,
            canceled_at: nil,
            attempt: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          purpose: String.t(),
          status: Inttegro.UploadRequests.Status.t(),
          active: boolean(),
          file_id: String.t() | nil,
          upload_url: String.t() | nil,
          constraints: Inttegro.UploadRequests.Constraints.t(),
          display: Inttegro.UploadRequests.Display.t(),
          subject: Inttegro.Files.Party.t(),
          recipient: Inttegro.Files.Party.t(),
          resource: Inttegro.Files.Resource.t(),
          requester: Inttegro.UploadRequests.Actor.t(),
          attempts: Inttegro.UploadRequests.Attempts.t(),
          latest_error: Inttegro.UploadRequests.LatestError.t() | nil,
          canceled_by: Inttegro.UploadRequests.Actor.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          metadata: %{optional(String.t()) => String.t()} | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t(),
          expires_at: DateTime.t(),
          uploading_at: DateTime.t() | nil,
          fulfilled_at: DateTime.t() | nil,
          expired_at: DateTime.t() | nil,
          canceled_at: DateTime.t() | nil,
          attempt: Inttegro.UploadRequests.Attempt.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      purpose: Map.fetch!(map, "purpose"),
      status: Inttegro.UploadRequests.Status.decode(Map.fetch!(map, "status")),
      active: Map.fetch!(map, "active"),
      file_id: if(is_nil(Map.get(map, "file_id")), do: nil, else: Map.get(map, "file_id")),
      upload_url:
        if(is_nil(Map.get(map, "upload_url")), do: nil, else: Map.get(map, "upload_url")),
      constraints: Inttegro.UploadRequests.Constraints.from_map(Map.fetch!(map, "constraints")),
      display: Inttegro.UploadRequests.Display.from_map(Map.fetch!(map, "display")),
      subject: Inttegro.Files.Party.from_map(Map.fetch!(map, "subject")),
      recipient: Inttegro.Files.Party.from_map(Map.fetch!(map, "recipient")),
      resource: Inttegro.Files.Resource.from_map(Map.fetch!(map, "resource")),
      requester: Inttegro.UploadRequests.Actor.from_map(Map.fetch!(map, "requester")),
      attempts: Inttegro.UploadRequests.Attempts.from_map(Map.fetch!(map, "attempts")),
      latest_error:
        if(is_nil(Map.get(map, "latest_error")),
          do: nil,
          else: Inttegro.UploadRequests.LatestError.from_map(Map.get(map, "latest_error"))
        ),
      canceled_by:
        if(is_nil(Map.get(map, "canceled_by")),
          do: nil,
          else: Inttegro.UploadRequests.Actor.from_map(Map.get(map, "canceled_by"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      metadata:
        if(is_nil(Map.get(map, "metadata")),
          do: nil,
          else: Map.new(Map.get(map, "metadata"), fn {key, value} -> {key, value} end)
        ),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      updated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "updated_at")),
      expires_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "expires_at")),
      uploading_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "uploading_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "uploading_at"))
        ),
      fulfilled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "fulfilled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "fulfilled_at"))
        ),
      expired_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expired_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expired_at"))
        ),
      canceled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))
        ),
      attempt:
        if(is_nil(Map.get(map, "attempt")),
          do: nil,
          else: Inttegro.UploadRequests.Attempt.from_map(Map.get(map, "attempt"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "purpose" => Inttegro.Codec.encode(value.purpose),
      "status" => Inttegro.UploadRequests.Status.encode(value.status),
      "active" => Inttegro.Codec.encode(value.active),
      "file_id" => if(is_nil(value.file_id), do: nil, else: Inttegro.Codec.encode(value.file_id)),
      "upload_url" =>
        if(is_nil(value.upload_url), do: nil, else: Inttegro.Codec.encode(value.upload_url)),
      "constraints" => Inttegro.Codec.encode(value.constraints),
      "display" => Inttegro.Codec.encode(value.display),
      "subject" => Inttegro.Codec.encode(value.subject),
      "recipient" => Inttegro.Codec.encode(value.recipient),
      "resource" => Inttegro.Codec.encode(value.resource),
      "requester" => Inttegro.Codec.encode(value.requester),
      "attempts" => Inttegro.Codec.encode(value.attempts),
      "latest_error" =>
        if(is_nil(value.latest_error), do: nil, else: Inttegro.Codec.encode(value.latest_error)),
      "canceled_by" =>
        if(is_nil(value.canceled_by), do: nil, else: Inttegro.Codec.encode(value.canceled_by)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "metadata" =>
        if(is_nil(value.metadata),
          do: nil,
          else:
            Map.new(value.metadata, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "updated_at" => Inttegro.Codec.encode(value.updated_at),
      "expires_at" => Inttegro.Codec.encode(value.expires_at),
      "uploading_at" =>
        if(is_nil(value.uploading_at), do: nil, else: Inttegro.Codec.encode(value.uploading_at)),
      "fulfilled_at" =>
        if(is_nil(value.fulfilled_at), do: nil, else: Inttegro.Codec.encode(value.fulfilled_at)),
      "expired_at" =>
        if(is_nil(value.expired_at), do: nil, else: Inttegro.Codec.encode(value.expired_at)),
      "canceled_at" =>
        if(is_nil(value.canceled_at), do: nil, else: Inttegro.Codec.encode(value.canceled_at)),
      "attempt" => if(is_nil(value.attempt), do: nil, else: Inttegro.Codec.encode(value.attempt))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Actor do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct email: nil, id: nil, name: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          email: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      email: if(is_nil(Map.get(map, "email")), do: nil, else: Map.get(map, "email")),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Attempt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:attempted_at, :id, :ordinal, :status, :upload_request_id]
  defstruct attempted_at: nil,
            content_type: nil,
            declared_size: nil,
            error: nil,
            failed_at: nil,
            file_id: nil,
            filename: nil,
            id: nil,
            ordinal: nil,
            review: nil,
            status: nil,
            succeeded_at: nil,
            upload_request_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          attempted_at: DateTime.t(),
          content_type: String.t() | nil,
          declared_size: integer() | nil,
          error: Inttegro.UploadRequests.LatestError.t() | nil,
          failed_at: DateTime.t() | nil,
          file_id: String.t() | nil,
          filename: String.t() | nil,
          id: String.t(),
          ordinal: integer(),
          review: Inttegro.UploadRequests.Review.t() | nil,
          status: String.t(),
          succeeded_at: DateTime.t() | nil,
          upload_request_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      attempted_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "attempted_at")),
      content_type:
        if(is_nil(Map.get(map, "content_type")), do: nil, else: Map.get(map, "content_type")),
      declared_size:
        if(is_nil(Map.get(map, "declared_size")), do: nil, else: Map.get(map, "declared_size")),
      error:
        if(is_nil(Map.get(map, "error")),
          do: nil,
          else: Inttegro.UploadRequests.LatestError.from_map(Map.get(map, "error"))
        ),
      failed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))
        ),
      file_id: if(is_nil(Map.get(map, "file_id")), do: nil, else: Map.get(map, "file_id")),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename")),
      id: Map.fetch!(map, "id"),
      ordinal: Map.fetch!(map, "ordinal"),
      review:
        if(is_nil(Map.get(map, "review")),
          do: nil,
          else: Inttegro.UploadRequests.Review.from_map(Map.get(map, "review"))
        ),
      status: Map.fetch!(map, "status"),
      succeeded_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "succeeded_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "succeeded_at"))
        ),
      upload_request_id: Map.fetch!(map, "upload_request_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "attempted_at" => Inttegro.Codec.encode(value.attempted_at),
      "content_type" =>
        if(is_nil(value.content_type), do: nil, else: Inttegro.Codec.encode(value.content_type)),
      "declared_size" =>
        if(is_nil(value.declared_size), do: nil, else: Inttegro.Codec.encode(value.declared_size)),
      "error" => if(is_nil(value.error), do: nil, else: Inttegro.Codec.encode(value.error)),
      "failed_at" =>
        if(is_nil(value.failed_at), do: nil, else: Inttegro.Codec.encode(value.failed_at)),
      "file_id" => if(is_nil(value.file_id), do: nil, else: Inttegro.Codec.encode(value.file_id)),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename)),
      "id" => Inttegro.Codec.encode(value.id),
      "ordinal" => Inttegro.Codec.encode(value.ordinal),
      "review" => if(is_nil(value.review), do: nil, else: Inttegro.Codec.encode(value.review)),
      "status" => Inttegro.Codec.encode(value.status),
      "succeeded_at" =>
        if(is_nil(value.succeeded_at), do: nil, else: Inttegro.Codec.encode(value.succeeded_at)),
      "upload_request_id" => Inttegro.Codec.encode(value.upload_request_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Attempts do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:attempt_count, :failed_attempt_count]
  defstruct max_attempts: nil,
            attempt_count: nil,
            failed_attempt_count: nil,
            last_attempted_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          max_attempts: integer() | nil,
          attempt_count: integer(),
          failed_attempt_count: integer(),
          last_attempted_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      max_attempts:
        if(is_nil(Map.get(map, "max_attempts")), do: nil, else: Map.get(map, "max_attempts")),
      attempt_count: Map.fetch!(map, "attempt_count"),
      failed_attempt_count: Map.fetch!(map, "failed_attempt_count"),
      last_attempted_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "last_attempted_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "last_attempted_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "max_attempts" =>
        if(is_nil(value.max_attempts), do: nil, else: Inttegro.Codec.encode(value.max_attempts)),
      "attempt_count" => Inttegro.Codec.encode(value.attempt_count),
      "failed_attempt_count" => Inttegro.Codec.encode(value.failed_attempt_count),
      "last_attempted_at" =>
        if(is_nil(value.last_attempted_at),
          do: nil,
          else: Inttegro.Codec.encode(value.last_attempted_at)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.AttemptsRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct max_attempts: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          max_attempts: integer() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      max_attempts:
        if(is_nil(Map.get(map, "max_attempts")), do: nil, else: Map.get(map, "max_attempts"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "max_attempts" =>
        if(is_nil(value.max_attempts), do: nil, else: Inttegro.Codec.encode(value.max_attempts))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Constraints do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct min_size: nil,
            max_size: nil,
            exact_size: nil,
            content_types: nil,
            extensions: nil,
            filename: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          min_size: integer() | nil,
          max_size: integer() | nil,
          exact_size: integer() | nil,
          content_types: [String.t()] | nil,
          extensions: [String.t()] | nil,
          filename: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      min_size: if(is_nil(Map.get(map, "min_size")), do: nil, else: Map.get(map, "min_size")),
      max_size: if(is_nil(Map.get(map, "max_size")), do: nil, else: Map.get(map, "max_size")),
      exact_size:
        if(is_nil(Map.get(map, "exact_size")), do: nil, else: Map.get(map, "exact_size")),
      content_types:
        if(is_nil(Map.get(map, "content_types")),
          do: nil,
          else: Enum.map(Map.get(map, "content_types"), fn item -> item end)
        ),
      extensions:
        if(is_nil(Map.get(map, "extensions")),
          do: nil,
          else: Enum.map(Map.get(map, "extensions"), fn item -> item end)
        ),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "min_size" =>
        if(is_nil(value.min_size), do: nil, else: Inttegro.Codec.encode(value.min_size)),
      "max_size" =>
        if(is_nil(value.max_size), do: nil, else: Inttegro.Codec.encode(value.max_size)),
      "exact_size" =>
        if(is_nil(value.exact_size), do: nil, else: Inttegro.Codec.encode(value.exact_size)),
      "content_types" =>
        if(is_nil(value.content_types),
          do: nil,
          else: Enum.map(value.content_types, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "extensions" =>
        if(is_nil(value.extensions),
          do: nil,
          else: Enum.map(value.extensions, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.ConstraintsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct min_size: nil,
            max_size: nil,
            exact_size: nil,
            content_types: nil,
            extensions: nil,
            filename: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          min_size: integer() | nil,
          max_size: integer() | nil,
          exact_size: integer() | nil,
          content_types: [String.t()] | nil,
          extensions: [String.t()] | nil,
          filename: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      min_size: if(is_nil(Map.get(map, "min_size")), do: nil, else: Map.get(map, "min_size")),
      max_size: if(is_nil(Map.get(map, "max_size")), do: nil, else: Map.get(map, "max_size")),
      exact_size:
        if(is_nil(Map.get(map, "exact_size")), do: nil, else: Map.get(map, "exact_size")),
      content_types:
        if(is_nil(Map.get(map, "content_types")),
          do: nil,
          else: Enum.map(Map.get(map, "content_types"), fn item -> item end)
        ),
      extensions:
        if(is_nil(Map.get(map, "extensions")),
          do: nil,
          else: Enum.map(Map.get(map, "extensions"), fn item -> item end)
        ),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "min_size" =>
        if(is_nil(value.min_size), do: nil, else: Inttegro.Codec.encode(value.min_size)),
      "max_size" =>
        if(is_nil(value.max_size), do: nil, else: Inttegro.Codec.encode(value.max_size)),
      "exact_size" =>
        if(is_nil(value.exact_size), do: nil, else: Inttegro.Codec.encode(value.exact_size)),
      "content_types" =>
        if(is_nil(value.content_types),
          do: nil,
          else: Enum.map(value.content_types, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "extensions" =>
        if(is_nil(value.extensions),
          do: nil,
          else: Enum.map(value.extensions, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Display do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct title: nil, description: nil, help_text: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          title: String.t() | nil,
          description: String.t() | nil,
          help_text: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      title: if(is_nil(Map.get(map, "title")), do: nil, else: Map.get(map, "title")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      help_text: if(is_nil(Map.get(map, "help_text")), do: nil, else: Map.get(map, "help_text"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "title" => if(is_nil(value.title), do: nil, else: Inttegro.Codec.encode(value.title)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "help_text" =>
        if(is_nil(value.help_text), do: nil, else: Inttegro.Codec.encode(value.help_text))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.DisplayInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct title: nil, description: nil, help_text: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          title: String.t() | nil,
          description: String.t() | nil,
          help_text: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      title: if(is_nil(Map.get(map, "title")), do: nil, else: Map.get(map, "title")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      help_text: if(is_nil(Map.get(map, "help_text")), do: nil, else: Map.get(map, "help_text"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "title" => if(is_nil(value.title), do: nil, else: Inttegro.Codec.encode(value.title)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "help_text" =>
        if(is_nil(value.help_text), do: nil, else: Inttegro.Codec.encode(value.help_text))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.LatestError do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct code: nil, param: nil, message: nil, retryable: nil, at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          code: String.t() | nil,
          param: String.t() | nil,
          message: String.t() | nil,
          retryable: boolean() | nil,
          at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      code: if(is_nil(Map.get(map, "code")), do: nil, else: Map.get(map, "code")),
      param: if(is_nil(Map.get(map, "param")), do: nil, else: Map.get(map, "param")),
      message: if(is_nil(Map.get(map, "message")), do: nil, else: Map.get(map, "message")),
      retryable: if(is_nil(Map.get(map, "retryable")), do: nil, else: Map.get(map, "retryable")),
      at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "code" => if(is_nil(value.code), do: nil, else: Inttegro.Codec.encode(value.code)),
      "param" => if(is_nil(value.param), do: nil, else: Inttegro.Codec.encode(value.param)),
      "message" => if(is_nil(value.message), do: nil, else: Inttegro.Codec.encode(value.message)),
      "retryable" =>
        if(is_nil(value.retryable), do: nil, else: Inttegro.Codec.encode(value.retryable)),
      "at" => if(is_nil(value.at), do: nil, else: Inttegro.Codec.encode(value.at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size, :upload_requests]
  defstruct number: nil, size: nil, upload_requests: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          upload_requests: [Inttegro.UploadRequests.UploadRequest.t()]
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: Map.fetch!(map, "number"),
      size: Map.fetch!(map, "size"),
      upload_requests:
        Enum.map(Map.fetch!(map, "upload_requests"), fn item ->
          Inttegro.UploadRequests.UploadRequest.from_map(item)
        end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "upload_requests" =>
        Enum.map(value.upload_requests, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.Review do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:created_at, :decision, :reviewed_at, :type]
  defstruct created_at: nil,
            decision: nil,
            file_id: nil,
            public_message: nil,
            reasons: nil,
            reviewed_at: nil,
            type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          decision: Inttegro.UploadRequests.UploadReviewDecision.t(),
          file_id: String.t() | nil,
          public_message: String.t() | nil,
          reasons: [Inttegro.UploadRequests.ReviewReason.t()] | nil,
          reviewed_at: DateTime.t(),
          type: Inttegro.UploadRequests.UploadReviewType.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      decision: Inttegro.UploadRequests.UploadReviewDecision.decode(Map.fetch!(map, "decision")),
      file_id: if(is_nil(Map.get(map, "file_id")), do: nil, else: Map.get(map, "file_id")),
      public_message:
        if(is_nil(Map.get(map, "public_message")), do: nil, else: Map.get(map, "public_message")),
      reasons:
        if(is_nil(Map.get(map, "reasons")),
          do: nil,
          else:
            Enum.map(Map.get(map, "reasons"), fn item ->
              Inttegro.UploadRequests.ReviewReason.from_map(item)
            end)
        ),
      reviewed_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "reviewed_at")),
      type: Inttegro.UploadRequests.UploadReviewType.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "decision" => Inttegro.UploadRequests.UploadReviewDecision.encode(value.decision),
      "file_id" => if(is_nil(value.file_id), do: nil, else: Inttegro.Codec.encode(value.file_id)),
      "public_message" =>
        if(is_nil(value.public_message),
          do: nil,
          else: Inttegro.Codec.encode(value.public_message)
        ),
      "reasons" =>
        if(is_nil(value.reasons),
          do: nil,
          else: Enum.map(value.reasons, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "reviewed_at" => Inttegro.Codec.encode(value.reviewed_at),
      "type" => Inttegro.UploadRequests.UploadReviewType.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.ReviewReason do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:code, :message]
  defstruct code: nil, message: nil, param: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          code: String.t(),
          message: String.t(),
          param: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      code: Map.fetch!(map, "code"),
      message: Map.fetch!(map, "message"),
      param: if(is_nil(Map.get(map, "param")), do: nil, else: Map.get(map, "param"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "code" => Inttegro.Codec.encode(value.code),
      "message" => Inttegro.Codec.encode(value.message),
      "param" => if(is_nil(value.param), do: nil, else: Inttegro.Codec.encode(value.param))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.UploadRequests.ReviewReasonInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:code, :message]
  defstruct param: nil, code: nil, message: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          param: String.t() | nil,
          code: String.t(),
          message: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      param: if(is_nil(Map.get(map, "param")), do: nil, else: Map.get(map, "param")),
      code: Map.fetch!(map, "code"),
      message: Map.fetch!(map, "message")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "param" => if(is_nil(value.param), do: nil, else: Inttegro.Codec.encode(value.param)),
      "code" => Inttegro.Codec.encode(value.code),
      "message" => Inttegro.Codec.encode(value.message)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
