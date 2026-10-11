# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Apps.AppCredentialOwner do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :child | :parent | String.t()
  @values %{
    child: "child",
    parent: "parent"
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

defmodule Inttegro.Apps.AppManagementRole do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :parent | :child | String.t()
  @values %{
    parent: "parent",
    child: "child"
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

defmodule Inttegro.Apps.AppRelationshipKind do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :placement | String.t()
  @values %{
    placement: "placement"
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

defmodule Inttegro.Apps.AppRelationshipStatus do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :active | :inactive | :suspended | :revoked | String.t()
  @values %{
    active: "active",
    inactive: "inactive",
    suspended: "suspended",
    revoked: "revoked"
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

defmodule Inttegro.Apps.Application do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :name, :created_at, :capabilities]
  defstruct id: nil,
            name: nil,
            alias: nil,
            description: nil,
            created_at: nil,
            updated_at: nil,
            archived_at: nil,
            capabilities: nil,
            secret_key: nil,
            relationship: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          alias: String.t() | nil,
          description: String.t() | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t() | nil,
          archived_at: DateTime.t() | nil,
          capabilities: map(),
          secret_key: Inttegro.Apps.ApplicationSecretKey.t() | nil,
          relationship: Inttegro.Apps.ApplicationRelationship.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      name: Map.fetch!(map, "name"),
      alias: if(is_nil(Map.get(map, "alias")), do: nil, else: Map.get(map, "alias")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      updated_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "updated_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "updated_at"))
        ),
      archived_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))
        ),
      capabilities: Map.fetch!(map, "capabilities"),
      secret_key:
        if(is_nil(Map.get(map, "secret_key")),
          do: nil,
          else: Inttegro.Apps.ApplicationSecretKey.from_map(Map.get(map, "secret_key"))
        ),
      relationship:
        if(is_nil(Map.get(map, "relationship")),
          do: nil,
          else: Inttegro.Apps.ApplicationRelationship.from_map(Map.get(map, "relationship"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "name" => Inttegro.Codec.encode(value.name),
      "alias" => if(is_nil(value.alias), do: nil, else: Inttegro.Codec.encode(value.alias)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at)),
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at)),
      "capabilities" => Inttegro.Codec.encode(value.capabilities),
      "secret_key" =>
        if(is_nil(value.secret_key), do: nil, else: Inttegro.Codec.encode(value.secret_key)),
      "relationship" =>
        if(is_nil(value.relationship), do: nil, else: Inttegro.Codec.encode(value.relationship))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.ApplicationRelationshipParent do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :name]
  defstruct id: nil, name: nil, alias: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{id: String.t(), name: String.t(), alias: String.t() | nil}
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      name: Map.fetch!(map, "name"),
      alias: Map.get(map, "alias")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "name" => Inttegro.Codec.encode(value.name),
      "alias" => if(is_nil(value.alias), do: nil, else: Inttegro.Codec.encode(value.alias))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.ApplicationRelationship do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [
    :id,
    :kind,
    :parent,
    :status,
    :created_at
  ]
  defstruct id: nil,
            kind: nil,
            parent: nil,
            status: nil,
            created_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          kind: Inttegro.Apps.AppRelationshipKind.t(),
          parent: Inttegro.Apps.ApplicationRelationshipParent.t(),
          status: Inttegro.Apps.AppRelationshipStatus.t(),
          created_at: DateTime.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      kind: Inttegro.Apps.AppRelationshipKind.decode(Map.fetch!(map, "kind")),
      parent: Inttegro.Apps.ApplicationRelationshipParent.from_map(Map.fetch!(map, "parent")),
      status: Inttegro.Apps.AppRelationshipStatus.decode(Map.fetch!(map, "status")),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "kind" => Inttegro.Apps.AppRelationshipKind.encode(value.kind),
      "parent" => Inttegro.Codec.encode(value.parent),
      "status" => Inttegro.Apps.AppRelationshipStatus.encode(value.status),
      "created_at" => Inttegro.Codec.encode(value.created_at)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.ApplicationRelationshipPolicy do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:child_standing, :management, :credentials]
  defstruct child_standing: nil, management: nil, credentials: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          child_standing: String.t(),
          management: Inttegro.Apps.AppManagementRole.t(),
          credentials: Inttegro.Apps.AppCredentialOwner.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      child_standing: Map.fetch!(map, "child_standing"),
      management: Inttegro.Apps.AppManagementRole.decode(Map.fetch!(map, "management")),
      credentials: Inttegro.Apps.AppCredentialOwner.decode(Map.fetch!(map, "credentials"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "child_standing" => Inttegro.Codec.encode(value.child_standing),
      "management" => Inttegro.Apps.AppManagementRole.encode(value.management),
      "credentials" => Inttegro.Apps.AppCredentialOwner.encode(value.credentials)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.ApplicationSecretKey do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct id: nil, token_type: nil, issued_at: nil, token: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t() | nil,
          token_type: String.t() | nil,
          issued_at: DateTime.t() | nil,
          token: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      token_type:
        if(is_nil(Map.get(map, "token_type")), do: nil, else: Map.get(map, "token_type")),
      issued_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "issued_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "issued_at"))
        ),
      token: if(is_nil(Map.get(map, "token")), do: nil, else: Map.get(map, "token"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "token_type" =>
        if(is_nil(value.token_type), do: nil, else: Inttegro.Codec.encode(value.token_type)),
      "issued_at" =>
        if(is_nil(value.issued_at), do: nil, else: Inttegro.Codec.encode(value.issued_at)),
      "token" => if(is_nil(value.token), do: nil, else: Inttegro.Codec.encode(value.token))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.CreateApplicationRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name]
  defstruct alias: nil,
            description: nil,
            legal_entity_type: nil,
            placement_parent_application_id: nil,
            relationship_policy: nil,
            name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          alias: String.t() | nil,
          description: String.t() | nil,
          legal_entity_type: String.t() | nil,
          placement_parent_application_id: String.t() | nil,
          relationship_policy: Inttegro.Apps.CreateApplicationRequestRelationshipPolicy.t() | nil,
          name: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      alias: if(is_nil(Map.get(map, "alias")), do: nil, else: Map.get(map, "alias")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      legal_entity_type:
        if(is_nil(Map.get(map, "legal_entity_type")),
          do: nil,
          else: Map.get(map, "legal_entity_type")
        ),
      placement_parent_application_id:
        if(is_nil(Map.get(map, "placement_parent_application_id")),
          do: nil,
          else: Map.get(map, "placement_parent_application_id")
        ),
      relationship_policy:
        if(is_nil(Map.get(map, "relationship_policy")),
          do: nil,
          else:
            Inttegro.Apps.CreateApplicationRequestRelationshipPolicy.from_map(
              Map.get(map, "relationship_policy")
            )
        ),
      name: Map.fetch!(map, "name")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "alias" => if(is_nil(value.alias), do: nil, else: Inttegro.Codec.encode(value.alias)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "legal_entity_type" =>
        if(is_nil(value.legal_entity_type),
          do: nil,
          else: Inttegro.Codec.encode(value.legal_entity_type)
        ),
      "placement_parent_application_id" =>
        if(is_nil(value.placement_parent_application_id),
          do: nil,
          else: Inttegro.Codec.encode(value.placement_parent_application_id)
        ),
      "relationship_policy" =>
        if(is_nil(value.relationship_policy),
          do: nil,
          else: Inttegro.Codec.encode(value.relationship_policy)
        ),
      "name" => Inttegro.Codec.encode(value.name)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.CreateApplicationRequestRelationshipPolicy do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct child_standing: nil, management: nil, credentials: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          child_standing: String.t() | nil,
          management: Inttegro.Apps.AppManagementRole.t() | nil,
          credentials: Inttegro.Apps.AppCredentialOwner.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      child_standing:
        if(is_nil(Map.get(map, "child_standing")), do: nil, else: Map.get(map, "child_standing")),
      management:
        if(is_nil(Map.get(map, "management")),
          do: nil,
          else: Inttegro.Apps.AppManagementRole.decode(Map.get(map, "management"))
        ),
      credentials:
        if(is_nil(Map.get(map, "credentials")),
          do: nil,
          else: Inttegro.Apps.AppCredentialOwner.decode(Map.get(map, "credentials"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "child_standing" =>
        if(is_nil(value.child_standing),
          do: nil,
          else: Inttegro.Codec.encode(value.child_standing)
        ),
      "management" =>
        if(is_nil(value.management),
          do: nil,
          else: Inttegro.Apps.AppManagementRole.encode(value.management)
        ),
      "credentials" =>
        if(is_nil(value.credentials),
          do: nil,
          else: Inttegro.Apps.AppCredentialOwner.encode(value.credentials)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Apps.UpdateApplicationRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct name: nil, alias: nil, description: nil, legal_entity_type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          alias: String.t() | nil,
          description: String.t() | nil,
          legal_entity_type: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      alias: if(is_nil(Map.get(map, "alias")), do: nil, else: Map.get(map, "alias")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      legal_entity_type:
        if(is_nil(Map.get(map, "legal_entity_type")),
          do: nil,
          else: Map.get(map, "legal_entity_type")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "alias" => if(is_nil(value.alias), do: nil, else: Inttegro.Codec.encode(value.alias)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "legal_entity_type" =>
        if(is_nil(value.legal_entity_type),
          do: nil,
          else: Inttegro.Codec.encode(value.legal_entity_type)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
