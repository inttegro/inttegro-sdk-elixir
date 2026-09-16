# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.FinancialAccounts.Type do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :wallet | :bank_account | :dosh_account | String.t()
  @values %{
    wallet: "wallet",
    bank_account: "bank_account",
    dosh_account: "dosh_account"
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

defmodule Inttegro.FinancialAccounts.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.FinancialAccounts.WalletRequest.t()
          | Inttegro.FinancialAccounts.BankRequest.t()
          | Inttegro.FinancialAccounts.DoshRequest.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.FinancialAccounts.WalletRequest,
        Inttegro.FinancialAccounts.BankRequest,
        Inttegro.FinancialAccounts.DoshRequest
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

defmodule Inttegro.FinancialAccounts.FinancialAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:created_at, :currency, :id, :type]
  defstruct archived_at: nil,
            created_at: nil,
            currency: nil,
            custom_data: nil,
            description: nil,
            id: nil,
            institution: nil,
            label: nil,
            pull_configuration: nil,
            push_configuration: nil,
            reference: nil,
            supplied: nil,
            type: nil,
            verification: nil,
            bank_account: nil,
            disconnected_at: nil,
            dosh_account: nil,
            owner: nil,
            wallet: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          archived_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          currency: String.t(),
          custom_data: Inttegro.CustomData.t() | nil,
          description: String.t() | nil,
          id: String.t(),
          institution: Inttegro.FinancialAccounts.FinancialInstitution.t() | nil,
          label: String.t() | nil,
          pull_configuration: Inttegro.FinancialAccounts.PullConfiguration.t() | nil,
          push_configuration: Inttegro.FinancialAccounts.PushConfiguration.t() | nil,
          reference: String.t() | nil,
          supplied: Inttegro.Shared.ResourceSupply.t() | nil,
          type: Inttegro.FinancialAccounts.Type.t(),
          verification: %{optional(String.t()) => term()} | nil,
          bank_account: Inttegro.FinancialAccounts.Bank.t() | nil,
          disconnected_at: DateTime.t() | nil,
          dosh_account: %{optional(String.t()) => term()} | nil,
          owner: Inttegro.FinancialAccounts.Owner.t() | nil,
          wallet: Inttegro.FinancialAccounts.Wallet.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      archived_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))
        ),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      currency: Map.fetch!(map, "currency"),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      id: Map.fetch!(map, "id"),
      institution:
        if(is_nil(Map.get(map, "institution")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.FinancialInstitution.from_map(Map.get(map, "institution"))
        ),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      pull_configuration:
        if(is_nil(Map.get(map, "pull_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.PullConfiguration.from_map(
              Map.get(map, "pull_configuration")
            )
        ),
      push_configuration:
        if(is_nil(Map.get(map, "push_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.PushConfiguration.from_map(
              Map.get(map, "push_configuration")
            )
        ),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      supplied:
        if(is_nil(Map.get(map, "supplied")),
          do: nil,
          else: Inttegro.Shared.ResourceSupply.from_map(Map.get(map, "supplied"))
        ),
      type: Inttegro.FinancialAccounts.Type.decode(Map.fetch!(map, "type")),
      verification:
        if(is_nil(Map.get(map, "verification")),
          do: nil,
          else: Map.new(Map.get(map, "verification"), fn {key, value} -> {key, value} end)
        ),
      bank_account:
        if(is_nil(Map.get(map, "bank_account")),
          do: nil,
          else: Inttegro.FinancialAccounts.Bank.from_map(Map.get(map, "bank_account"))
        ),
      disconnected_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "disconnected_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "disconnected_at"))
        ),
      dosh_account:
        if(is_nil(Map.get(map, "dosh_account")),
          do: nil,
          else: Map.new(Map.get(map, "dosh_account"), fn {key, value} -> {key, value} end)
        ),
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.FinancialAccounts.Owner.from_map(Map.get(map, "owner"))
        ),
      wallet:
        if(is_nil(Map.get(map, "wallet")),
          do: nil,
          else: Inttegro.FinancialAccounts.Wallet.from_map(Map.get(map, "wallet"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "currency" => Inttegro.Codec.encode(value.currency),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "id" => Inttegro.Codec.encode(value.id),
      "institution" =>
        if(is_nil(value.institution), do: nil, else: Inttegro.Codec.encode(value.institution)),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "pull_configuration" =>
        if(is_nil(value.pull_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.pull_configuration)
        ),
      "push_configuration" =>
        if(is_nil(value.push_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.push_configuration)
        ),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "supplied" =>
        if(is_nil(value.supplied), do: nil, else: Inttegro.Codec.encode(value.supplied)),
      "type" => Inttegro.FinancialAccounts.Type.encode(value.type),
      "verification" =>
        if(is_nil(value.verification),
          do: nil,
          else:
            Map.new(value.verification, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "bank_account" =>
        if(is_nil(value.bank_account), do: nil, else: Inttegro.Codec.encode(value.bank_account)),
      "disconnected_at" =>
        if(is_nil(value.disconnected_at),
          do: nil,
          else: Inttegro.Codec.encode(value.disconnected_at)
        ),
      "dosh_account" =>
        if(is_nil(value.dosh_account),
          do: nil,
          else:
            Map.new(value.dosh_account, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner)),
      "wallet" => if(is_nil(value.wallet), do: nil, else: Inttegro.Codec.encode(value.wallet))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.Address do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:city, :country, :line_1, :region]
  defstruct city: nil,
            country: nil,
            line_1: nil,
            line_2: nil,
            name: nil,
            phone: nil,
            post_code: nil,
            region: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          city: String.t(),
          country: String.t(),
          line_1: String.t(),
          line_2: String.t() | nil,
          name: String.t() | nil,
          phone: String.t() | nil,
          post_code: String.t() | nil,
          region: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      city: Map.fetch!(map, "city"),
      country: Map.fetch!(map, "country"),
      line_1: Map.fetch!(map, "line_1"),
      line_2: if(is_nil(Map.get(map, "line_2")), do: nil, else: Map.get(map, "line_2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone: if(is_nil(Map.get(map, "phone")), do: nil, else: Map.get(map, "phone")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      region: Map.fetch!(map, "region")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "city" => Inttegro.Codec.encode(value.city),
      "country" => Inttegro.Codec.encode(value.country),
      "line_1" => Inttegro.Codec.encode(value.line_1),
      "line_2" => if(is_nil(value.line_2), do: nil, else: Inttegro.Codec.encode(value.line_2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone" => if(is_nil(value.phone), do: nil, else: Inttegro.Codec.encode(value.phone)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => Inttegro.Codec.encode(value.region)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.Bank do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct type: nil, ghana_bank_account: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: Inttegro.BankAccounts.Type.t(),
          ghana_bank_account: Inttegro.BankAccounts.GhanaAccount.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.BankAccounts.Type.decode(Map.fetch!(map, "type")),
      ghana_bank_account:
        if(is_nil(Map.get(map, "ghana_bank_account")),
          do: nil,
          else: Inttegro.BankAccounts.GhanaAccount.from_map(Map.get(map, "ghana_bank_account"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.BankAccounts.Type.encode(value.type),
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

defmodule Inttegro.FinancialAccounts.BankRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:currency, :label, :reference, :type, :bank_account]
  defstruct custom_data: nil,
            description: nil,
            owner: nil,
            pull_configuration: nil,
            push_configuration: nil,
            currency: nil,
            label: nil,
            reference: nil,
            type: nil,
            bank_account: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: Inttegro.CustomDataInput.t() | nil,
          description: String.t() | nil,
          owner: Inttegro.FinancialAccounts.OwnerInput.t() | nil,
          pull_configuration: Inttegro.FinancialAccounts.BankRequestPullConfiguration.t() | nil,
          push_configuration: Inttegro.FinancialAccounts.BankRequestPushConfiguration.t() | nil,
          currency: String.t(),
          label: String.t(),
          reference: String.t(),
          type: Inttegro.FinancialAccounts.Type.t(),
          bank_account: Inttegro.FinancialAccounts.BankRequestBankAccount.t()
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
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.FinancialAccounts.OwnerInput.from_map(Map.get(map, "owner"))
        ),
      pull_configuration:
        if(is_nil(Map.get(map, "pull_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.BankRequestPullConfiguration.from_map(
              Map.get(map, "pull_configuration")
            )
        ),
      push_configuration:
        if(is_nil(Map.get(map, "push_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.BankRequestPushConfiguration.from_map(
              Map.get(map, "push_configuration")
            )
        ),
      currency: Map.fetch!(map, "currency"),
      label: Map.fetch!(map, "label"),
      reference: Map.fetch!(map, "reference"),
      type: Inttegro.FinancialAccounts.Type.decode(Map.fetch!(map, "type")),
      bank_account:
        Inttegro.FinancialAccounts.BankRequestBankAccount.from_map(
          Map.fetch!(map, "bank_account")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner)),
      "pull_configuration" =>
        if(is_nil(value.pull_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.pull_configuration)
        ),
      "push_configuration" =>
        if(is_nil(value.push_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.push_configuration)
        ),
      "currency" => Inttegro.Codec.encode(value.currency),
      "label" => Inttegro.Codec.encode(value.label),
      "reference" => Inttegro.Codec.encode(value.reference),
      "type" => Inttegro.FinancialAccounts.Type.encode(value.type),
      "bank_account" => Inttegro.Codec.encode(value.bank_account)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.BankRequestBankAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type, :ghana_bank_account]
  defstruct type: nil, ghana_bank_account: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.BankAccounts.Type.t(),
          ghana_bank_account:
            Inttegro.FinancialAccounts.BankRequestBankAccountGhanaBankAccount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.BankAccounts.Type.decode(Map.fetch!(map, "type")),
      ghana_bank_account:
        Inttegro.FinancialAccounts.BankRequestBankAccountGhanaBankAccount.from_map(
          Map.fetch!(map, "ghana_bank_account")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.BankAccounts.Type.encode(value.type),
      "ghana_bank_account" => Inttegro.Codec.encode(value.ghana_bank_account)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.BankRequestBankAccountGhanaBankAccount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:number]
  defstruct bank_name: nil, branch: nil, sort_code: nil, swift_code: nil, holder: nil, number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          bank_name: String.t() | nil,
          branch: String.t() | nil,
          sort_code: String.t() | nil,
          swift_code: String.t() | nil,
          holder: Inttegro.FinancialAccounts.OwnerInput.t() | nil,
          number: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      bank_name: if(is_nil(Map.get(map, "bank_name")), do: nil, else: Map.get(map, "bank_name")),
      branch: if(is_nil(Map.get(map, "branch")), do: nil, else: Map.get(map, "branch")),
      sort_code: if(is_nil(Map.get(map, "sort_code")), do: nil, else: Map.get(map, "sort_code")),
      swift_code:
        if(is_nil(Map.get(map, "swift_code")), do: nil, else: Map.get(map, "swift_code")),
      holder:
        if(is_nil(Map.get(map, "holder")),
          do: nil,
          else: Inttegro.FinancialAccounts.OwnerInput.from_map(Map.get(map, "holder"))
        ),
      number: Map.fetch!(map, "number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bank_name" =>
        if(is_nil(value.bank_name), do: nil, else: Inttegro.Codec.encode(value.bank_name)),
      "branch" => if(is_nil(value.branch), do: nil, else: Inttegro.Codec.encode(value.branch)),
      "sort_code" =>
        if(is_nil(value.sort_code), do: nil, else: Inttegro.Codec.encode(value.sort_code)),
      "swift_code" =>
        if(is_nil(value.swift_code), do: nil, else: Inttegro.Codec.encode(value.swift_code)),
      "holder" => if(is_nil(value.holder), do: nil, else: Inttegro.Codec.encode(value.holder)),
      "number" => Inttegro.Codec.encode(value.number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.BankRequestPullConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct enabled: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          enabled: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled: if(is_nil(Map.get(map, "enabled")), do: nil, else: Map.get(map, "enabled"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled" => if(is_nil(value.enabled), do: nil, else: Inttegro.Codec.encode(value.enabled))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.BankRequestPushConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct enabled: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          enabled: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled: if(is_nil(Map.get(map, "enabled")), do: nil, else: Map.get(map, "enabled"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled" => if(is_nil(value.enabled), do: nil, else: Inttegro.Codec.encode(value.enabled))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.DisableRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:account_id]
  defstruct unset_as_payout_destination: nil, account_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          unset_as_payout_destination: boolean() | nil,
          account_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      unset_as_payout_destination:
        if(is_nil(Map.get(map, "unset_as_payout_destination")),
          do: nil,
          else: Map.get(map, "unset_as_payout_destination")
        ),
      account_id: Map.fetch!(map, "account_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "unset_as_payout_destination" =>
        if(is_nil(value.unset_as_payout_destination),
          do: nil,
          else: Inttegro.Codec.encode(value.unset_as_payout_destination)
        ),
      "account_id" => Inttegro.Codec.encode(value.account_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.DoshRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:currency, :label, :owner, :reference, :type, :dosh_account]
  defstruct custom_data: nil,
            description: nil,
            pull_configuration: nil,
            push_configuration: nil,
            currency: nil,
            label: nil,
            owner: nil,
            reference: nil,
            type: nil,
            dosh_account: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: Inttegro.CustomDataInput.t() | nil,
          description: String.t() | nil,
          pull_configuration: Inttegro.FinancialAccounts.DoshRequestPullConfiguration.t() | nil,
          push_configuration: Inttegro.FinancialAccounts.DoshRequestPushConfiguration.t() | nil,
          currency: String.t(),
          label: String.t(),
          owner: Inttegro.FinancialAccounts.OwnerInput.t(),
          reference: String.t(),
          type: Inttegro.FinancialAccounts.Type.t(),
          dosh_account: %{optional(String.t()) => term()}
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
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      pull_configuration:
        if(is_nil(Map.get(map, "pull_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.DoshRequestPullConfiguration.from_map(
              Map.get(map, "pull_configuration")
            )
        ),
      push_configuration:
        if(is_nil(Map.get(map, "push_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.DoshRequestPushConfiguration.from_map(
              Map.get(map, "push_configuration")
            )
        ),
      currency: Map.fetch!(map, "currency"),
      label: Map.fetch!(map, "label"),
      owner: Inttegro.FinancialAccounts.OwnerInput.from_map(Map.fetch!(map, "owner")),
      reference: Map.fetch!(map, "reference"),
      type: Inttegro.FinancialAccounts.Type.decode(Map.fetch!(map, "type")),
      dosh_account: Map.new(Map.fetch!(map, "dosh_account"), fn {key, value} -> {key, value} end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "pull_configuration" =>
        if(is_nil(value.pull_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.pull_configuration)
        ),
      "push_configuration" =>
        if(is_nil(value.push_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.push_configuration)
        ),
      "currency" => Inttegro.Codec.encode(value.currency),
      "label" => Inttegro.Codec.encode(value.label),
      "owner" => Inttegro.Codec.encode(value.owner),
      "reference" => Inttegro.Codec.encode(value.reference),
      "type" => Inttegro.FinancialAccounts.Type.encode(value.type),
      "dosh_account" =>
        Map.new(value.dosh_account, fn {key, value} ->
          {to_string(key), Inttegro.Codec.encode(value)}
        end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.DoshRequestPullConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct enabled: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          enabled: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled: if(is_nil(Map.get(map, "enabled")), do: nil, else: Map.get(map, "enabled"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled" => if(is_nil(value.enabled), do: nil, else: Inttegro.Codec.encode(value.enabled))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.DoshRequestPushConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct enabled: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          enabled: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled: if(is_nil(Map.get(map, "enabled")), do: nil, else: Map.get(map, "enabled"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled" => if(is_nil(value.enabled), do: nil, else: Inttegro.Codec.encode(value.enabled))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.EnablePullRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:account_id]
  defstruct ip_address: nil, user_agent: nil, account_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          ip_address: String.t() | nil,
          user_agent: String.t() | nil,
          account_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      ip_address:
        if(is_nil(Map.get(map, "ip_address")), do: nil, else: Map.get(map, "ip_address")),
      user_agent:
        if(is_nil(Map.get(map, "user_agent")), do: nil, else: Map.get(map, "user_agent")),
      account_id: Map.fetch!(map, "account_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "ip_address" =>
        if(is_nil(value.ip_address), do: nil, else: Inttegro.Codec.encode(value.ip_address)),
      "user_agent" =>
        if(is_nil(value.user_agent), do: nil, else: Inttegro.Codec.encode(value.user_agent)),
      "account_id" => Inttegro.Codec.encode(value.account_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.IDRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:account_id]
  defstruct account_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          account_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      account_id: Map.fetch!(map, "account_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "account_id" => Inttegro.Codec.encode(value.account_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.Owner do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:address, :name]
  defstruct address: nil, name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          address: Inttegro.FinancialAccounts.Address.t(),
          name: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address: Inttegro.FinancialAccounts.Address.from_map(Map.fetch!(map, "address")),
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

defmodule Inttegro.FinancialAccounts.OwnerInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name, :address]
  defstruct name: nil, address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t(),
          address: Inttegro.FinancialAccounts.OwnerInputAddress.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: Map.fetch!(map, "name"),
      address: Inttegro.FinancialAccounts.OwnerInputAddress.from_map(Map.fetch!(map, "address"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => Inttegro.Codec.encode(value.name),
      "address" => Inttegro.Codec.encode(value.address)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.OwnerInputAddress do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:country]
  defstruct city: nil,
            line_1: nil,
            line_2: nil,
            name: nil,
            phone: nil,
            post_code: nil,
            region: nil,
            country: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          line_1: String.t() | nil,
          line_2: String.t() | nil,
          name: String.t() | nil,
          phone: String.t() | nil,
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
      line_1: if(is_nil(Map.get(map, "line_1")), do: nil, else: Map.get(map, "line_1")),
      line_2: if(is_nil(Map.get(map, "line_2")), do: nil, else: Map.get(map, "line_2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone: if(is_nil(Map.get(map, "phone")), do: nil, else: Map.get(map, "phone")),
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
      "line_1" => if(is_nil(value.line_1), do: nil, else: Inttegro.Codec.encode(value.line_1)),
      "line_2" => if(is_nil(value.line_2), do: nil, else: Inttegro.Codec.encode(value.line_2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone" => if(is_nil(value.phone), do: nil, else: Inttegro.Codec.encode(value.phone)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region)),
      "country" => Inttegro.Codec.encode(value.country)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.OwnerUpdateInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct name: nil, address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          address: Inttegro.FinancialAccounts.OwnerUpdateInputAddress.t() | nil
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
            Inttegro.FinancialAccounts.OwnerUpdateInputAddress.from_map(Map.get(map, "address"))
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

defmodule Inttegro.FinancialAccounts.OwnerUpdateInputAddress do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct city: nil,
            country: nil,
            line_1: nil,
            line_2: nil,
            name: nil,
            phone: nil,
            post_code: nil,
            region: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t() | nil,
          line_1: String.t() | nil,
          line_2: String.t() | nil,
          name: String.t() | nil,
          phone: String.t() | nil,
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
      line_1: if(is_nil(Map.get(map, "line_1")), do: nil, else: Map.get(map, "line_1")),
      line_2: if(is_nil(Map.get(map, "line_2")), do: nil, else: Map.get(map, "line_2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone: if(is_nil(Map.get(map, "phone")), do: nil, else: Map.get(map, "phone")),
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
      "line_1" => if(is_nil(value.line_1), do: nil, else: Inttegro.Codec.encode(value.line_1)),
      "line_2" => if(is_nil(value.line_2), do: nil, else: Inttegro.Codec.encode(value.line_2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone" => if(is_nil(value.phone), do: nil, else: Inttegro.Codec.encode(value.phone)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:accounts, :number, :size]
  defstruct accounts: nil, number: nil, size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          accounts: [Inttegro.FinancialAccounts.FinancialAccount.t()],
          number: integer(),
          size: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      accounts:
        Enum.map(Map.fetch!(map, "accounts"), fn item ->
          Inttegro.FinancialAccounts.FinancialAccount.from_map(item)
        end),
      number: Map.fetch!(map, "number"),
      size: Map.fetch!(map, "size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "accounts" => Enum.map(value.accounts, fn item -> Inttegro.Codec.encode(item) end),
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:page_number]
  defstruct page_size: nil, page_number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          page_size: integer() | nil,
          page_number: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      page_size: if(is_nil(Map.get(map, "page_size")), do: nil, else: Map.get(map, "page_size")),
      page_number: Map.fetch!(map, "page_number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "page_size" =>
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size)),
      "page_number" => Inttegro.Codec.encode(value.page_number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.PullConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:enabled_at, :mandate]
  defstruct enabled_at: nil, mandate: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          enabled_at: DateTime.t(),
          mandate: Inttegro.FinancialAccounts.PullConfigurationMandate.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "enabled_at")),
      mandate:
        Inttegro.FinancialAccounts.PullConfigurationMandate.from_map(Map.fetch!(map, "mandate"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled_at" => Inttegro.Codec.encode(value.enabled_at),
      "mandate" => Inttegro.Codec.encode(value.mandate)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.PullConfigurationMandate do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:created_at, :id, :ip_address, :user_agent]
  defstruct created_at: nil, id: nil, ip_address: nil, user_agent: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          id: String.t(),
          ip_address: String.t(),
          user_agent: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      id: Map.fetch!(map, "id"),
      ip_address: Map.fetch!(map, "ip_address"),
      user_agent: Map.fetch!(map, "user_agent")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "id" => Inttegro.Codec.encode(value.id),
      "ip_address" => Inttegro.Codec.encode(value.ip_address),
      "user_agent" => Inttegro.Codec.encode(value.user_agent)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.PushConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:enabled_at]
  defstruct enabled_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          enabled_at: DateTime.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "enabled_at"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled_at" => Inttegro.Codec.encode(value.enabled_at)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.UpdateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:account_id]
  defstruct custom_data: nil,
            description: nil,
            label: nil,
            owner: nil,
            reference: nil,
            account_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: Inttegro.CustomDataInput.t() | nil,
          description: String.t() | nil,
          label: String.t() | nil,
          owner: Inttegro.FinancialAccounts.OwnerUpdateInput.t() | nil,
          reference: String.t() | nil,
          account_id: String.t()
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
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.FinancialAccounts.OwnerUpdateInput.from_map(Map.get(map, "owner"))
        ),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      account_id: Map.fetch!(map, "account_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "account_id" => Inttegro.Codec.encode(value.account_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.Wallet do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :type]
  defstruct id: nil, type: nil, mobile_money: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          type: Inttegro.Wallets.Type.t(),
          mobile_money: Inttegro.FinancialAccounts.WalletMobileMoney.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      type: Inttegro.Wallets.Type.decode(Map.fetch!(map, "type")),
      mobile_money:
        if(is_nil(Map.get(map, "mobile_money")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.WalletMobileMoney.from_map(Map.get(map, "mobile_money"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "type" => Inttegro.Wallets.Type.encode(value.type),
      "mobile_money" =>
        if(is_nil(value.mobile_money), do: nil, else: Inttegro.Codec.encode(value.mobile_money))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.WalletMobileMoney do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:account_number, :network]
  defstruct account_number: nil, network: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
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

defmodule Inttegro.FinancialAccounts.WalletRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:currency, :label, :owner, :reference, :type, :wallet]
  defstruct custom_data: nil,
            description: nil,
            pull_configuration: nil,
            push_configuration: nil,
            currency: nil,
            label: nil,
            owner: nil,
            reference: nil,
            type: nil,
            wallet: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: Inttegro.CustomDataInput.t() | nil,
          description: String.t() | nil,
          pull_configuration: Inttegro.FinancialAccounts.WalletRequestPullConfiguration.t() | nil,
          push_configuration: Inttegro.FinancialAccounts.WalletRequestPushConfiguration.t() | nil,
          currency: String.t(),
          label: String.t(),
          owner: Inttegro.FinancialAccounts.OwnerInput.t(),
          reference: String.t(),
          type: Inttegro.FinancialAccounts.Type.t(),
          wallet: Inttegro.FinancialAccounts.WalletRequestWallet.t()
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
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      pull_configuration:
        if(is_nil(Map.get(map, "pull_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.WalletRequestPullConfiguration.from_map(
              Map.get(map, "pull_configuration")
            )
        ),
      push_configuration:
        if(is_nil(Map.get(map, "push_configuration")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.WalletRequestPushConfiguration.from_map(
              Map.get(map, "push_configuration")
            )
        ),
      currency: Map.fetch!(map, "currency"),
      label: Map.fetch!(map, "label"),
      owner: Inttegro.FinancialAccounts.OwnerInput.from_map(Map.fetch!(map, "owner")),
      reference: Map.fetch!(map, "reference"),
      type: Inttegro.FinancialAccounts.Type.decode(Map.fetch!(map, "type")),
      wallet: Inttegro.FinancialAccounts.WalletRequestWallet.from_map(Map.fetch!(map, "wallet"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "pull_configuration" =>
        if(is_nil(value.pull_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.pull_configuration)
        ),
      "push_configuration" =>
        if(is_nil(value.push_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.push_configuration)
        ),
      "currency" => Inttegro.Codec.encode(value.currency),
      "label" => Inttegro.Codec.encode(value.label),
      "owner" => Inttegro.Codec.encode(value.owner),
      "reference" => Inttegro.Codec.encode(value.reference),
      "type" => Inttegro.FinancialAccounts.Type.encode(value.type),
      "wallet" => Inttegro.Codec.encode(value.wallet)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.WalletRequestPullConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct enabled: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          enabled: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled: if(is_nil(Map.get(map, "enabled")), do: nil, else: Map.get(map, "enabled"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled" => if(is_nil(value.enabled), do: nil, else: Inttegro.Codec.encode(value.enabled))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.WalletRequestPushConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct enabled: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          enabled: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enabled: if(is_nil(Map.get(map, "enabled")), do: nil, else: Map.get(map, "enabled"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enabled" => if(is_nil(value.enabled), do: nil, else: Inttegro.Codec.encode(value.enabled))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.WalletRequestWallet do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type, :mobile_money]
  defstruct type: nil, mobile_money: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.Wallets.Type.t(),
          mobile_money: Inttegro.FinancialAccounts.WalletRequestWalletMobileMoney.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Wallets.Type.decode(Map.fetch!(map, "type")),
      mobile_money:
        Inttegro.FinancialAccounts.WalletRequestWalletMobileMoney.from_map(
          Map.fetch!(map, "mobile_money")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Wallets.Type.encode(value.type),
      "mobile_money" => Inttegro.Codec.encode(value.mobile_money)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.WalletRequestWalletMobileMoney do
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

defmodule Inttegro.FinancialAccounts.FinancialInstitution do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:country, :id, :name, :type]
  defstruct bank: nil, country: nil, id: nil, mobile_money_provider: nil, name: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          bank: Inttegro.FinancialAccounts.FinancialInstitutionBank.t() | nil,
          country: String.t(),
          id: String.t(),
          mobile_money_provider:
            Inttegro.FinancialAccounts.FinancialInstitutionMobileMoneyProvider.t() | nil,
          name: String.t(),
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      bank:
        if(is_nil(Map.get(map, "bank")),
          do: nil,
          else: Inttegro.FinancialAccounts.FinancialInstitutionBank.from_map(Map.get(map, "bank"))
        ),
      country: Map.fetch!(map, "country"),
      id: Map.fetch!(map, "id"),
      mobile_money_provider:
        if(is_nil(Map.get(map, "mobile_money_provider")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.FinancialInstitutionMobileMoneyProvider.from_map(
              Map.get(map, "mobile_money_provider")
            )
        ),
      name: Map.fetch!(map, "name"),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bank" => if(is_nil(value.bank), do: nil, else: Inttegro.Codec.encode(value.bank)),
      "country" => Inttegro.Codec.encode(value.country),
      "id" => Inttegro.Codec.encode(value.id),
      "mobile_money_provider" =>
        if(is_nil(value.mobile_money_provider),
          do: nil,
          else: Inttegro.Codec.encode(value.mobile_money_provider)
        ),
      "name" => Inttegro.Codec.encode(value.name),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.FinancialInstitutionBank do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:bank_account_type, :code_scheme]
  defstruct bank_account_type: nil,
            branch: nil,
            code_scheme: nil,
            sort_code_prefix: nil,
            swift_code: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          bank_account_type: String.t(),
          branch: Inttegro.FinancialAccounts.FinancialInstitutionBankBranch.t() | nil,
          code_scheme: String.t(),
          sort_code_prefix: String.t() | nil,
          swift_code: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      bank_account_type: Map.fetch!(map, "bank_account_type"),
      branch:
        if(is_nil(Map.get(map, "branch")),
          do: nil,
          else:
            Inttegro.FinancialAccounts.FinancialInstitutionBankBranch.from_map(
              Map.get(map, "branch")
            )
        ),
      code_scheme: Map.fetch!(map, "code_scheme"),
      sort_code_prefix:
        if(is_nil(Map.get(map, "sort_code_prefix")),
          do: nil,
          else: Map.get(map, "sort_code_prefix")
        ),
      swift_code:
        if(is_nil(Map.get(map, "swift_code")), do: nil, else: Map.get(map, "swift_code"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bank_account_type" => Inttegro.Codec.encode(value.bank_account_type),
      "branch" => if(is_nil(value.branch), do: nil, else: Inttegro.Codec.encode(value.branch)),
      "code_scheme" => Inttegro.Codec.encode(value.code_scheme),
      "sort_code_prefix" =>
        if(is_nil(value.sort_code_prefix),
          do: nil,
          else: Inttegro.Codec.encode(value.sort_code_prefix)
        ),
      "swift_code" =>
        if(is_nil(value.swift_code), do: nil, else: Inttegro.Codec.encode(value.swift_code))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.FinancialInstitutionBankBranch do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :name, :sort_code]
  defstruct id: nil, name: nil, sort_code: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          sort_code: String.t()
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
      sort_code: Map.fetch!(map, "sort_code")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "name" => Inttegro.Codec.encode(value.name),
      "sort_code" => Inttegro.Codec.encode(value.sort_code)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.FinancialAccounts.FinancialInstitutionMobileMoneyProvider do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:provider]
  defstruct provider: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          provider: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      provider: Map.fetch!(map, "provider")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "provider" => Inttegro.Codec.encode(value.provider)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
