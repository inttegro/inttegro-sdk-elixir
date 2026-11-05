defmodule Inttegro.ChildrenPolicies.BTAgingSpec do
  @moduledoc "One platform-owned balance-transaction aging option allowed by a children policy."
  @enforce_keys [:public_id, :t_plus]
  defstruct [:public_id, :t_plus]
  @type t :: %__MODULE__{public_id: String.t(), t_plus: String.t()}
  def from_map(map),
    do: %__MODULE__{public_id: Map.fetch!(map, "public_id"), t_plus: Map.fetch!(map, "t_plus")}
end

defmodule Inttegro.ChildrenPolicies.PaymentMethodCapabilities do
  @moduledoc "Allowed enablement and confirmation choices for one child application payment method."
  @enforce_keys [:enabled, :confirms_use]
  defstruct [:enabled, :confirms_use]
  @type t :: %__MODULE__{enabled: [boolean()], confirms_use: [boolean()]}
  def from_map(map),
    do: %__MODULE__{
      enabled: Map.fetch!(map, "enabled"),
      confirms_use: Map.fetch!(map, "confirms_use")
    }
end

defmodule Inttegro.ChildrenPolicies.PaymentMethodsCapabilities do
  @moduledoc "Allowed settings for each payment method that child application policies may select."
  defstruct [:mobile_money, :bank_account, :motito, :card]
  @type t :: %__MODULE__{}
  def from_map(map),
    do: %__MODULE__{
      mobile_money: decode(Map.get(map, "mobile_money")),
      bank_account: decode(Map.get(map, "bank_account")),
      motito: decode(Map.get(map, "motito")),
      card: decode(Map.get(map, "card"))
    }

  defp decode(nil), do: nil
  defp decode(value), do: Inttegro.ChildrenPolicies.PaymentMethodCapabilities.from_map(value)
end

defmodule Inttegro.ChildrenPolicies.PaymentsCapabilities do
  @moduledoc "Payment currencies and amount bounds that child application policies must remain within."
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

  defp decode(nil), do: nil
  defp decode(value), do: Inttegro.OperatingPolicies.Limits.from_map(value)
end

defmodule Inttegro.ChildrenPolicies.PayoutsCapabilities do
  @moduledoc "Payout enablement, amount bounds, and aging options available to child application policies."
  defstruct [:enabled, :limits, :bt_aging_spec]
  @type t :: %__MODULE__{}
  def from_map(map),
    do: %__MODULE__{
      enabled: Map.get(map, "enabled"),
      limits: decode_limits(Map.get(map, "limits")),
      bt_aging_spec: decode_specs(Map.get(map, "bt_aging_spec"))
    }

  defp decode_limits(nil), do: nil
  defp decode_limits(value), do: Inttegro.OperatingPolicies.Limits.from_map(value)
  defp decode_specs(nil), do: nil

  defp decode_specs(values),
    do: Enum.map(values, &Inttegro.ChildrenPolicies.BTAgingSpec.from_map/1)
end

defmodule Inttegro.ChildrenPolicies.Capabilities do
  @moduledoc "Complete payment, payout, and payment-method authority granted by a children policy."
  defstruct [:payments, :payouts, :payment_methods]
  @type t :: %__MODULE__{}
  def from_map(map),
    do: %__MODULE__{
      payments: decode(Map.get(map, "payments"), Inttegro.ChildrenPolicies.PaymentsCapabilities),
      payouts: decode(Map.get(map, "payouts"), Inttegro.ChildrenPolicies.PayoutsCapabilities),
      payment_methods:
        decode(
          Map.get(map, "payment_methods"),
          Inttegro.ChildrenPolicies.PaymentMethodsCapabilities
        )
    }

  defp decode(nil, _module), do: nil
  defp decode(value, module), do: module.from_map(value)
end

defmodule Inttegro.ChildrenPolicies.ChildrenPolicy do
  @moduledoc "Latest active version of the platform-assigned policy constraining an application's child accounts."
  @enforce_keys [
    :id,
    :version,
    :active_version,
    :name,
    :capabilities,
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
        Inttegro.ChildrenPolicies.Capabilities.from_map(Map.fetch!(map, "capabilities")),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      updated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "updated_at")),
      version_created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "version_created_at"))
    }
  end
end
