# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Files.Delivery do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :stream | :redirect | String.t()
  @values %{
    stream: "stream",
    redirect: "redirect"
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

defmodule Inttegro.Files.Disposition do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :attachment | :inline | String.t()
  @values %{
    attachment: "attachment",
    inline: "inline"
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

defmodule Inttegro.Files.ScanStatus do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :pending | :passed | :failed | :skipped | String.t()
  @values %{
    pending: "pending",
    passed: "passed",
    failed: "failed",
    skipped: "skipped"
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

defmodule Inttegro.Files.SourceType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :direct | :upload_request | :service | String.t()
  @values %{
    direct: "direct",
    upload_request: "upload_request",
    service: "service"
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

defmodule Inttegro.Files.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :uploading | :processing | :available | :failed | :deleted | String.t()
  @values %{
    uploading: "uploading",
    processing: "processing",
    available: "available",
    failed: "failed",
    deleted: "deleted"
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

defmodule Inttegro.Files.StorageEncoding do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :identity | :brotli | String.t()
  @values %{
    identity: "identity",
    brotli: "br"
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

defmodule Inttegro.Files.DeleteRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:file_id]
  defstruct file_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          file_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      file_id: Map.fetch!(map, "file_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "file_id" => Inttegro.Codec.encode(value.file_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.File do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [
    :id,
    :purpose,
    :status,
    :scan_status,
    :content_type,
    :size,
    :checksum_sha256,
    :created_by,
    :source,
    :storage,
    :created_at,
    :updated_at
  ]
  defstruct id: nil,
            purpose: nil,
            status: nil,
            scan_status: nil,
            name: nil,
            filename: nil,
            content_type: nil,
            size: nil,
            checksum_sha256: nil,
            created_by: nil,
            source: nil,
            media: nil,
            storage: nil,
            delivery: nil,
            latest_error: nil,
            custom_data: nil,
            metadata: nil,
            created_at: nil,
            updated_at: nil,
            available_at: nil,
            expires_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          purpose: String.t(),
          status: Inttegro.Files.Status.t(),
          scan_status: Inttegro.Files.ScanStatus.t(),
          name: String.t() | nil,
          filename: String.t() | nil,
          content_type: String.t(),
          size: integer(),
          checksum_sha256: String.t(),
          created_by: Inttegro.Files.Actor.t(),
          source: Inttegro.Files.Source.t(),
          media: Inttegro.Files.Media.t() | nil,
          storage: Inttegro.Files.PublicStorage.t(),
          delivery: Inttegro.Files.DeliveryDetails.t() | nil,
          latest_error: Inttegro.Files.LatestError.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          metadata: %{optional(String.t()) => String.t()} | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t(),
          available_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil
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
      status: Inttegro.Files.Status.decode(Map.fetch!(map, "status")),
      scan_status: Inttegro.Files.ScanStatus.decode(Map.fetch!(map, "scan_status")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename")),
      content_type: Map.fetch!(map, "content_type"),
      size: Map.fetch!(map, "size"),
      checksum_sha256: Map.fetch!(map, "checksum_sha256"),
      created_by: Inttegro.Files.Actor.from_map(Map.fetch!(map, "created_by")),
      source: Inttegro.Files.Source.from_map(Map.fetch!(map, "source")),
      media:
        if(is_nil(Map.get(map, "media")),
          do: nil,
          else: Inttegro.Files.Media.from_map(Map.get(map, "media"))
        ),
      storage: Inttegro.Files.PublicStorage.from_map(Map.fetch!(map, "storage")),
      delivery:
        if(is_nil(Map.get(map, "delivery")),
          do: nil,
          else: Inttegro.Files.DeliveryDetails.from_map(Map.get(map, "delivery"))
        ),
      latest_error:
        if(is_nil(Map.get(map, "latest_error")),
          do: nil,
          else: Inttegro.Files.LatestError.from_map(Map.get(map, "latest_error"))
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
      available_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "available_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "available_at"))
        ),
      expires_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "purpose" => Inttegro.Codec.encode(value.purpose),
      "status" => Inttegro.Files.Status.encode(value.status),
      "scan_status" => Inttegro.Files.ScanStatus.encode(value.scan_status),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename)),
      "content_type" => Inttegro.Codec.encode(value.content_type),
      "size" => Inttegro.Codec.encode(value.size),
      "checksum_sha256" => Inttegro.Codec.encode(value.checksum_sha256),
      "created_by" => Inttegro.Codec.encode(value.created_by),
      "source" => Inttegro.Codec.encode(value.source),
      "media" => if(is_nil(value.media), do: nil, else: Inttegro.Codec.encode(value.media)),
      "storage" => Inttegro.Codec.encode(value.storage),
      "delivery" =>
        if(is_nil(value.delivery), do: nil, else: Inttegro.Codec.encode(value.delivery)),
      "latest_error" =>
        if(is_nil(value.latest_error), do: nil, else: Inttegro.Codec.encode(value.latest_error)),
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
      "available_at" =>
        if(is_nil(value.available_at), do: nil, else: Inttegro.Codec.encode(value.available_at)),
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.Actor do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct type: nil, id: nil, name: nil, email: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t(),
          id: String.t() | nil,
          name: String.t() | nil,
          email: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Map.fetch!(map, "type"),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      email: if(is_nil(Map.get(map, "email")), do: nil, else: Map.get(map, "email"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Codec.encode(value.type),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.ActorInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct email: nil, id: nil, name: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          email: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          type: String.t() | nil
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
      type: if(is_nil(Map.get(map, "type")), do: nil, else: Map.get(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Codec.encode(value.type))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.ContentsRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:file_id]
  defstruct disposition: nil, delivery: nil, file_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          disposition: Inttegro.Files.Disposition.t() | nil,
          delivery: Inttegro.Files.Delivery.t() | nil,
          file_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      disposition:
        if(is_nil(Map.get(map, "disposition")),
          do: nil,
          else: Inttegro.Files.Disposition.decode(Map.get(map, "disposition"))
        ),
      delivery:
        if(is_nil(Map.get(map, "delivery")),
          do: nil,
          else: Inttegro.Files.Delivery.decode(Map.get(map, "delivery"))
        ),
      file_id: Map.fetch!(map, "file_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "disposition" =>
        if(is_nil(value.disposition),
          do: nil,
          else: Inttegro.Files.Disposition.encode(value.disposition)
        ),
      "delivery" =>
        if(is_nil(value.delivery),
          do: nil,
          else: Inttegro.Files.Delivery.encode(value.delivery)
        ),
      "file_id" => Inttegro.Codec.encode(value.file_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.DeliveryDetails do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct public_url: nil, cache_control: nil, content_type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          public_url: String.t() | nil,
          cache_control: String.t() | nil,
          content_type: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      public_url:
        if(is_nil(Map.get(map, "public_url")), do: nil, else: Map.get(map, "public_url")),
      cache_control:
        if(is_nil(Map.get(map, "cache_control")), do: nil, else: Map.get(map, "cache_control")),
      content_type:
        if(is_nil(Map.get(map, "content_type")), do: nil, else: Map.get(map, "content_type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "public_url" =>
        if(is_nil(value.public_url), do: nil, else: Inttegro.Codec.encode(value.public_url)),
      "cache_control" =>
        if(is_nil(value.cache_control), do: nil, else: Inttegro.Codec.encode(value.cache_control)),
      "content_type" =>
        if(is_nil(value.content_type), do: nil, else: Inttegro.Codec.encode(value.content_type))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.LatestError do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct code: nil, message: nil, retryable: nil, at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          code: String.t() | nil,
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
      "message" => if(is_nil(value.message), do: nil, else: Inttegro.Codec.encode(value.message)),
      "retryable" =>
        if(is_nil(value.retryable), do: nil, else: Inttegro.Codec.encode(value.retryable)),
      "at" => if(is_nil(value.at), do: nil, else: Inttegro.Codec.encode(value.at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.Media do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct kind: nil,
            width: nil,
            height: nil,
            duration_ms: nil,
            page_count: nil,
            frame_count: nil,
            color_space: nil,
            has_alpha: nil,
            codec: nil,
            aspect_ratio: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          kind: String.t() | nil,
          width: integer() | nil,
          height: integer() | nil,
          duration_ms: integer() | nil,
          page_count: integer() | nil,
          frame_count: integer() | nil,
          color_space: String.t() | nil,
          has_alpha: boolean() | nil,
          codec: String.t() | nil,
          aspect_ratio: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      kind: if(is_nil(Map.get(map, "kind")), do: nil, else: Map.get(map, "kind")),
      width: if(is_nil(Map.get(map, "width")), do: nil, else: Map.get(map, "width")),
      height: if(is_nil(Map.get(map, "height")), do: nil, else: Map.get(map, "height")),
      duration_ms:
        if(is_nil(Map.get(map, "duration_ms")), do: nil, else: Map.get(map, "duration_ms")),
      page_count:
        if(is_nil(Map.get(map, "page_count")), do: nil, else: Map.get(map, "page_count")),
      frame_count:
        if(is_nil(Map.get(map, "frame_count")), do: nil, else: Map.get(map, "frame_count")),
      color_space:
        if(is_nil(Map.get(map, "color_space")), do: nil, else: Map.get(map, "color_space")),
      has_alpha: if(is_nil(Map.get(map, "has_alpha")), do: nil, else: Map.get(map, "has_alpha")),
      codec: if(is_nil(Map.get(map, "codec")), do: nil, else: Map.get(map, "codec")),
      aspect_ratio:
        if(is_nil(Map.get(map, "aspect_ratio")), do: nil, else: Map.get(map, "aspect_ratio"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "kind" => if(is_nil(value.kind), do: nil, else: Inttegro.Codec.encode(value.kind)),
      "width" => if(is_nil(value.width), do: nil, else: Inttegro.Codec.encode(value.width)),
      "height" => if(is_nil(value.height), do: nil, else: Inttegro.Codec.encode(value.height)),
      "duration_ms" =>
        if(is_nil(value.duration_ms), do: nil, else: Inttegro.Codec.encode(value.duration_ms)),
      "page_count" =>
        if(is_nil(value.page_count), do: nil, else: Inttegro.Codec.encode(value.page_count)),
      "frame_count" =>
        if(is_nil(value.frame_count), do: nil, else: Inttegro.Codec.encode(value.frame_count)),
      "color_space" =>
        if(is_nil(value.color_space), do: nil, else: Inttegro.Codec.encode(value.color_space)),
      "has_alpha" =>
        if(is_nil(value.has_alpha), do: nil, else: Inttegro.Codec.encode(value.has_alpha)),
      "codec" => if(is_nil(value.codec), do: nil, else: Inttegro.Codec.encode(value.codec)),
      "aspect_ratio" =>
        if(is_nil(value.aspect_ratio), do: nil, else: Inttegro.Codec.encode(value.aspect_ratio))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size, :files]
  defstruct number: nil, size: nil, files: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          files: [Inttegro.Files.File.t()]
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
      files: Enum.map(Map.fetch!(map, "files"), fn item -> Inttegro.Files.File.from_map(item) end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "files" => Enum.map(value.files, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.Party do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct type: nil, id: nil, name: nil, email: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          email: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: if(is_nil(Map.get(map, "type")), do: nil, else: Map.get(map, "type")),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      email: if(is_nil(Map.get(map, "email")), do: nil, else: Map.get(map, "email"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Codec.encode(value.type)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.PartyInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct type: nil, id: nil, name: nil, email: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          email: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: if(is_nil(Map.get(map, "type")), do: nil, else: Map.get(map, "type")),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      email: if(is_nil(Map.get(map, "email")), do: nil, else: Map.get(map, "email"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Codec.encode(value.type)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.Resource do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct type: nil, id: nil, name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: if(is_nil(Map.get(map, "type")), do: nil, else: Map.get(map, "type")),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Codec.encode(value.type)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.ResourceInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct type: nil, id: nil, name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: if(is_nil(Map.get(map, "type")), do: nil, else: Map.get(map, "type")),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Codec.encode(value.type)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.Source do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct type: nil, service: nil, upload_request_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: Inttegro.Files.SourceType.t() | nil,
          service: String.t() | nil,
          upload_request_id: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type:
        if(is_nil(Map.get(map, "type")),
          do: nil,
          else: Inttegro.Files.SourceType.decode(Map.get(map, "type"))
        ),
      service: if(is_nil(Map.get(map, "service")), do: nil, else: Map.get(map, "service")),
      upload_request_id:
        if(is_nil(Map.get(map, "upload_request_id")),
          do: nil,
          else: Map.get(map, "upload_request_id")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" =>
        if(is_nil(value.type), do: nil, else: Inttegro.Files.SourceType.encode(value.type)),
      "service" => if(is_nil(value.service), do: nil, else: Inttegro.Codec.encode(value.service)),
      "upload_request_id" =>
        if(is_nil(value.upload_request_id),
          do: nil,
          else: Inttegro.Codec.encode(value.upload_request_id)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.UploadReceipt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:content_type, :created_at, :id, :size, :status]
  defstruct content_type: nil,
            created_at: nil,
            filename: nil,
            id: nil,
            name: nil,
            size: nil,
            status: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          content_type: String.t(),
          created_at: DateTime.t(),
          filename: String.t() | nil,
          id: String.t(),
          name: String.t() | nil,
          size: integer(),
          status: Inttegro.Files.Status.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      content_type: Map.fetch!(map, "content_type"),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename")),
      id: Map.fetch!(map, "id"),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      size: Map.fetch!(map, "size"),
      status: Inttegro.Files.Status.decode(Map.fetch!(map, "status"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "content_type" => Inttegro.Codec.encode(value.content_type),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename)),
      "id" => Inttegro.Codec.encode(value.id),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "size" => Inttegro.Codec.encode(value.size),
      "status" => Inttegro.Files.Status.encode(value.status)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:file_id]
  defstruct file_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          file_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      file_id: Map.fetch!(map, "file_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "file_id" => Inttegro.Codec.encode(value.file_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct purpose: nil,
            status: nil,
            page_number: nil,
            page_size: nil,
            created_after: nil,
            created_before: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          purpose: String.t() | nil,
          status: Inttegro.Files.Status.t() | nil,
          page_number: integer() | nil,
          page_size: integer() | nil,
          created_after: DateTime.t() | nil,
          created_before: DateTime.t() | nil
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
          else: Inttegro.Files.Status.decode(Map.get(map, "status"))
        ),
      page_number:
        if(is_nil(Map.get(map, "page_number")), do: nil, else: Map.get(map, "page_number")),
      page_size: if(is_nil(Map.get(map, "page_size")), do: nil, else: Map.get(map, "page_size")),
      created_after:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "created_after"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "created_after"))
        ),
      created_before:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "created_before"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "created_before"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "status" =>
        if(is_nil(value.status), do: nil, else: Inttegro.Files.Status.encode(value.status)),
      "page_number" =>
        if(is_nil(value.page_number), do: nil, else: Inttegro.Codec.encode(value.page_number)),
      "page_size" =>
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size)),
      "created_after" =>
        if(is_nil(value.created_after), do: nil, else: Inttegro.Codec.encode(value.created_after)),
      "created_before" =>
        if(is_nil(value.created_before),
          do: nil,
          else: Inttegro.Codec.encode(value.created_before)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Files.PublicStorage do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:encoding, :stored_size]
  defstruct encoding: nil, stored_size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          encoding: Inttegro.Files.StorageEncoding.t(),
          stored_size: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      encoding: Inttegro.Files.StorageEncoding.decode(Map.fetch!(map, "encoding")),
      stored_size: Map.fetch!(map, "stored_size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "encoding" => Inttegro.Files.StorageEncoding.encode(value.encoding),
      "stored_size" => Inttegro.Codec.encode(value.stored_size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
