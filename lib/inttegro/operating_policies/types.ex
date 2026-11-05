defmodule Inttegro.OperatingPolicies.AmountRange do
  @moduledoc "Inclusive minimum and maximum amounts, expressed in minor currency units, for an operating policy."
  @enforce_keys [:min, :max]
  defstruct [:min, :max]
  @type t :: %__MODULE__{min: non_neg_integer(), max: pos_integer()}
  def new!(attrs), do: struct!(__MODULE__, attrs)
  def from_map(map), do: %__MODULE__{min: Map.fetch!(map, "min"), max: Map.fetch!(map, "max")}
  def to_map(value), do: %{"min" => value.min, "max" => value.max}
end

defmodule Inttegro.OperatingPolicies.Limits do
  @moduledoc "Typed amount limits selected by, or returned for, an application operating policy."
  @enforce_keys [:amount]
  defstruct [:amount]
  @type t :: %__MODULE__{amount: Inttegro.OperatingPolicies.AmountRange.t()}
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def from_map(map),
    do: %__MODULE__{
      amount: Inttegro.OperatingPolicies.AmountRange.from_map(Map.fetch!(map, "amount"))
    }

  def to_map(value), do: %{"amount" => Inttegro.Codec.encode(value.amount)}
end

defmodule Inttegro.OperatingPolicies.BTAgingSpecReference do
  @moduledoc "Public identifier supplied when selecting the platform-owned balance-transaction aging specification."
  @enforce_keys [:id]
  defstruct [:id]
  @type t :: %__MODULE__{id: String.t()}
  def new!(attrs), do: struct!(__MODULE__, attrs)
  def from_map(map), do: %__MODULE__{id: Map.fetch!(map, "id")}
  def to_map(value), do: %{"id" => value.id}
end

defmodule Inttegro.OperatingPolicies.BTAgingSpec do
  @moduledoc "Resolved balance-transaction aging specification returned by the platform for an operating policy."
  @enforce_keys [:public_id, :t_plus]
  defstruct [:public_id, :t_plus]
  @type t :: %__MODULE__{public_id: String.t(), t_plus: String.t()}
  def from_map(map),
    do: %__MODULE__{public_id: Map.fetch!(map, "public_id"), t_plus: Map.fetch!(map, "t_plus")}

  def to_map(value), do: %{"public_id" => value.public_id, "t_plus" => value.t_plus}
end

defmodule Inttegro.OperatingPolicies.PaymentsCapabilitiesInput do
  @moduledoc "Payment currencies and limits selected for a named or inline operating policy request."
  defstruct [:currencies, :limits]

  @type t :: %__MODULE__{
          currencies: [String.t()] | nil,
          limits: Inttegro.OperatingPolicies.Limits.t() | nil
        }
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  def from_map(map),
    do: %__MODULE__{
      currencies: Map.get(map, "currencies"),
      limits: decode(Map.get(map, "limits"))
    }

  def to_map(value),
    do: compact(%{"currencies" => value.currencies, "limits" => encode(value.limits)})

  defp decode(nil), do: nil
  defp decode(value), do: Inttegro.OperatingPolicies.Limits.from_map(value)
  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
  defp compact(map), do: Map.reject(map, fn {_key, value} -> is_nil(value) end)
end

defmodule Inttegro.OperatingPolicies.PayoutsCapabilitiesInput do
  @moduledoc "Payout enablement, amount limits, and aging-spec selection accepted in operating policy requests."
  defstruct [:enabled, :limits, :bt_aging_spec]

  @type t :: %__MODULE__{
          enabled: boolean() | nil,
          limits: Inttegro.OperatingPolicies.Limits.t() | nil,
          bt_aging_spec: Inttegro.OperatingPolicies.BTAgingSpecReference.t() | nil
        }
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  def to_map(value) do
    %{
      "enabled" => value.enabled,
      "limits" => encode(value.limits),
      "bt_aging_spec" => encode(value.bt_aging_spec)
    }
    |> Map.reject(fn {_key, item} -> is_nil(item) end)
  end

  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end

defmodule Inttegro.OperatingPolicies.PaymentMethodCapabilities do
  @moduledoc "Concrete enablement and confirmation behavior for one payment method in an operating policy."
  @enforce_keys [:enabled, :confirms_use]
  defstruct [:enabled, :confirms_use]
  @type t :: %__MODULE__{enabled: boolean(), confirms_use: boolean()}
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def from_map(map),
    do: %__MODULE__{
      enabled: Map.fetch!(map, "enabled"),
      confirms_use: Map.fetch!(map, "confirms_use")
    }

  def to_map(value), do: %{"enabled" => value.enabled, "confirms_use" => value.confirms_use}
end

defmodule Inttegro.OperatingPolicies.PaymentMethodsCapabilities do
  @moduledoc "Per-method operating settings for mobile money, bank account, Motito, and card payment methods."
  defstruct [:mobile_money, :bank_account, :motito, :card]

  @type t :: %__MODULE__{
          mobile_money: Inttegro.OperatingPolicies.PaymentMethodCapabilities.t() | nil,
          bank_account: Inttegro.OperatingPolicies.PaymentMethodCapabilities.t() | nil,
          motito: Inttegro.OperatingPolicies.PaymentMethodCapabilities.t() | nil,
          card: Inttegro.OperatingPolicies.PaymentMethodCapabilities.t() | nil
        }
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  def from_map(map) do
    %__MODULE__{
      mobile_money: decode(Map.get(map, "mobile_money")),
      bank_account: decode(Map.get(map, "bank_account")),
      motito: decode(Map.get(map, "motito")),
      card: decode(Map.get(map, "card"))
    }
  end

  def to_map(value) do
    %{
      "mobile_money" => encode(value.mobile_money),
      "bank_account" => encode(value.bank_account),
      "motito" => encode(value.motito),
      "card" => encode(value.card)
    }
    |> Map.reject(fn {_key, item} -> is_nil(item) end)
  end

  defp decode(nil), do: nil
  defp decode(value), do: Inttegro.OperatingPolicies.PaymentMethodCapabilities.from_map(value)
  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end

defmodule Inttegro.OperatingPolicies.CapabilitiesInput do
  @moduledoc "Concrete payment, payout, and payment-method settings accepted by operating policy requests."
  defstruct [:payments, :payouts, :payment_methods]

  @type t :: %__MODULE__{
          payments: Inttegro.OperatingPolicies.PaymentsCapabilitiesInput.t() | nil,
          payouts: Inttegro.OperatingPolicies.PayoutsCapabilitiesInput.t() | nil,
          payment_methods: Inttegro.OperatingPolicies.PaymentMethodsCapabilities.t() | nil
        }
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  def to_map(value) do
    %{
      "payments" => encode(value.payments),
      "payouts" => encode(value.payouts),
      "payment_methods" => encode(value.payment_methods)
    }
    |> Map.reject(fn {_key, item} -> is_nil(item) end)
  end

  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end

defmodule Inttegro.OperatingPolicies.PaymentsCapabilities do
  @moduledoc "Resolved payment currencies and limits returned in an operating policy capability snapshot."
  defstruct [:currencies, :limits]

  @type t :: %__MODULE__{
          currencies: [String.t()] | nil,
          limits: Inttegro.OperatingPolicies.Limits.t() | nil
        }
  def from_map(map),
    do: %__MODULE__{
      currencies: Map.get(map, "currencies"),
      limits: decode(Map.get(map, "limits"))
    }

  def to_map(value),
    do:
      Map.reject(%{"currencies" => value.currencies, "limits" => encode(value.limits)}, fn {_key,
                                                                                            item} ->
        is_nil(item)
      end)

  defp decode(nil), do: nil
  defp decode(value), do: Inttegro.OperatingPolicies.Limits.from_map(value)
  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end

defmodule Inttegro.OperatingPolicies.PayoutsCapabilities do
  @moduledoc "Resolved payout enablement, limits, and aging specification returned for an operating policy."
  defstruct [:enabled, :limits, :bt_aging_spec]

  @type t :: %__MODULE__{
          enabled: boolean() | nil,
          limits: Inttegro.OperatingPolicies.Limits.t() | nil,
          bt_aging_spec: Inttegro.OperatingPolicies.BTAgingSpec.t() | nil
        }
  def from_map(map),
    do: %__MODULE__{
      enabled: Map.get(map, "enabled"),
      limits: decode_limits(Map.get(map, "limits")),
      bt_aging_spec: decode_spec(Map.get(map, "bt_aging_spec"))
    }

  def to_map(value),
    do:
      Map.reject(
        %{
          "enabled" => value.enabled,
          "limits" => encode(value.limits),
          "bt_aging_spec" => encode(value.bt_aging_spec)
        },
        fn {_key, item} -> is_nil(item) end
      )

  defp decode_limits(nil), do: nil
  defp decode_limits(value), do: Inttegro.OperatingPolicies.Limits.from_map(value)
  defp decode_spec(nil), do: nil
  defp decode_spec(value), do: Inttegro.OperatingPolicies.BTAgingSpec.from_map(value)
  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end

defmodule Inttegro.OperatingPolicies.Capabilities do
  @moduledoc "Resolved payment, payout, and payment-method capabilities recorded in an operating policy."
  defstruct [:payments, :payouts, :payment_methods]

  @type t :: %__MODULE__{
          payments: Inttegro.OperatingPolicies.PaymentsCapabilities.t() | nil,
          payouts: Inttegro.OperatingPolicies.PayoutsCapabilities.t() | nil,
          payment_methods: Inttegro.OperatingPolicies.PaymentMethodsCapabilities.t() | nil
        }
  def from_map(map) do
    %__MODULE__{
      payments: decode(Map.get(map, "payments"), Inttegro.OperatingPolicies.PaymentsCapabilities),
      payouts: decode(Map.get(map, "payouts"), Inttegro.OperatingPolicies.PayoutsCapabilities),
      payment_methods:
        decode(
          Map.get(map, "payment_methods"),
          Inttegro.OperatingPolicies.PaymentMethodsCapabilities
        )
    }
  end

  def to_map(value),
    do:
      Map.reject(
        %{
          "payments" => encode(value.payments),
          "payouts" => encode(value.payouts),
          "payment_methods" => encode(value.payment_methods)
        },
        fn {_key, item} -> is_nil(item) end
      )

  defp decode(nil, _module), do: nil
  defp decode(value, module), do: module.from_map(value)
  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end

defmodule Inttegro.OperatingPolicies.Source do
  @moduledoc "Identifies whether an application's policy snapshot came from inline settings or a named template."
  @enforce_keys [:type]
  defstruct [:type, :id, :version]

  @type t :: %__MODULE__{
          type: :inline | :template | String.t(),
          id: String.t() | nil,
          version: pos_integer() | nil
        }
  def from_map(map),
    do: %__MODULE__{
      type: decode_type(Map.fetch!(map, "type")),
      id: Map.get(map, "id"),
      version: Map.get(map, "version")
    }

  def to_map(value),
    do:
      Map.reject(
        %{"type" => to_string(value.type), "id" => value.id, "version" => value.version},
        fn {_key, item} -> is_nil(item) end
      )

  defp decode_type("inline"), do: :inline
  defp decode_type("template"), do: :template
  defp decode_type(value), do: value
end

defmodule Inttegro.OperatingPolicies.ApplicationPolicy do
  @moduledoc "Immutable operating-policy snapshot and source returned on gated application lookup responses."
  @enforce_keys [:capabilities, :source]
  defstruct [:capabilities, :source]

  @type t :: %__MODULE__{
          capabilities: Inttegro.OperatingPolicies.Capabilities.t(),
          source: Inttegro.OperatingPolicies.Source.t()
        }
  def from_map(map),
    do: %__MODULE__{
      capabilities:
        Inttegro.OperatingPolicies.Capabilities.from_map(Map.fetch!(map, "capabilities")),
      source: Inttegro.OperatingPolicies.Source.from_map(Map.fetch!(map, "source"))
    }

  def to_map(value),
    do: %{
      "capabilities" => Inttegro.Codec.encode(value.capabilities),
      "source" => Inttegro.Codec.encode(value.source)
    }
end

defmodule Inttegro.OperatingPolicies.OperatingPolicy do
  @moduledoc "Versioned reusable operating policy owned by an application and constrained by its children policy."
  @enforce_keys [
    :id,
    :version,
    :active_version,
    :name,
    :capabilities,
    :children_policy_id,
    :children_policy_version,
    :created_at,
    :updated_at,
    :version_created_at
  ]
  defstruct [
    :id,
    :version,
    :active_version,
    :name,
    :description,
    :capabilities,
    :children_policy_id,
    :children_policy_version,
    :created_at,
    :updated_at,
    :version_created_at
  ]

  @type t :: %__MODULE__{}
  def from_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      version: Map.fetch!(map, "version"),
      active_version: Map.fetch!(map, "active_version"),
      name: Map.fetch!(map, "name"),
      description: Map.get(map, "description"),
      capabilities:
        Inttegro.OperatingPolicies.Capabilities.from_map(Map.fetch!(map, "capabilities")),
      children_policy_id: Map.fetch!(map, "children_policy_id"),
      children_policy_version: Map.fetch!(map, "children_policy_version"),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      updated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "updated_at")),
      version_created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "version_created_at"))
    }
  end
end

defmodule Inttegro.OperatingPolicies.SelectionByID do
  @moduledoc "Selects a reusable parent-owned operating policy by its public `op_` identifier."
  @enforce_keys [:id]
  defstruct [:id]
  @type t :: %__MODULE__{id: String.t()}
  def new!(attrs), do: struct!(__MODULE__, attrs)
  def from_map(map), do: %__MODULE__{id: Map.fetch!(map, "id")}
  def to_map(value), do: %{"id" => value.id}
end

defmodule Inttegro.OperatingPolicies.InlineSelection do
  @moduledoc "Supplies concrete operating capabilities inline while creating or updating a child application."
  @enforce_keys [:capabilities]
  defstruct [:capabilities]
  @type t :: %__MODULE__{capabilities: Inttegro.OperatingPolicies.CapabilitiesInput.t()}
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def from_map(map),
    do: %__MODULE__{
      capabilities:
        struct!(
          Inttegro.OperatingPolicies.CapabilitiesInput,
          atomize(Map.fetch!(map, "capabilities"))
        )
    }

  def to_map(value), do: %{"capabilities" => Inttegro.Codec.encode(value.capabilities)}

  defp atomize(map),
    do: Map.new(map, fn {key, value} -> {String.to_existing_atom(key), value} end)
end

defmodule Inttegro.OperatingPolicies.CreateRequest do
  @moduledoc "Name, optional description, and concrete capabilities used to create an operating policy."
  @enforce_keys [:name, :capabilities]
  defstruct [:name, :description, :capabilities]

  @type t :: %__MODULE__{
          name: String.t(),
          description: String.t() | nil,
          capabilities: Inttegro.OperatingPolicies.CapabilitiesInput.t()
        }
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def to_map(value),
    do:
      Map.reject(
        %{
          "name" => value.name,
          "description" => value.description,
          "capabilities" => Inttegro.Codec.encode(value.capabilities)
        },
        fn {_key, item} -> is_nil(item) end
      )
end

defmodule Inttegro.OperatingPolicies.LookupRequest do
  @moduledoc "Public operating-policy identifier used to retrieve its latest active version from the Inttegro API."
  @enforce_keys [:operating_policy_id]
  defstruct [:operating_policy_id]
  @type t :: %__MODULE__{operating_policy_id: String.t()}
  def new!(attrs), do: struct!(__MODULE__, attrs)
  def to_map(value), do: %{"operating_policy_id" => value.operating_policy_id}
end

defmodule Inttegro.OperatingPolicies.UpdateRequest do
  @moduledoc "Expected active version and changed fields used to create the next operating-policy version."
  @enforce_keys [:operating_policy_id, :expected_version]
  defstruct [:operating_policy_id, :expected_version, :name, :description, :capabilities]
  @type t :: %__MODULE__{}
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def to_map(value) do
    %{
      "operating_policy_id" => value.operating_policy_id,
      "expected_version" => value.expected_version,
      "name" => value.name,
      "description" => value.description,
      "capabilities" => encode(value.capabilities)
    }
    |> Map.reject(fn {_key, item} -> is_nil(item) end)
  end

  defp encode(nil), do: nil
  defp encode(value), do: Inttegro.Codec.encode(value)
end
