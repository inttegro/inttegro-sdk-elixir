# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.PaymentMethods.MobileMoneyNetwork do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :airtel | :mtn | :telecel | :vodafone | String.t()
  @values %{
    airtel: "airtel",
    mtn: "mtn",
    telecel: "telecel",
    vodafone: "vodafone"
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

defmodule Inttegro.PaymentMethods.Type do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :mobile_money | :bank_account | :card | :motito | String.t()
  @values %{
    mobile_money: "mobile_money",
    bank_account: "bank_account",
    card: "card",
    motito: "motito"
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

defmodule Inttegro.PaymentMethods.ActivateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payment_method_id]
  defstruct payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.ArchiveRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payment_method_id]
  defstruct payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.DisactivateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payment_method_id]
  defstruct payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.GetSettingsRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct []
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{}
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{}
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(_value) do
    %{} |> Enum.reject(fn {_key, item} -> is_nil(item) end) |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payment_method_id]
  defstruct payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.PaymentMethod do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:active, :created_at, :customer_id, :fingerprint, :id, :type]
  defstruct active: nil,
            archived_at: nil,
            bank_account: nil,
            card: nil,
            created_at: nil,
            custom_data: nil,
            customer_id: nil,
            ephemeral: nil,
            expires_on: nil,
            fingerprint: nil,
            id: nil,
            mobile_money: nil,
            owner: nil,
            type: nil,
            supplied: nil,
            verification: nil,
            verified_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          active: boolean(),
          archived_at: DateTime.t() | nil,
          bank_account: Inttegro.PaymentMethods.BankAccount.t() | nil,
          card: Inttegro.PaymentMethods.Card.t() | nil,
          created_at: DateTime.t(),
          custom_data: Inttegro.CustomData.t() | nil,
          customer_id: String.t(),
          ephemeral: boolean() | nil,
          expires_on: DateTime.t() | nil,
          fingerprint: String.t(),
          id: String.t(),
          mobile_money: Inttegro.PaymentMethods.MobileMoney.t() | nil,
          owner: Inttegro.PaymentMethods.Owner.t() | nil,
          type: Inttegro.PaymentMethods.Type.t(),
          supplied: Inttegro.PaymentMethods.Supplied.t() | nil,
          verification: Inttegro.PaymentMethods.Verification.t() | nil,
          verified_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      active: Map.fetch!(map, "active"),
      archived_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))
        ),
      bank_account:
        if(is_nil(Map.get(map, "bank_account")),
          do: nil,
          else: Inttegro.PaymentMethods.BankAccount.from_map(Map.get(map, "bank_account"))
        ),
      card:
        if(is_nil(Map.get(map, "card")),
          do: nil,
          else: Inttegro.PaymentMethods.Card.from_map(Map.get(map, "card"))
        ),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      customer_id: Map.fetch!(map, "customer_id"),
      ephemeral: if(is_nil(Map.get(map, "ephemeral")), do: nil, else: Map.get(map, "ephemeral")),
      expires_on:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expires_on"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expires_on"))
        ),
      fingerprint: Map.fetch!(map, "fingerprint"),
      id: Map.fetch!(map, "id"),
      mobile_money:
        if(is_nil(Map.get(map, "mobile_money")),
          do: nil,
          else: Inttegro.PaymentMethods.MobileMoney.from_map(Map.get(map, "mobile_money"))
        ),
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.PaymentMethods.Owner.from_map(Map.get(map, "owner"))
        ),
      type: Inttegro.PaymentMethods.Type.decode(Map.fetch!(map, "type")),
      supplied:
        if(is_nil(Map.get(map, "supplied")),
          do: nil,
          else: Inttegro.PaymentMethods.Supplied.from_map(Map.get(map, "supplied"))
        ),
      verification:
        if(is_nil(Map.get(map, "verification")),
          do: nil,
          else: Inttegro.PaymentMethods.Verification.from_map(Map.get(map, "verification"))
        ),
      verified_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "verified_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "verified_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "active" => Inttegro.Codec.encode(value.active),
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at)),
      "bank_account" =>
        if(is_nil(value.bank_account), do: nil, else: Inttegro.Codec.encode(value.bank_account)),
      "card" => if(is_nil(value.card), do: nil, else: Inttegro.Codec.encode(value.card)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "customer_id" => Inttegro.Codec.encode(value.customer_id),
      "ephemeral" =>
        if(is_nil(value.ephemeral), do: nil, else: Inttegro.Codec.encode(value.ephemeral)),
      "expires_on" =>
        if(is_nil(value.expires_on), do: nil, else: Inttegro.Codec.encode(value.expires_on)),
      "fingerprint" => Inttegro.Codec.encode(value.fingerprint),
      "id" => Inttegro.Codec.encode(value.id),
      "mobile_money" =>
        if(is_nil(value.mobile_money), do: nil, else: Inttegro.Codec.encode(value.mobile_money)),
      "owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner)),
      "type" => Inttegro.PaymentMethods.Type.encode(value.type),
      "supplied" =>
        if(is_nil(value.supplied), do: nil, else: Inttegro.Codec.encode(value.supplied)),
      "verification" =>
        if(is_nil(value.verification), do: nil, else: Inttegro.Codec.encode(value.verification)),
      "verified_at" =>
        if(is_nil(value.verified_at), do: nil, else: Inttegro.Codec.encode(value.verified_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.BankAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct ghana_bank_account: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          ghana_bank_account: Inttegro.PaymentMethods.BankAccountGhanaBankAccount.t() | nil,
          type: Inttegro.BankAccounts.Type.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      ghana_bank_account:
        if(is_nil(Map.get(map, "ghana_bank_account")),
          do: nil,
          else:
            Inttegro.PaymentMethods.BankAccountGhanaBankAccount.from_map(
              Map.get(map, "ghana_bank_account")
            )
        ),
      type: Inttegro.BankAccounts.Type.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "ghana_bank_account" =>
        if(is_nil(value.ghana_bank_account),
          do: nil,
          else: Inttegro.Codec.encode(value.ghana_bank_account)
        ),
      "type" => Inttegro.BankAccounts.Type.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.BankAccountGhanaBankAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:account_number]
  defstruct branch: nil, name: nil, account_number: nil, sort_code: nil, swift_code: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          branch: String.t() | nil,
          name: String.t() | nil,
          account_number: String.t(),
          sort_code: String.t() | nil,
          swift_code: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      branch: if(is_nil(Map.get(map, "branch")), do: nil, else: Map.get(map, "branch")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      account_number: Map.fetch!(map, "account_number"),
      sort_code: if(is_nil(Map.get(map, "sort_code")), do: nil, else: Map.get(map, "sort_code")),
      swift_code:
        if(is_nil(Map.get(map, "swift_code")), do: nil, else: Map.get(map, "swift_code"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "branch" => if(is_nil(value.branch), do: nil, else: Inttegro.Codec.encode(value.branch)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "account_number" => Inttegro.Codec.encode(value.account_number),
      "sort_code" =>
        if(is_nil(value.sort_code), do: nil, else: Inttegro.Codec.encode(value.sort_code)),
      "swift_code" =>
        if(is_nil(value.swift_code), do: nil, else: Inttegro.Codec.encode(value.swift_code))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.DataInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type]
  defstruct mobile_money: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          mobile_money: Inttegro.PaymentMethods.DataInputMobileMoney.t() | nil,
          type: Inttegro.PaymentMethods.Type.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      mobile_money:
        if(is_nil(Map.get(map, "mobile_money")),
          do: nil,
          else:
            Inttegro.PaymentMethods.DataInputMobileMoney.from_map(Map.get(map, "mobile_money"))
        ),
      type: Inttegro.PaymentMethods.Type.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "mobile_money" =>
        if(is_nil(value.mobile_money), do: nil, else: Inttegro.Codec.encode(value.mobile_money)),
      "type" => Inttegro.PaymentMethods.Type.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.DataInputMobileMoney do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:network, :account_number]
  defstruct network: nil, account_number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          network: Inttegro.PaymentMethods.MobileMoneyNetwork.t(),
          account_number: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      network: Inttegro.PaymentMethods.MobileMoneyNetwork.decode(Map.fetch!(map, "network")),
      account_number: Map.fetch!(map, "account_number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "network" => Inttegro.PaymentMethods.MobileMoneyNetwork.encode(value.network),
      "account_number" => Inttegro.Codec.encode(value.account_number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Deletion do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:deleted, :payment_method_id]
  defstruct deleted: nil, payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          deleted: boolean(),
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      deleted: Map.fetch!(map, "deleted"),
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "deleted" => Inttegro.Codec.encode(value.deleted),
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.MobileMoney do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:account_number, :last4, :network]
  defstruct account_number: nil, last4: nil, network: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          account_number: String.t(),
          last4: String.t(),
          network: Inttegro.PaymentMethods.MobileMoneyNetwork.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      account_number: Map.fetch!(map, "account_number"),
      last4: Map.fetch!(map, "last4"),
      network: Inttegro.PaymentMethods.MobileMoneyNetwork.decode(Map.fetch!(map, "network"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "account_number" => Inttegro.Codec.encode(value.account_number),
      "last4" => Inttegro.Codec.encode(value.last4),
      "network" => Inttegro.PaymentMethods.MobileMoneyNetwork.encode(value.network)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Owner do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:name]
  defstruct address: nil, name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          address: Inttegro.PaymentMethods.OwnerAddress.t() | nil,
          name: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address:
        if(is_nil(Map.get(map, "address")),
          do: nil,
          else: Inttegro.PaymentMethods.OwnerAddress.from_map(Map.get(map, "address"))
        ),
      name: Map.fetch!(map, "name")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "address" => if(is_nil(value.address), do: nil, else: Inttegro.Codec.encode(value.address)),
      "name" => Inttegro.Codec.encode(value.name)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.OwnerAddress do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:country]
  defstruct city: nil,
            country: nil,
            line_1: nil,
            line_2: nil,
            name: nil,
            phone_number: nil,
            post_code: nil,
            region: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t(),
          line_1: String.t() | nil,
          line_2: String.t() | nil,
          name: String.t() | nil,
          phone_number: String.t() | nil,
          post_code: String.t() | nil,
          region: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      city: if(is_nil(Map.get(map, "city")), do: nil, else: Map.get(map, "city")),
      country: Map.fetch!(map, "country"),
      line_1: if(is_nil(Map.get(map, "line_1")), do: nil, else: Map.get(map, "line_1")),
      line_2: if(is_nil(Map.get(map, "line_2")), do: nil, else: Map.get(map, "line_2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "city" => if(is_nil(value.city), do: nil, else: Inttegro.Codec.encode(value.city)),
      "country" => Inttegro.Codec.encode(value.country),
      "line_1" => if(is_nil(value.line_1), do: nil, else: Inttegro.Codec.encode(value.line_1)),
      "line_2" => if(is_nil(value.line_2), do: nil, else: Inttegro.Codec.encode(value.line_2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.OwnerInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:address, :name]
  defstruct address: nil, name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          address: Inttegro.PaymentMethods.OwnerInputAddress.t(),
          name: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address: Inttegro.PaymentMethods.OwnerInputAddress.from_map(Map.fetch!(map, "address")),
      name: Map.fetch!(map, "name")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "address" => Inttegro.Codec.encode(value.address),
      "name" => Inttegro.Codec.encode(value.name)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.OwnerInputAddress do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:country]
  defstruct city: nil,
            line1: nil,
            line2: nil,
            name: nil,
            phone_number: nil,
            post_code: nil,
            region: nil,
            country: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          line1: String.t() | nil,
          line2: String.t() | nil,
          name: String.t() | nil,
          phone_number: String.t() | nil,
          post_code: String.t() | nil,
          region: String.t() | nil,
          country: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      city: if(is_nil(Map.get(map, "city")), do: nil, else: Map.get(map, "city")),
      line1: if(is_nil(Map.get(map, "line1")), do: nil, else: Map.get(map, "line1")),
      line2: if(is_nil(Map.get(map, "line2")), do: nil, else: Map.get(map, "line2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region")),
      country: Map.fetch!(map, "country")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "city" => if(is_nil(value.city), do: nil, else: Inttegro.Codec.encode(value.city)),
      "line1" => if(is_nil(value.line1), do: nil, else: Inttegro.Codec.encode(value.line1)),
      "line2" => if(is_nil(value.line2), do: nil, else: Inttegro.Codec.encode(value.line2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region)),
      "country" => Inttegro.Codec.encode(value.country)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :payment_methods, :size]
  defstruct number: nil, payment_methods: nil, size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          payment_methods: [Inttegro.PaymentMethods.PaymentMethod.t()],
          size: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: Map.fetch!(map, "number"),
      payment_methods:
        Enum.map(Map.fetch!(map, "payment_methods"), fn item ->
          Inttegro.PaymentMethods.PaymentMethod.from_map(item)
        end),
      size: Map.fetch!(map, "size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "payment_methods" =>
        Enum.map(value.payment_methods, fn item -> Inttegro.Codec.encode(item) end),
      "size" => Inttegro.Codec.encode(value.size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct customer_id: nil, page_number: nil, page_size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          customer_id: String.t() | nil,
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
      customer_id:
        if(is_nil(Map.get(map, "customer_id")), do: nil, else: Map.get(map, "customer_id")),
      page_number:
        if(is_nil(Map.get(map, "page_number")), do: nil, else: Map.get(map, "page_number")),
      page_size: if(is_nil(Map.get(map, "page_size")), do: nil, else: Map.get(map, "page_size"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "customer_id" =>
        if(is_nil(value.customer_id), do: nil, else: Inttegro.Codec.encode(value.customer_id)),
      "page_number" =>
        if(is_nil(value.page_number), do: nil, else: Inttegro.Codec.encode(value.page_number)),
      "page_size" =>
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Settings do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct mobile_money: nil, bank_account: nil, card: nil, motito: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          mobile_money: Inttegro.PaymentMethods.TypeSetting.t() | nil,
          bank_account: Inttegro.PaymentMethods.TypeSetting.t() | nil,
          card: Inttegro.PaymentMethods.TypeSetting.t() | nil,
          motito: Inttegro.PaymentMethods.TypeSetting.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      mobile_money:
        if(is_nil(Map.get(map, "mobile_money")),
          do: nil,
          else: Inttegro.PaymentMethods.TypeSetting.from_map(Map.get(map, "mobile_money"))
        ),
      bank_account:
        if(is_nil(Map.get(map, "bank_account")),
          do: nil,
          else: Inttegro.PaymentMethods.TypeSetting.from_map(Map.get(map, "bank_account"))
        ),
      card:
        if(is_nil(Map.get(map, "card")),
          do: nil,
          else: Inttegro.PaymentMethods.TypeSetting.from_map(Map.get(map, "card"))
        ),
      motito:
        if(is_nil(Map.get(map, "motito")),
          do: nil,
          else: Inttegro.PaymentMethods.TypeSetting.from_map(Map.get(map, "motito"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "mobile_money" =>
        if(is_nil(value.mobile_money), do: nil, else: Inttegro.Codec.encode(value.mobile_money)),
      "bank_account" =>
        if(is_nil(value.bank_account), do: nil, else: Inttegro.Codec.encode(value.bank_account)),
      "card" => if(is_nil(value.card), do: nil, else: Inttegro.Codec.encode(value.card)),
      "motito" => if(is_nil(value.motito), do: nil, else: Inttegro.Codec.encode(value.motito))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Card do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{}
  defstruct []
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map) when map == %{}, do: %__MODULE__{}
  @spec to_map(t()) :: map()
  def to_map(%__MODULE__{}), do: %{}
end

defmodule Inttegro.PaymentMethods.Snapshot do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :created_at, :customer_id, :type, :verified]
  defstruct id: nil,
            bank_account: nil,
            card: nil,
            created_at: nil,
            customer_id: nil,
            mobile_money: nil,
            owner: nil,
            type: nil,
            verified: nil,
            verified_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          bank_account: Inttegro.PaymentMethods.SnapshotBankAccount.t() | nil,
          card: Inttegro.PaymentMethods.Card.t() | nil,
          created_at: DateTime.t(),
          customer_id: String.t(),
          mobile_money: Inttegro.PaymentMethods.SnapshotMobileMoney.t() | nil,
          owner: Inttegro.PaymentMethods.SnapshotOwner.t() | nil,
          type: Inttegro.PaymentMethods.Type.t(),
          verified: boolean(),
          verified_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      bank_account:
        if(is_nil(Map.get(map, "bank_account")),
          do: nil,
          else: Inttegro.PaymentMethods.SnapshotBankAccount.from_map(Map.get(map, "bank_account"))
        ),
      card:
        if(is_nil(Map.get(map, "card")),
          do: nil,
          else: Inttegro.PaymentMethods.Card.from_map(Map.get(map, "card"))
        ),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      customer_id: Map.fetch!(map, "customer_id"),
      mobile_money:
        if(is_nil(Map.get(map, "mobile_money")),
          do: nil,
          else: Inttegro.PaymentMethods.SnapshotMobileMoney.from_map(Map.get(map, "mobile_money"))
        ),
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.PaymentMethods.SnapshotOwner.from_map(Map.get(map, "owner"))
        ),
      type: Inttegro.PaymentMethods.Type.decode(Map.fetch!(map, "type")),
      verified: Map.fetch!(map, "verified"),
      verified_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "verified_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "verified_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "bank_account" =>
        if(is_nil(value.bank_account), do: nil, else: Inttegro.Codec.encode(value.bank_account)),
      "card" =>
        if(is_nil(value.card),
          do: nil,
          else: Inttegro.Codec.encode(value.card)
        ),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "customer_id" => Inttegro.Codec.encode(value.customer_id),
      "mobile_money" =>
        if(is_nil(value.mobile_money), do: nil, else: Inttegro.Codec.encode(value.mobile_money)),
      "owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner)),
      "type" => Inttegro.PaymentMethods.Type.encode(value.type),
      "verified" => Inttegro.Codec.encode(value.verified),
      "verified_at" =>
        if(is_nil(value.verified_at), do: nil, else: Inttegro.Codec.encode(value.verified_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.SnapshotBankAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct type: nil, ghana_bank_account: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t(),
          ghana_bank_account: Inttegro.PaymentMethods.SnapshotGhanaBankAccount.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Map.fetch!(map, "type"),
      ghana_bank_account:
        if(is_nil(Map.get(map, "ghana_bank_account")),
          do: nil,
          else:
            Inttegro.PaymentMethods.SnapshotGhanaBankAccount.from_map(
              Map.get(map, "ghana_bank_account")
            )
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Codec.encode(value.type),
      "ghana_bank_account" =>
        if(is_nil(value.ghana_bank_account),
          do: nil,
          else: Inttegro.Codec.encode(value.ghana_bank_account)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.SnapshotGhanaBankAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:account_number]
  defstruct account_number: nil, branch: nil, name: nil, sort_code: nil, swift_code: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          account_number: String.t(),
          branch: String.t() | nil,
          name: String.t() | nil,
          sort_code: String.t() | nil,
          swift_code: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      account_number: Map.fetch!(map, "account_number"),
      branch: if(is_nil(Map.get(map, "branch")), do: nil, else: Map.get(map, "branch")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      sort_code: if(is_nil(Map.get(map, "sort_code")), do: nil, else: Map.get(map, "sort_code")),
      swift_code:
        if(is_nil(Map.get(map, "swift_code")), do: nil, else: Map.get(map, "swift_code"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "account_number" => Inttegro.Codec.encode(value.account_number),
      "branch" => if(is_nil(value.branch), do: nil, else: Inttegro.Codec.encode(value.branch)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "sort_code" =>
        if(is_nil(value.sort_code), do: nil, else: Inttegro.Codec.encode(value.sort_code)),
      "swift_code" =>
        if(is_nil(value.swift_code), do: nil, else: Inttegro.Codec.encode(value.swift_code))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.SnapshotMobileMoney do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:network, :account_number, :last4]
  defstruct network: nil, account_number: nil, last4: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          network: Inttegro.PaymentMethods.MobileMoneyNetwork.t(),
          account_number: String.t(),
          last4: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      network: Inttegro.PaymentMethods.MobileMoneyNetwork.decode(Map.fetch!(map, "network")),
      account_number: Map.fetch!(map, "account_number"),
      last4: Map.fetch!(map, "last4")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "network" => Inttegro.PaymentMethods.MobileMoneyNetwork.encode(value.network),
      "account_number" => Inttegro.Codec.encode(value.account_number),
      "last4" => Inttegro.Codec.encode(value.last4)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.SnapshotOwner do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:name]
  defstruct name: nil, address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          name: String.t(),
          address: Inttegro.Orders.Address.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: Map.fetch!(map, "name"),
      address:
        if(is_nil(Map.get(map, "address")),
          do: nil,
          else: Inttegro.Orders.Address.from_map(Map.get(map, "address"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => Inttegro.Codec.encode(value.name),
      "address" => if(is_nil(value.address), do: nil, else: Inttegro.Codec.encode(value.address))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Supplied do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:by, :supplied_at]
  defstruct attempt_id: nil,
            by: nil,
            channel: nil,
            resource_id: nil,
            resource_type: nil,
            supplied_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          attempt_id: String.t() | nil,
          by: String.t(),
          channel: String.t() | nil,
          resource_id: String.t() | nil,
          resource_type: String.t() | nil,
          supplied_at: DateTime.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      attempt_id:
        if(is_nil(Map.get(map, "attempt_id")), do: nil, else: Map.get(map, "attempt_id")),
      by: Map.fetch!(map, "by"),
      channel: if(is_nil(Map.get(map, "channel")), do: nil, else: Map.get(map, "channel")),
      resource_id:
        if(is_nil(Map.get(map, "resource_id")), do: nil, else: Map.get(map, "resource_id")),
      resource_type:
        if(is_nil(Map.get(map, "resource_type")), do: nil, else: Map.get(map, "resource_type")),
      supplied_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "supplied_at"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "attempt_id" =>
        if(is_nil(value.attempt_id), do: nil, else: Inttegro.Codec.encode(value.attempt_id)),
      "by" => Inttegro.Codec.encode(value.by),
      "channel" => if(is_nil(value.channel), do: nil, else: Inttegro.Codec.encode(value.channel)),
      "resource_id" =>
        if(is_nil(value.resource_id), do: nil, else: Inttegro.Codec.encode(value.resource_id)),
      "resource_type" =>
        if(is_nil(value.resource_type), do: nil, else: Inttegro.Codec.encode(value.resource_type)),
      "supplied_at" => Inttegro.Codec.encode(value.supplied_at)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.TypeSetting do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:enabled, :confirms_use]
  defstruct type: nil, name: nil, description: nil, enabled: nil, confirms_use: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: Inttegro.PaymentMethods.Type.t() | nil,
          name: String.t() | nil,
          description: String.t() | nil,
          enabled: boolean(),
          confirms_use: boolean()
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
          else: Inttegro.PaymentMethods.Type.decode(Map.get(map, "type"))
        ),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      enabled: Map.fetch!(map, "enabled"),
      confirms_use: Map.fetch!(map, "confirms_use")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" =>
        if(is_nil(value.type),
          do: nil,
          else: Inttegro.PaymentMethods.Type.encode(value.type)
        ),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "enabled" => Inttegro.Codec.encode(value.enabled),
      "confirms_use" => Inttegro.Codec.encode(value.confirms_use)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.Verification do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:initiated_at, :request_id, :type]
  defstruct completed_at: nil, initiated_at: nil, mechanism: nil, request_id: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          completed_at: DateTime.t() | nil,
          initiated_at: DateTime.t(),
          mechanism: String.t() | nil,
          request_id: String.t(),
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      completed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "completed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "completed_at"))
        ),
      initiated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initiated_at")),
      mechanism: if(is_nil(Map.get(map, "mechanism")), do: nil, else: Map.get(map, "mechanism")),
      request_id: Map.fetch!(map, "request_id"),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "completed_at" =>
        if(is_nil(value.completed_at), do: nil, else: Inttegro.Codec.encode(value.completed_at)),
      "initiated_at" => Inttegro.Codec.encode(value.initiated_at),
      "mechanism" =>
        if(is_nil(value.mechanism), do: nil, else: Inttegro.Codec.encode(value.mechanism)),
      "request_id" => Inttegro.Codec.encode(value.request_id),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.VerificationDelivery do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct recipient: nil, channel: nil, sender_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          recipient: String.t() | nil,
          channel: String.t() | nil,
          sender_id: String.t() | nil
        }
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      recipient: Map.get(map, "recipient"),
      channel: Map.get(map, "channel"),
      sender_id: Map.get(map, "sender_id")
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "recipient" => value.recipient,
      "channel" => value.channel,
      "sender_id" => value.sender_id
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.VerificationSession do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:payment_method_id, :status]
  defstruct payment_method_id: nil,
            status: nil,
            token_sent_at: nil,
            expires_at: nil,
            delivery: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          payment_method_id: String.t(),
          status: String.t(),
          token_sent_at: DateTime.t() | nil,
          expires_at: DateTime.t() | nil,
          delivery: Inttegro.PaymentMethods.VerificationDelivery.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id: Map.fetch!(map, "payment_method_id"),
      status: Map.fetch!(map, "status"),
      token_sent_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "token_sent_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "token_sent_at"))
        ),
      expires_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))
        ),
      delivery:
        if(is_nil(Map.get(map, "delivery")),
          do: nil,
          else: Inttegro.PaymentMethods.VerificationDelivery.from_map(Map.get(map, "delivery"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id),
      "status" => Inttegro.Codec.encode(value.status),
      "token_sent_at" =>
        if(is_nil(value.token_sent_at), do: nil, else: Inttegro.Codec.encode(value.token_sent_at)),
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at)),
      "delivery" =>
        if(is_nil(value.delivery),
          do: nil,
          else: Inttegro.Codec.encode(value.delivery)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.TokenizeMobileMoneyRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:customer_id, :type, :mobile_money, :owner]
  defstruct custom_data: nil, customer_id: nil, type: nil, mobile_money: nil, owner: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: Inttegro.CustomDataInput.t() | nil,
          customer_id: String.t(),
          type: Inttegro.PaymentMethods.Type.t(),
          mobile_money: Inttegro.PaymentMethods.TokenizeMobileMoneyRequestMobileMoney.t(),
          owner: Inttegro.PaymentMethods.OwnerInput.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      customer_id: Map.fetch!(map, "customer_id"),
      type: Inttegro.PaymentMethods.Type.decode(Map.fetch!(map, "type")),
      mobile_money:
        Inttegro.PaymentMethods.TokenizeMobileMoneyRequestMobileMoney.from_map(
          Map.fetch!(map, "mobile_money")
        ),
      owner: Inttegro.PaymentMethods.OwnerInput.from_map(Map.fetch!(map, "owner"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "customer_id" => Inttegro.Codec.encode(value.customer_id),
      "type" => Inttegro.PaymentMethods.Type.encode(value.type),
      "mobile_money" => Inttegro.Codec.encode(value.mobile_money),
      "owner" => Inttegro.Codec.encode(value.owner)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.TokenizeMobileMoneyRequestMobileMoney do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:account_number, :network]
  defstruct account_number: nil, network: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          account_number: String.t(),
          network: Inttegro.PaymentMethods.MobileMoneyNetwork.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      account_number: Map.fetch!(map, "account_number"),
      network: Inttegro.PaymentMethods.MobileMoneyNetwork.decode(Map.fetch!(map, "network"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "account_number" => Inttegro.Codec.encode(value.account_number),
      "network" => Inttegro.PaymentMethods.MobileMoneyNetwork.encode(value.network)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.UnarchiveRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payment_method_id]
  defstruct payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.UpdateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payment_method_id]
  defstruct custom_data: nil, active: nil, archived: nil, owner: nil, payment_method_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: Inttegro.CustomDataPatch.t() | nil,
          active: boolean() | nil,
          archived: boolean() | nil,
          owner: Inttegro.PaymentMethods.UpdateRequestOwner.t() | nil,
          payment_method_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataPatch.from_map(Map.get(map, "custom_data"))
        ),
      active: if(is_nil(Map.get(map, "active")), do: nil, else: Map.get(map, "active")),
      archived: if(is_nil(Map.get(map, "archived")), do: nil, else: Map.get(map, "archived")),
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.PaymentMethods.UpdateRequestOwner.from_map(Map.get(map, "owner"))
        ),
      payment_method_id: Map.fetch!(map, "payment_method_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "active" => if(is_nil(value.active), do: nil, else: Inttegro.Codec.encode(value.active)),
      "archived" =>
        if(is_nil(value.archived), do: nil, else: Inttegro.Codec.encode(value.archived)),
      "owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner)),
      "payment_method_id" => Inttegro.Codec.encode(value.payment_method_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.UpdateRequestOwner do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct name: nil, address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          address: Inttegro.PaymentMethods.UpdateRequestOwnerAddress.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      address:
        if(is_nil(Map.get(map, "address")),
          do: nil,
          else:
            Inttegro.PaymentMethods.UpdateRequestOwnerAddress.from_map(Map.get(map, "address"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "address" => if(is_nil(value.address), do: nil, else: Inttegro.Codec.encode(value.address))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.PaymentMethods.UpdateRequestOwnerAddress do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct city: nil,
            country: nil,
            line1: nil,
            line2: nil,
            name: nil,
            phone_number: nil,
            post_code: nil,
            region: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t() | nil,
          line1: String.t() | nil,
          line2: String.t() | nil,
          name: String.t() | nil,
          phone_number: String.t() | nil,
          post_code: String.t() | nil,
          region: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      city: if(is_nil(Map.get(map, "city")), do: nil, else: Map.get(map, "city")),
      country: if(is_nil(Map.get(map, "country")), do: nil, else: Map.get(map, "country")),
      line1: if(is_nil(Map.get(map, "line1")), do: nil, else: Map.get(map, "line1")),
      line2: if(is_nil(Map.get(map, "line2")), do: nil, else: Map.get(map, "line2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "city" => if(is_nil(value.city), do: nil, else: Inttegro.Codec.encode(value.city)),
      "country" => if(is_nil(value.country), do: nil, else: Inttegro.Codec.encode(value.country)),
      "line1" => if(is_nil(value.line1), do: nil, else: Inttegro.Codec.encode(value.line1)),
      "line2" => if(is_nil(value.line2), do: nil, else: Inttegro.Codec.encode(value.line2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
