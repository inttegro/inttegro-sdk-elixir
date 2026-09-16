# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.FileLinks.DeliveryMode do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :redirect | :download | :inline | String.t()
  @values %{
    redirect: "redirect",
    download: "download",
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

defmodule Inttegro.FileLinks.Kind do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :public | String.t()
  @values %{
    public: "public"
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

defmodule Inttegro.FileLinks.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :active | :revoked | :expired | :disabled | String.t()
  @values %{
    active: "active",
    revoked: "revoked",
    expired: "expired",
    disabled: "disabled"
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

defmodule Inttegro.FileLinks.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:file_id]
  defstruct delivery: nil,
            access: nil,
            created_by: nil,
            custom_data: nil,
            expires_at: nil,
            file_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          delivery: Inttegro.FileLinks.DeliveryInput.t() | nil,
          access: Inttegro.FileLinks.AccessRequest.t() | nil,
          created_by: Inttegro.Files.ActorInput.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          expires_at: DateTime.t() | nil,
          file_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      delivery:
        if(is_nil(Map.get(map, "delivery")),
          do: nil,
          else: Inttegro.FileLinks.DeliveryInput.from_map(Map.get(map, "delivery"))
        ),
      access:
        if(is_nil(Map.get(map, "access")),
          do: nil,
          else: Inttegro.FileLinks.AccessRequest.from_map(Map.get(map, "access"))
        ),
      created_by:
        if(is_nil(Map.get(map, "created_by")),
          do: nil,
          else: Inttegro.Files.ActorInput.from_map(Map.get(map, "created_by"))
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
      file_id: Map.fetch!(map, "file_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "delivery" =>
        if(is_nil(value.delivery), do: nil, else: Inttegro.Codec.encode(value.delivery)),
      "access" => if(is_nil(value.access), do: nil, else: Inttegro.Codec.encode(value.access)),
      "created_by" =>
        if(is_nil(value.created_by), do: nil, else: Inttegro.Codec.encode(value.created_by)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at)),
      "file_id" => Inttegro.Codec.encode(value.file_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.FileLink do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [
    :id,
    :kind,
    :file_id,
    :purpose,
    :status,
    :active,
    :delivery,
    :access,
    :created_by,
    :created_at,
    :updated_at,
    :expires_at
  ]
  defstruct id: nil,
            kind: nil,
            file_id: nil,
            purpose: nil,
            status: nil,
            active: nil,
            delivery: nil,
            access: nil,
            created_by: nil,
            revoked_by: nil,
            custom_data: nil,
            metadata: nil,
            created_at: nil,
            updated_at: nil,
            expires_at: nil,
            revoked_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          kind: Inttegro.FileLinks.Kind.t(),
          file_id: String.t(),
          purpose: String.t(),
          status: Inttegro.FileLinks.Status.t(),
          active: boolean(),
          delivery: Inttegro.FileLinks.Delivery.t(),
          access: Inttegro.FileLinks.Access.t(),
          created_by: Inttegro.FileLinks.Actor.t(),
          revoked_by: Inttegro.FileLinks.Actor.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          metadata: %{optional(String.t()) => String.t()} | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t(),
          expires_at: DateTime.t(),
          revoked_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      kind: Inttegro.FileLinks.Kind.decode(Map.fetch!(map, "kind")),
      file_id: Map.fetch!(map, "file_id"),
      purpose: Map.fetch!(map, "purpose"),
      status: Inttegro.FileLinks.Status.decode(Map.fetch!(map, "status")),
      active: Map.fetch!(map, "active"),
      delivery: Inttegro.FileLinks.Delivery.from_map(Map.fetch!(map, "delivery")),
      access: Inttegro.FileLinks.Access.from_map(Map.fetch!(map, "access")),
      created_by: Inttegro.FileLinks.Actor.from_map(Map.fetch!(map, "created_by")),
      revoked_by:
        if(is_nil(Map.get(map, "revoked_by")),
          do: nil,
          else: Inttegro.FileLinks.Actor.from_map(Map.get(map, "revoked_by"))
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
      revoked_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "revoked_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "revoked_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "kind" => Inttegro.FileLinks.Kind.encode(value.kind),
      "file_id" => Inttegro.Codec.encode(value.file_id),
      "purpose" => Inttegro.Codec.encode(value.purpose),
      "status" => Inttegro.FileLinks.Status.encode(value.status),
      "active" => Inttegro.Codec.encode(value.active),
      "delivery" => Inttegro.Codec.encode(value.delivery),
      "access" => Inttegro.Codec.encode(value.access),
      "created_by" => Inttegro.Codec.encode(value.created_by),
      "revoked_by" =>
        if(is_nil(value.revoked_by), do: nil, else: Inttegro.Codec.encode(value.revoked_by)),
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
      "revoked_at" =>
        if(is_nil(value.revoked_at), do: nil, else: Inttegro.Codec.encode(value.revoked_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.Access do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct max_accesses: nil,
            access_count: nil,
            last_accessed_at: nil,
            allow_download: nil,
            allowed_origins: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          max_accesses: integer() | nil,
          access_count: integer() | nil,
          last_accessed_at: DateTime.t() | nil,
          allow_download: boolean() | nil,
          allowed_origins: [String.t()] | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      max_accesses:
        if(is_nil(Map.get(map, "max_accesses")), do: nil, else: Map.get(map, "max_accesses")),
      access_count:
        if(is_nil(Map.get(map, "access_count")), do: nil, else: Map.get(map, "access_count")),
      last_accessed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "last_accessed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "last_accessed_at"))
        ),
      allow_download:
        if(is_nil(Map.get(map, "allow_download")), do: nil, else: Map.get(map, "allow_download")),
      allowed_origins:
        if(is_nil(Map.get(map, "allowed_origins")),
          do: nil,
          else: Enum.map(Map.get(map, "allowed_origins"), fn item -> item end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "max_accesses" =>
        if(is_nil(value.max_accesses), do: nil, else: Inttegro.Codec.encode(value.max_accesses)),
      "access_count" =>
        if(is_nil(value.access_count), do: nil, else: Inttegro.Codec.encode(value.access_count)),
      "last_accessed_at" =>
        if(is_nil(value.last_accessed_at),
          do: nil,
          else: Inttegro.Codec.encode(value.last_accessed_at)
        ),
      "allow_download" =>
        if(is_nil(value.allow_download),
          do: nil,
          else: Inttegro.Codec.encode(value.allow_download)
        ),
      "allowed_origins" =>
        if(is_nil(value.allowed_origins),
          do: nil,
          else: Enum.map(value.allowed_origins, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.AccessRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct max_accesses: nil, allow_download: nil, allowed_origins: nil, allowed_ip_ranges: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          max_accesses: integer() | nil,
          allow_download: boolean() | nil,
          allowed_origins: [String.t()] | nil,
          allowed_ip_ranges: [String.t()] | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      max_accesses:
        if(is_nil(Map.get(map, "max_accesses")), do: nil, else: Map.get(map, "max_accesses")),
      allow_download:
        if(is_nil(Map.get(map, "allow_download")), do: nil, else: Map.get(map, "allow_download")),
      allowed_origins:
        if(is_nil(Map.get(map, "allowed_origins")),
          do: nil,
          else: Enum.map(Map.get(map, "allowed_origins"), fn item -> item end)
        ),
      allowed_ip_ranges:
        if(is_nil(Map.get(map, "allowed_ip_ranges")),
          do: nil,
          else: Enum.map(Map.get(map, "allowed_ip_ranges"), fn item -> item end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "max_accesses" =>
        if(is_nil(value.max_accesses), do: nil, else: Inttegro.Codec.encode(value.max_accesses)),
      "allow_download" =>
        if(is_nil(value.allow_download),
          do: nil,
          else: Inttegro.Codec.encode(value.allow_download)
        ),
      "allowed_origins" =>
        if(is_nil(value.allowed_origins),
          do: nil,
          else: Enum.map(value.allowed_origins, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "allowed_ip_ranges" =>
        if(is_nil(value.allowed_ip_ranges),
          do: nil,
          else: Enum.map(value.allowed_ip_ranges, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.Actor do
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

defmodule Inttegro.FileLinks.Creation do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:file_link, :url]
  defstruct file_link: nil, url: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          file_link: Inttegro.FileLinks.FileLink.t(),
          url: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      file_link: Inttegro.FileLinks.FileLink.from_map(Map.fetch!(map, "file_link")),
      url: Map.fetch!(map, "url")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "file_link" => Inttegro.Codec.encode(value.file_link),
      "url" => Inttegro.Codec.encode(value.url)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.Delivery do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct mode: nil, filename: nil, content_type: nil, disposition: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          mode: Inttegro.FileLinks.DeliveryMode.t() | nil,
          filename: String.t() | nil,
          content_type: String.t() | nil,
          disposition: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      mode:
        if(is_nil(Map.get(map, "mode")),
          do: nil,
          else: Inttegro.FileLinks.DeliveryMode.decode(Map.get(map, "mode"))
        ),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename")),
      content_type:
        if(is_nil(Map.get(map, "content_type")), do: nil, else: Map.get(map, "content_type")),
      disposition:
        if(is_nil(Map.get(map, "disposition")), do: nil, else: Map.get(map, "disposition"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "mode" =>
        if(is_nil(value.mode),
          do: nil,
          else: Inttegro.FileLinks.DeliveryMode.encode(value.mode)
        ),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename)),
      "content_type" =>
        if(is_nil(value.content_type), do: nil, else: Inttegro.Codec.encode(value.content_type)),
      "disposition" =>
        if(is_nil(value.disposition), do: nil, else: Inttegro.Codec.encode(value.disposition))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.DeliveryInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct mode: nil, filename: nil, content_type: nil, disposition: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          mode: Inttegro.FileLinks.DeliveryMode.t() | nil,
          filename: String.t() | nil,
          content_type: String.t() | nil,
          disposition: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      mode:
        if(is_nil(Map.get(map, "mode")),
          do: nil,
          else: Inttegro.FileLinks.DeliveryMode.decode(Map.get(map, "mode"))
        ),
      filename: if(is_nil(Map.get(map, "filename")), do: nil, else: Map.get(map, "filename")),
      content_type:
        if(is_nil(Map.get(map, "content_type")), do: nil, else: Map.get(map, "content_type")),
      disposition:
        if(is_nil(Map.get(map, "disposition")), do: nil, else: Map.get(map, "disposition"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "mode" =>
        if(is_nil(value.mode),
          do: nil,
          else: Inttegro.FileLinks.DeliveryMode.encode(value.mode)
        ),
      "filename" =>
        if(is_nil(value.filename), do: nil, else: Inttegro.Codec.encode(value.filename)),
      "content_type" =>
        if(is_nil(value.content_type), do: nil, else: Inttegro.Codec.encode(value.content_type)),
      "disposition" =>
        if(is_nil(value.disposition), do: nil, else: Inttegro.Codec.encode(value.disposition))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size, :file_links]
  defstruct number: nil, size: nil, file_links: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          file_links: [Inttegro.FileLinks.FileLink.t()]
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
      file_links:
        Enum.map(Map.fetch!(map, "file_links"), fn item ->
          Inttegro.FileLinks.FileLink.from_map(item)
        end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "file_links" => Enum.map(value.file_links, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.LookupRequest do
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

defmodule Inttegro.FileLinks.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct file_id: nil, status: nil, page_number: nil, page_size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          file_id: String.t() | nil,
          status: Inttegro.FileLinks.Status.t() | nil,
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
      file_id: if(is_nil(Map.get(map, "file_id")), do: nil, else: Map.get(map, "file_id")),
      status:
        if(is_nil(Map.get(map, "status")),
          do: nil,
          else: Inttegro.FileLinks.Status.decode(Map.get(map, "status"))
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
      "file_id" => if(is_nil(value.file_id), do: nil, else: Inttegro.Codec.encode(value.file_id)),
      "status" =>
        if(is_nil(value.status),
          do: nil,
          else: Inttegro.FileLinks.Status.encode(value.status)
        ),
      "page_number" =>
        if(is_nil(value.page_number), do: nil, else: Inttegro.Codec.encode(value.page_number)),
      "page_size" =>
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FileLinks.RevokeRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:id]
  defstruct revoked_by: nil, id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          revoked_by: Inttegro.Files.ActorInput.t() | nil,
          id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      revoked_by:
        if(is_nil(Map.get(map, "revoked_by")),
          do: nil,
          else: Inttegro.Files.ActorInput.from_map(Map.get(map, "revoked_by"))
        ),
      id: Map.fetch!(map, "id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "revoked_by" =>
        if(is_nil(value.revoked_by), do: nil, else: Inttegro.Codec.encode(value.revoked_by)),
      "id" => Inttegro.Codec.encode(value.id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
