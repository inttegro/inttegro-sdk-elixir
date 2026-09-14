# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Refunds.Reason do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :requested_by_customer
          | :duplicate
          | :fraudulent
          | :order_canceled
          | :item_returned
          | :item_damaged
          | :item_not_received
          | :item_not_as_described
          | :custom
          | String.t()
  @values %{
    requested_by_customer: "requested_by_customer",
    duplicate: "duplicate",
    fraudulent: "fraudulent",
    order_canceled: "order_canceled",
    item_returned: "item_returned",
    item_damaged: "item_damaged",
    item_not_received: "item_not_received",
    item_not_as_described: "item_not_as_described",
    custom: "custom"
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

defmodule Inttegro.Refunds.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :canceled | :failed | :pending | :processing | :succeeded | String.t()
  @values %{
    canceled: "canceled",
    failed: "failed",
    pending: "pending",
    processing: "processing",
    succeeded: "succeeded"
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

defmodule Inttegro.Refunds.ReasonInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t :: Inttegro.Refunds.Reason.t()
  @doc false
  @spec decode(term()) :: t()
  def decode(value), do: value
end

defmodule Inttegro.Refunds.ReasonValue do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t :: Inttegro.Refunds.Reason.t()
  @doc false
  @spec decode(term()) :: t()
  def decode(value), do: value
end

defmodule Inttegro.Refunds.CancelRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:refund_id]
  defstruct request_meta: nil, refund_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          request_meta: Inttegro.Refunds.RequestMetaInput.t() | nil,
          refund_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      request_meta:
        if(is_nil(Map.get(map, "request_meta")),
          do: nil,
          else: Inttegro.Refunds.RequestMetaInput.from_map(Map.get(map, "request_meta"))
        ),
      refund_id: Map.fetch!(map, "refund_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "refund_id" => Inttegro.Codec.encode(value.refund_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.CreateLineItemInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_line_item_id, :refund_amount]
  defstruct reason: nil, reason_details: nil, order_line_item_id: nil, refund_amount: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          reason: Inttegro.Refunds.Reason.t() | nil,
          reason_details: String.t() | nil,
          order_line_item_id: String.t(),
          refund_amount: Inttegro.Money.AmountParams.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      reason:
        if(is_nil(Map.get(map, "reason")),
          do: nil,
          else: Inttegro.Refunds.Reason.decode(Map.get(map, "reason"))
        ),
      reason_details:
        if(is_nil(Map.get(map, "reason_details")), do: nil, else: Map.get(map, "reason_details")),
      order_line_item_id: Map.fetch!(map, "order_line_item_id"),
      refund_amount: Inttegro.Money.AmountParams.from_map(Map.fetch!(map, "refund_amount"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "reason" =>
        if(is_nil(value.reason),
          do: nil,
          else: Inttegro.Refunds.Reason.encode(value.reason)
        ),
      "reason_details" =>
        if(is_nil(value.reason_details),
          do: nil,
          else: Inttegro.Codec.encode(value.reason_details)
        ),
      "order_line_item_id" => Inttegro.Codec.encode(value.order_line_item_id),
      "refund_amount" => Inttegro.Codec.encode(value.refund_amount)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:line_items, :order_id, :reason]
  defstruct custom_data: nil,
            reason_details: nil,
            reference: nil,
            request_meta: nil,
            line_items: nil,
            order_id: nil,
            reason: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          custom_data: %{optional(String.t()) => String.t()} | nil,
          reason_details: String.t() | nil,
          reference: String.t() | nil,
          request_meta: Inttegro.Refunds.RequestMetaInput.t() | nil,
          line_items: [Inttegro.Refunds.CreateLineItemInput.t()],
          order_id: String.t(),
          reason: Inttegro.Refunds.Reason.t()
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
          else: Map.new(Map.get(map, "custom_data"), fn {key, value} -> {key, value} end)
        ),
      reason_details:
        if(is_nil(Map.get(map, "reason_details")), do: nil, else: Map.get(map, "reason_details")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      request_meta:
        if(is_nil(Map.get(map, "request_meta")),
          do: nil,
          else: Inttegro.Refunds.RequestMetaInput.from_map(Map.get(map, "request_meta"))
        ),
      line_items:
        Enum.map(Map.fetch!(map, "line_items"), fn item ->
          Inttegro.Refunds.CreateLineItemInput.from_map(item)
        end),
      order_id: Map.fetch!(map, "order_id"),
      reason: Inttegro.Refunds.Reason.decode(Map.fetch!(map, "reason"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "custom_data" =>
        if(is_nil(value.custom_data),
          do: nil,
          else:
            Map.new(value.custom_data, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "reason_details" =>
        if(is_nil(value.reason_details),
          do: nil,
          else: Inttegro.Codec.encode(value.reason_details)
        ),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "line_items" => Enum.map(value.line_items, fn item -> Inttegro.Codec.encode(item) end),
      "order_id" => Inttegro.Codec.encode(value.order_id),
      "reason" => Inttegro.Refunds.Reason.encode(value.reason)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:refund_id]
  defstruct refund_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          refund_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      refund_id: Map.fetch!(map, "refund_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "refund_id" => Inttegro.Codec.encode(value.refund_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.PageRequest do
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

defmodule Inttegro.Refunds.OfflineSettlement do
  @moduledoc """
  Immutable refund settlement for an order paid outside Inttegro, with no payment method attached.
  """
  @enforce_keys [:type]
  defstruct type: nil
  @type t :: %__MODULE__{type: :offline}

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "offline"} = map) when map_size(map) == 1,
    do: %__MODULE__{type: :offline}

  @spec to_map(t()) :: map()
  def to_map(%__MODULE__{}), do: %{"type" => "offline"}
end

defmodule Inttegro.Refunds.SettlementMobileMoney do
  @moduledoc """
  Masked mobile-money recognition details captured for refund history without raw credentials.
  """
  @enforce_keys [:account_number, :last4, :network]
  defstruct account_number: nil, last4: nil, network: nil

  @type t :: %__MODULE__{
          account_number: String.t(),
          last4: String.t(),
          network: :airtel | :mtn | :telecel | :vodafone
        }

  @spec from_map(map()) :: t()
  def from_map(map) when map_size(map) == 3 do
    %__MODULE__{
      account_number: Map.fetch!(map, "account_number"),
      last4: Map.fetch!(map, "last4"),
      network: decode_network(Map.fetch!(map, "network"))
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "account_number" => value.account_number,
      "last4" => value.last4,
      "network" => Atom.to_string(value.network)
    }
  end

  defp decode_network("airtel"), do: :airtel
  defp decode_network("mtn"), do: :mtn
  defp decode_network("telecel"), do: :telecel
  defp decode_network("vodafone"), do: :vodafone
end

defmodule Inttegro.Refunds.SettlementMobileMoneyPaymentMethod do
  @moduledoc """
  Caller-safe snapshot of the original mobile-money method used to settle an order refund.
  """
  @enforce_keys [:id, :mobile_money, :type]
  defstruct id: nil, mobile_money: nil, type: nil

  @type t :: %__MODULE__{
          id: String.t(),
          mobile_money: Inttegro.Refunds.SettlementMobileMoney.t(),
          type: :mobile_money
        }

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "mobile_money"} = map) when map_size(map) == 3 do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      mobile_money:
        Inttegro.Refunds.SettlementMobileMoney.from_map(Map.fetch!(map, "mobile_money")),
      type: :mobile_money
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => value.id,
      "mobile_money" => Inttegro.Refunds.SettlementMobileMoney.to_map(value.mobile_money),
      "type" => "mobile_money"
    }
  end
end

defmodule Inttegro.Refunds.SettlementGhanaBankAccount do
  @moduledoc """
  Masked Ghana bank-account recognition details captured for safe and immutable refund history.
  """
  @enforce_keys [:account_number, :last4]
  defstruct account_number: nil, last4: nil
  @type t :: %__MODULE__{account_number: String.t(), last4: String.t()}

  @spec from_map(map()) :: t()
  def from_map(map) when map_size(map) == 2 do
    %__MODULE__{
      account_number: Map.fetch!(map, "account_number"),
      last4: Map.fetch!(map, "last4")
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value), do: %{"account_number" => value.account_number, "last4" => value.last4}
end

defmodule Inttegro.Refunds.SettlementBankAccount do
  @moduledoc """
  Supported bank-account subtype together with caller-safe masked account recognition details.
  """
  @enforce_keys [:ghana_bank_account, :type]
  defstruct ghana_bank_account: nil, type: nil

  @type t :: %__MODULE__{
          ghana_bank_account: Inttegro.Refunds.SettlementGhanaBankAccount.t(),
          type: :ghana_bank_account
        }

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "ghana_bank_account"} = map) when map_size(map) == 2 do
    %__MODULE__{
      ghana_bank_account:
        Inttegro.Refunds.SettlementGhanaBankAccount.from_map(
          Map.fetch!(map, "ghana_bank_account")
        ),
      type: :ghana_bank_account
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "ghana_bank_account" =>
        Inttegro.Refunds.SettlementGhanaBankAccount.to_map(value.ghana_bank_account),
      "type" => "ghana_bank_account"
    }
  end
end

defmodule Inttegro.Refunds.SettlementBankAccountPaymentMethod do
  @moduledoc """
  Caller-safe snapshot of the original bank-account method used to settle an order refund.
  """
  @enforce_keys [:bank_account, :id, :type]
  defstruct bank_account: nil, id: nil, type: nil

  @type t :: %__MODULE__{
          bank_account: Inttegro.Refunds.SettlementBankAccount.t(),
          id: String.t(),
          type: :bank_account
        }

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "bank_account"} = map) when map_size(map) == 3 do
    %__MODULE__{
      bank_account:
        Inttegro.Refunds.SettlementBankAccount.from_map(Map.fetch!(map, "bank_account")),
      id: Map.fetch!(map, "id"),
      type: :bank_account
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bank_account" => Inttegro.Refunds.SettlementBankAccount.to_map(value.bank_account),
      "id" => value.id,
      "type" => "bank_account"
    }
  end
end

defmodule Inttegro.Refunds.SettlementPaymentMethod do
  @moduledoc """
  Discriminated caller-safe snapshot of the original payment method used for a refund destination.
  """
  @type t ::
          Inttegro.Refunds.SettlementMobileMoneyPaymentMethod.t()
          | Inttegro.Refunds.SettlementBankAccountPaymentMethod.t()

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "mobile_money"} = map),
    do: Inttegro.Refunds.SettlementMobileMoneyPaymentMethod.from_map(map)

  def from_map(%{"type" => "bank_account"} = map),
    do: Inttegro.Refunds.SettlementBankAccountPaymentMethod.from_map(map)

  @spec to_map(t()) :: map()
  def to_map(%Inttegro.Refunds.SettlementMobileMoneyPaymentMethod{} = value),
    do: Inttegro.Refunds.SettlementMobileMoneyPaymentMethod.to_map(value)

  def to_map(%Inttegro.Refunds.SettlementBankAccountPaymentMethod{} = value),
    do: Inttegro.Refunds.SettlementBankAccountPaymentMethod.to_map(value)
end

defmodule Inttegro.Refunds.PaymentMethodSettlement do
  @moduledoc """
  Immutable refund settlement returned to the original payment method used to pay for the order.
  """
  @enforce_keys [:payment_method, :type]
  defstruct payment_method: nil, type: nil

  @type t :: %__MODULE__{
          payment_method: Inttegro.Refunds.SettlementPaymentMethod.t(),
          type: :payment_method
        }

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "payment_method"} = map) when map_size(map) == 2 do
    %__MODULE__{
      payment_method:
        Inttegro.Refunds.SettlementPaymentMethod.from_map(Map.fetch!(map, "payment_method")),
      type: :payment_method
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method" => Inttegro.Refunds.SettlementPaymentMethod.to_map(value.payment_method),
      "type" => "payment_method"
    }
  end
end

defmodule Inttegro.Refunds.Settlement do
  @moduledoc """
  Immutable refund destination selected by the required offline or payment-method discriminator.
  """
  @type t ::
          Inttegro.Refunds.OfflineSettlement.t()
          | Inttegro.Refunds.PaymentMethodSettlement.t()

  @spec from_map(map()) :: t()
  def from_map(%{"type" => "offline"} = map),
    do: Inttegro.Refunds.OfflineSettlement.from_map(map)

  def from_map(%{"type" => "payment_method"} = map),
    do: Inttegro.Refunds.PaymentMethodSettlement.from_map(map)

  @spec to_map(t()) :: map()
  def to_map(%Inttegro.Refunds.OfflineSettlement{} = value),
    do: Inttegro.Refunds.OfflineSettlement.to_map(value)

  def to_map(%Inttegro.Refunds.PaymentMethodSettlement{} = value),
    do: Inttegro.Refunds.PaymentMethodSettlement.to_map(value)
end

defmodule Inttegro.Refunds.Refund do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:created_at, :id, :line_items, :order_id, :reason, :settlement, :status, :total]
  defstruct canceled_at: nil,
            created_at: nil,
            custom_data: nil,
            failed_at: nil,
            id: nil,
            line_items: nil,
            order_id: nil,
            processing_at: nil,
            reason: nil,
            reason_details: nil,
            reference: nil,
            settlement: nil,
            status: nil,
            succeeded_at: nil,
            total: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          canceled_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          custom_data: %{optional(String.t()) => String.t()} | nil,
          failed_at: DateTime.t() | nil,
          id: String.t(),
          line_items: [Inttegro.Refunds.LineItem.t()],
          order_id: String.t(),
          processing_at: DateTime.t() | nil,
          reason: Inttegro.Refunds.Reason.t(),
          reason_details: String.t() | nil,
          reference: String.t() | nil,
          settlement: Inttegro.Refunds.Settlement.t(),
          status: Inttegro.Refunds.Status.t(),
          succeeded_at: DateTime.t() | nil,
          total: Inttegro.Money.Amount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      canceled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))
        ),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Map.new(Map.get(map, "custom_data"), fn {key, value} -> {key, value} end)
        ),
      failed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))
        ),
      id: Map.fetch!(map, "id"),
      line_items:
        Enum.map(Map.fetch!(map, "line_items"), fn item ->
          Inttegro.Refunds.LineItem.from_map(item)
        end),
      order_id: Map.fetch!(map, "order_id"),
      processing_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "processing_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "processing_at"))
        ),
      reason: Inttegro.Refunds.Reason.decode(Map.fetch!(map, "reason")),
      reason_details:
        if(is_nil(Map.get(map, "reason_details")), do: nil, else: Map.get(map, "reason_details")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      settlement: Inttegro.Refunds.Settlement.from_map(Map.fetch!(map, "settlement")),
      status: Inttegro.Refunds.Status.decode(Map.fetch!(map, "status")),
      succeeded_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "succeeded_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "succeeded_at"))
        ),
      total: Inttegro.Money.Amount.from_map(Map.fetch!(map, "total"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "canceled_at" =>
        if(is_nil(value.canceled_at), do: nil, else: Inttegro.Codec.encode(value.canceled_at)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "custom_data" =>
        if(is_nil(value.custom_data),
          do: nil,
          else:
            Map.new(value.custom_data, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "failed_at" =>
        if(is_nil(value.failed_at), do: nil, else: Inttegro.Codec.encode(value.failed_at)),
      "id" => Inttegro.Codec.encode(value.id),
      "line_items" => Enum.map(value.line_items, fn item -> Inttegro.Codec.encode(item) end),
      "order_id" => Inttegro.Codec.encode(value.order_id),
      "processing_at" =>
        if(is_nil(value.processing_at), do: nil, else: Inttegro.Codec.encode(value.processing_at)),
      "reason" => Inttegro.Refunds.Reason.encode(value.reason),
      "reason_details" =>
        if(is_nil(value.reason_details),
          do: nil,
          else: Inttegro.Codec.encode(value.reason_details)
        ),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "settlement" => Inttegro.Refunds.Settlement.to_map(value.settlement),
      "status" => Inttegro.Refunds.Status.encode(value.status),
      "succeeded_at" =>
        if(is_nil(value.succeeded_at), do: nil, else: Inttegro.Codec.encode(value.succeeded_at)),
      "total" => Inttegro.Codec.encode(value.total)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.LineItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :order_line_item_id, :original_amount_paid, :refund_amount]
  defstruct id: nil,
            order_line_item_id: nil,
            original_amount_paid: nil,
            reason: nil,
            reason_details: nil,
            refund_amount: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          order_line_item_id: String.t(),
          original_amount_paid: Inttegro.Money.Amount.t(),
          reason: Inttegro.Refunds.Reason.t() | nil,
          reason_details: String.t() | nil,
          refund_amount: Inttegro.Money.Amount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      order_line_item_id: Map.fetch!(map, "order_line_item_id"),
      original_amount_paid:
        Inttegro.Money.Amount.from_map(Map.fetch!(map, "original_amount_paid")),
      reason:
        if(is_nil(Map.get(map, "reason")),
          do: nil,
          else: Inttegro.Refunds.Reason.decode(Map.get(map, "reason"))
        ),
      reason_details:
        if(is_nil(Map.get(map, "reason_details")), do: nil, else: Map.get(map, "reason_details")),
      refund_amount: Inttegro.Money.Amount.from_map(Map.fetch!(map, "refund_amount"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "order_line_item_id" => Inttegro.Codec.encode(value.order_line_item_id),
      "original_amount_paid" => Inttegro.Codec.encode(value.original_amount_paid),
      "reason" =>
        if(is_nil(value.reason),
          do: nil,
          else: Inttegro.Refunds.Reason.encode(value.reason)
        ),
      "reason_details" =>
        if(is_nil(value.reason_details),
          do: nil,
          else: Inttegro.Codec.encode(value.reason_details)
        ),
      "refund_amount" => Inttegro.Codec.encode(value.refund_amount)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :refunds, :size]
  defstruct number: nil, refunds: nil, size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          refunds: [Inttegro.Refunds.Refund.t()],
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
      refunds:
        Enum.map(Map.fetch!(map, "refunds"), fn item -> Inttegro.Refunds.Refund.from_map(item) end),
      size: Map.fetch!(map, "size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "refunds" => Enum.map(value.refunds, fn item -> Inttegro.Codec.encode(item) end),
      "size" => Inttegro.Codec.encode(value.size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Refunds.RequestMetaInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct idempotency_key: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          idempotency_key: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      idempotency_key:
        if(is_nil(Map.get(map, "idempotency_key")),
          do: nil,
          else: Map.get(map, "idempotency_key")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "idempotency_key" =>
        if(is_nil(value.idempotency_key),
          do: nil,
          else: Inttegro.Codec.encode(value.idempotency_key)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
