# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Payments.AttemptStatus do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :initiated
          | :executed
          | :succeeded
          | :canceled
          | :expired
          | :failed
          | :unknown
          | String.t()
  @values %{
    initiated: "initiated",
    executed: "executed",
    succeeded: "succeeded",
    canceled: "canceled",
    expired: "expired",
    failed: "failed",
    unknown: "unknown"
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

defmodule Inttegro.Payments.ConfirmationChannel do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :sms | :email | :push | String.t()
  @values %{
    sms: "sms",
    email: "email",
    push: "push"
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

defmodule Inttegro.Payments.NextActionType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :confirm_payment
          | :execute
          | :redirect
          | :authorize_payment
          | :request_confirmation
          | String.t()
  @values %{
    confirm_payment: "confirm_payment",
    execute: "execute",
    redirect: "redirect",
    authorize_payment: "authorize_payment",
    request_confirmation: "request_confirmation"
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

defmodule Inttegro.Payments.ResultStatus do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :pending | :requires_confirmation | :processing | :succeeded | :failed | String.t()
  @values %{
    pending: "pending",
    requires_confirmation: "requires_confirmation",
    processing: "processing",
    succeeded: "succeeded",
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

defmodule Inttegro.Payments.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :initiated
          | :requires_action
          | :overdue
          | :executed
          | :paid
          | :canceled
          | :expired
          | :failed
          | :unknown
          | String.t()
  @values %{
    initiated: "initiated",
    requires_action: "requires_action",
    overdue: "overdue",
    executed: "executed",
    paid: "paid",
    canceled: "canceled",
    expired: "expired",
    failed: "failed",
    unknown: "unknown"
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

defmodule Inttegro.Payments.Payment do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :status, :statement_descriptor, :amount, :initiated_at]
  defstruct id: nil,
            status: nil,
            statement_descriptor: nil,
            amount: nil,
            billing_details: nil,
            balance_transaction: nil,
            payment_method: nil,
            customer: nil,
            receipt: nil,
            latest_attempt: nil,
            next_action: nil,
            latest_error: nil,
            initiated_at: nil,
            executed_at: nil,
            paid_at: nil,
            canceled_at: nil,
            due_at: nil,
            expired_at: nil,
            failed_at: nil,
            paid_offline: nil,
            payment_method_types: nil,
            payout_configuration: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          status: Inttegro.Payments.Status.t(),
          statement_descriptor: String.t(),
          amount: Inttegro.Money.Amount.t(),
          billing_details: Inttegro.Payments.BillingDetails.t() | nil,
          balance_transaction: Inttegro.BalanceTransactions.BalanceTransaction.t() | nil,
          payment_method: Inttegro.PaymentMethods.Snapshot.t() | nil,
          customer: Inttegro.Orders.Customer.t() | nil,
          receipt: Inttegro.Invoices.OrderReceipt.t() | nil,
          latest_attempt: Inttegro.Payments.Attempt.t() | nil,
          next_action: Inttegro.Payments.NextAction.t() | nil,
          latest_error: Inttegro.Payments.Error.t() | nil,
          initiated_at: DateTime.t(),
          executed_at: DateTime.t() | nil,
          paid_at: DateTime.t() | nil,
          canceled_at: DateTime.t() | nil,
          due_at: DateTime.t() | nil,
          expired_at: DateTime.t() | nil,
          failed_at: DateTime.t() | nil,
          paid_offline: boolean() | nil,
          payment_method_types: [String.t()] | nil,
          payout_configuration: Inttegro.Payments.PayoutConfiguration.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      status: Inttegro.Payments.Status.decode(Map.fetch!(map, "status")),
      statement_descriptor: Map.fetch!(map, "statement_descriptor"),
      amount: Inttegro.Money.Amount.from_map(Map.fetch!(map, "amount")),
      billing_details:
        if(is_nil(Map.get(map, "billing_details")),
          do: nil,
          else: Inttegro.Payments.BillingDetails.from_map(Map.get(map, "billing_details"))
        ),
      balance_transaction:
        if(is_nil(Map.get(map, "balance_transaction")),
          do: nil,
          else:
            Inttegro.BalanceTransactions.BalanceTransaction.from_map(
              Map.get(map, "balance_transaction")
            )
        ),
      payment_method:
        if(is_nil(Map.get(map, "payment_method")),
          do: nil,
          else: Inttegro.PaymentMethods.Snapshot.from_map(Map.get(map, "payment_method"))
        ),
      customer:
        if(is_nil(Map.get(map, "customer")),
          do: nil,
          else: Inttegro.Orders.Customer.from_map(Map.get(map, "customer"))
        ),
      receipt:
        if(is_nil(Map.get(map, "receipt")),
          do: nil,
          else: Inttegro.Invoices.OrderReceipt.from_map(Map.get(map, "receipt"))
        ),
      latest_attempt:
        if(is_nil(Map.get(map, "latest_attempt")),
          do: nil,
          else: Inttegro.Payments.Attempt.from_map(Map.get(map, "latest_attempt"))
        ),
      next_action:
        if(is_nil(Map.get(map, "next_action")),
          do: nil,
          else: Inttegro.Payments.NextAction.from_map(Map.get(map, "next_action"))
        ),
      latest_error:
        if(is_nil(Map.get(map, "latest_error")),
          do: nil,
          else: Inttegro.Payments.Error.from_map(Map.get(map, "latest_error"))
        ),
      initiated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initiated_at")),
      executed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "executed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "executed_at"))
        ),
      paid_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "paid_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "paid_at"))
        ),
      canceled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))
        ),
      due_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "due_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "due_at"))
        ),
      expired_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expired_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expired_at"))
        ),
      failed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))
        ),
      paid_offline:
        if(is_nil(Map.get(map, "paid_offline")), do: nil, else: Map.get(map, "paid_offline")),
      payment_method_types:
        if(is_nil(Map.get(map, "payment_method_types")),
          do: nil,
          else: Enum.map(Map.get(map, "payment_method_types"), fn item -> item end)
        ),
      payout_configuration:
        if(is_nil(Map.get(map, "payout_configuration")),
          do: nil,
          else:
            Inttegro.Payments.PayoutConfiguration.from_map(Map.get(map, "payout_configuration"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "status" => Inttegro.Payments.Status.encode(value.status),
      "statement_descriptor" => Inttegro.Codec.encode(value.statement_descriptor),
      "amount" => Inttegro.Codec.encode(value.amount),
      "billing_details" =>
        if(is_nil(value.billing_details),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_details)
        ),
      "balance_transaction" =>
        if(is_nil(value.balance_transaction),
          do: nil,
          else: Inttegro.Codec.encode(value.balance_transaction)
        ),
      "payment_method" =>
        if(is_nil(value.payment_method),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method)
        ),
      "customer" =>
        if(is_nil(value.customer), do: nil, else: Inttegro.Codec.encode(value.customer)),
      "receipt" => if(is_nil(value.receipt), do: nil, else: Inttegro.Codec.encode(value.receipt)),
      "latest_attempt" =>
        if(is_nil(value.latest_attempt),
          do: nil,
          else: Inttegro.Codec.encode(value.latest_attempt)
        ),
      "next_action" =>
        if(is_nil(value.next_action), do: nil, else: Inttegro.Codec.encode(value.next_action)),
      "latest_error" =>
        if(is_nil(value.latest_error), do: nil, else: Inttegro.Codec.encode(value.latest_error)),
      "initiated_at" => Inttegro.Codec.encode(value.initiated_at),
      "executed_at" =>
        if(is_nil(value.executed_at), do: nil, else: Inttegro.Codec.encode(value.executed_at)),
      "paid_at" => if(is_nil(value.paid_at), do: nil, else: Inttegro.Codec.encode(value.paid_at)),
      "canceled_at" =>
        if(is_nil(value.canceled_at), do: nil, else: Inttegro.Codec.encode(value.canceled_at)),
      "due_at" => if(is_nil(value.due_at), do: nil, else: Inttegro.Codec.encode(value.due_at)),
      "expired_at" =>
        if(is_nil(value.expired_at), do: nil, else: Inttegro.Codec.encode(value.expired_at)),
      "failed_at" =>
        if(is_nil(value.failed_at), do: nil, else: Inttegro.Codec.encode(value.failed_at)),
      "paid_offline" =>
        if(is_nil(value.paid_offline), do: nil, else: Inttegro.Codec.encode(value.paid_offline)),
      "payment_method_types" =>
        if(is_nil(value.payment_method_types),
          do: nil,
          else: Enum.map(value.payment_method_types, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "payout_configuration" =>
        if(is_nil(value.payout_configuration),
          do: nil,
          else: Inttegro.Codec.encode(value.payout_configuration)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.BillingDetails do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct owner: nil
  @type t :: %__MODULE__{owner: Inttegro.PaymentMethods.SnapshotOwner.t() | nil}
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      owner:
        if(is_nil(Map.get(map, "owner")),
          do: nil,
          else: Inttegro.PaymentMethods.SnapshotOwner.from_map(Map.get(map, "owner"))
        )
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{"owner" => if(is_nil(value.owner), do: nil, else: Inttegro.Codec.encode(value.owner))}
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.Error do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:message]
  defstruct message: nil
  @type t :: %__MODULE__{message: String.t()}
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map), do: %__MODULE__{message: Map.fetch!(map, "message")}
  @spec to_map(t()) :: map()
  def to_map(value), do: %{"message" => value.message}
end

defmodule Inttegro.Payments.AttemptError do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:message]
  defstruct message: nil
  @type t :: %__MODULE__{message: String.t()}
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map), do: %__MODULE__{message: Map.fetch!(map, "message")}
  @spec to_map(t()) :: map()
  def to_map(value), do: %{"message" => value.message}
end

defmodule Inttegro.Payments.Attempt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:status, :initiated_at]
  defstruct payment_method_type: nil,
            payment_method_id: nil,
            reference: nil,
            error: nil,
            status: nil,
            initiated_at: nil,
            succeeded_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          payment_method_type: String.t() | nil,
          payment_method_id: String.t() | nil,
          reference: String.t() | nil,
          error: Inttegro.Payments.AttemptError.t() | nil,
          status: Inttegro.Payments.AttemptStatus.t(),
          initiated_at: DateTime.t(),
          succeeded_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_type:
        if(is_nil(Map.get(map, "payment_method_type")),
          do: nil,
          else: Map.get(map, "payment_method_type")
        ),
      payment_method_id:
        if(is_nil(Map.get(map, "payment_method_id")),
          do: nil,
          else: Map.get(map, "payment_method_id")
        ),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      error:
        if(is_nil(Map.get(map, "error")),
          do: nil,
          else: Inttegro.Payments.AttemptError.from_map(Map.get(map, "error"))
        ),
      status: Inttegro.Payments.AttemptStatus.decode(Map.fetch!(map, "status")),
      initiated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initiated_at")),
      succeeded_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "succeeded_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "succeeded_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_type" =>
        if(is_nil(value.payment_method_type),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_type)
        ),
      "payment_method_id" =>
        if(is_nil(value.payment_method_id),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_id)
        ),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "error" => if(is_nil(value.error), do: nil, else: Inttegro.Codec.encode(value.error)),
      "status" => Inttegro.Payments.AttemptStatus.encode(value.status),
      "initiated_at" => Inttegro.Codec.encode(value.initiated_at),
      "succeeded_at" =>
        if(is_nil(value.succeeded_at), do: nil, else: Inttegro.Codec.encode(value.succeeded_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextAction do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct type: nil,
            confirm_payment: nil,
            redirect: nil,
            authorize: nil,
            request_confirmation: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: Inttegro.Payments.NextActionType.t(),
          confirm_payment: Inttegro.Payments.NextActionConfirm.t() | nil,
          redirect: Inttegro.Payments.NextActionRedirect.t() | nil,
          authorize: Inttegro.Payments.NextActionAuthorize.t() | nil,
          request_confirmation: Inttegro.Payments.NextActionRequestConfirmation.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Payments.NextActionType.decode(Map.fetch!(map, "type")),
      confirm_payment:
        if(is_nil(Map.get(map, "confirm_payment")),
          do: nil,
          else: Inttegro.Payments.NextActionConfirm.from_map(Map.get(map, "confirm_payment"))
        ),
      redirect:
        if(is_nil(Map.get(map, "redirect")),
          do: nil,
          else: Inttegro.Payments.NextActionRedirect.from_map(Map.get(map, "redirect"))
        ),
      authorize:
        if(is_nil(Map.get(map, "authorize")),
          do: nil,
          else: Inttegro.Payments.NextActionAuthorize.from_map(Map.get(map, "authorize"))
        ),
      request_confirmation:
        if(is_nil(Map.get(map, "request_confirmation")),
          do: nil,
          else:
            Inttegro.Payments.NextActionRequestConfirmation.from_map(
              Map.get(map, "request_confirmation")
            )
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Payments.NextActionType.encode(value.type),
      "confirm_payment" =>
        if(is_nil(value.confirm_payment),
          do: nil,
          else: Inttegro.Codec.encode(value.confirm_payment)
        ),
      "redirect" =>
        if(is_nil(value.redirect), do: nil, else: Inttegro.Codec.encode(value.redirect)),
      "authorize" =>
        if(is_nil(value.authorize), do: nil, else: Inttegro.Codec.encode(value.authorize)),
      "request_confirmation" =>
        if(is_nil(value.request_confirmation),
          do: nil,
          else: Inttegro.Codec.encode(value.request_confirmation)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionAuthorize do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct beneficiary: nil, scheme: nil, expires_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          beneficiary: String.t() | nil,
          scheme: String.t() | nil,
          expires_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      beneficiary:
        if(is_nil(Map.get(map, "beneficiary")), do: nil, else: Map.get(map, "beneficiary")),
      scheme: if(is_nil(Map.get(map, "scheme")), do: nil, else: Map.get(map, "scheme")),
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
      "beneficiary" =>
        if(is_nil(value.beneficiary), do: nil, else: Inttegro.Codec.encode(value.beneficiary)),
      "scheme" => if(is_nil(value.scheme), do: nil, else: Inttegro.Codec.encode(value.scheme)),
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionConfirm do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct expires_at: nil, scheme: nil, request: nil, attempt: nil, confirmed: nil, status: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          expires_at: DateTime.t() | nil,
          scheme: String.t() | nil,
          request: Inttegro.Payments.NextActionConfirmRequest.t() | nil,
          attempt: Inttegro.Payments.NextActionConfirmAttempt.t() | nil,
          confirmed: boolean() | nil,
          status: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      expires_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))
        ),
      scheme: if(is_nil(Map.get(map, "scheme")), do: nil, else: Map.get(map, "scheme")),
      request:
        if(is_nil(Map.get(map, "request")),
          do: nil,
          else: Inttegro.Payments.NextActionConfirmRequest.from_map(Map.get(map, "request"))
        ),
      attempt:
        if(is_nil(Map.get(map, "attempt")),
          do: nil,
          else: Inttegro.Payments.NextActionConfirmAttempt.from_map(Map.get(map, "attempt"))
        ),
      confirmed: if(is_nil(Map.get(map, "confirmed")), do: nil, else: Map.get(map, "confirmed")),
      status: if(is_nil(Map.get(map, "status")), do: nil, else: Map.get(map, "status"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at)),
      "scheme" => if(is_nil(value.scheme), do: nil, else: Inttegro.Codec.encode(value.scheme)),
      "request" => if(is_nil(value.request), do: nil, else: Inttegro.Codec.encode(value.request)),
      "attempt" => if(is_nil(value.attempt), do: nil, else: Inttegro.Codec.encode(value.attempt)),
      "confirmed" =>
        if(is_nil(value.confirmed), do: nil, else: Inttegro.Codec.encode(value.confirmed)),
      "status" => if(is_nil(value.status), do: nil, else: Inttegro.Codec.encode(value.status))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionConfirmAttempt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct status: nil,
            confirmed: nil,
            reason: nil,
            token: nil,
            executed_at: nil,
            created_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          status: String.t() | nil,
          confirmed: boolean() | nil,
          reason: String.t() | nil,
          token: String.t() | nil,
          executed_at: DateTime.t() | nil,
          created_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      status: if(is_nil(Map.get(map, "status")), do: nil, else: Map.get(map, "status")),
      confirmed: if(is_nil(Map.get(map, "confirmed")), do: nil, else: Map.get(map, "confirmed")),
      reason: if(is_nil(Map.get(map, "reason")), do: nil, else: Map.get(map, "reason")),
      token: if(is_nil(Map.get(map, "token")), do: nil, else: Map.get(map, "token")),
      executed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "executed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "executed_at"))
        ),
      created_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "created_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "created_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "status" => if(is_nil(value.status), do: nil, else: Inttegro.Codec.encode(value.status)),
      "confirmed" =>
        if(is_nil(value.confirmed), do: nil, else: Inttegro.Codec.encode(value.confirmed)),
      "reason" => if(is_nil(value.reason), do: nil, else: Inttegro.Codec.encode(value.reason)),
      "token" => if(is_nil(value.token), do: nil, else: Inttegro.Codec.encode(value.token)),
      "executed_at" =>
        if(is_nil(value.executed_at), do: nil, else: Inttegro.Codec.encode(value.executed_at)),
      "created_at" =>
        if(is_nil(value.created_at), do: nil, else: Inttegro.Codec.encode(value.created_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionConfirmRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct id: nil, recipient: nil, sent_via: nil, token_size: nil, sender_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t() | nil,
          recipient: String.t() | nil,
          sent_via: Inttegro.Payments.ConfirmationChannel.t() | nil,
          token_size: integer() | nil,
          sender_id: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      recipient: if(is_nil(Map.get(map, "recipient")), do: nil, else: Map.get(map, "recipient")),
      sent_via:
        if(is_nil(Map.get(map, "sent_via")),
          do: nil,
          else: Inttegro.Payments.ConfirmationChannel.decode(Map.get(map, "sent_via"))
        ),
      token_size:
        if(is_nil(Map.get(map, "token_size")), do: nil, else: Map.get(map, "token_size")),
      sender_id: if(is_nil(Map.get(map, "sender_id")), do: nil, else: Map.get(map, "sender_id"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "recipient" =>
        if(is_nil(value.recipient), do: nil, else: Inttegro.Codec.encode(value.recipient)),
      "sent_via" =>
        if(is_nil(value.sent_via),
          do: nil,
          else: Inttegro.Payments.ConfirmationChannel.encode(value.sent_via)
        ),
      "token_size" =>
        if(is_nil(value.token_size), do: nil, else: Inttegro.Codec.encode(value.token_size)),
      "sender_id" =>
        if(is_nil(value.sender_id), do: nil, else: Inttegro.Codec.encode(value.sender_id))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionRedirect do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct redirect_url: nil, valid_until: nil, latest_visit: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          redirect_url: String.t() | nil,
          valid_until: DateTime.t() | nil,
          latest_visit: Inttegro.Payments.NextActionRedirectLatestVisit.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      redirect_url:
        if(is_nil(Map.get(map, "redirect_url")), do: nil, else: Map.get(map, "redirect_url")),
      valid_until:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "valid_until"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "valid_until"))
        ),
      latest_visit:
        if(is_nil(Map.get(map, "latest_visit")),
          do: nil,
          else:
            Inttegro.Payments.NextActionRedirectLatestVisit.from_map(Map.get(map, "latest_visit"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "redirect_url" =>
        if(is_nil(value.redirect_url), do: nil, else: Inttegro.Codec.encode(value.redirect_url)),
      "valid_until" =>
        if(is_nil(value.valid_until), do: nil, else: Inttegro.Codec.encode(value.valid_until)),
      "latest_visit" =>
        if(is_nil(value.latest_visit), do: nil, else: Inttegro.Codec.encode(value.latest_visit))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionRedirectLatestVisit do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct user_agent: nil, ip_address: nil, at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          user_agent: String.t() | nil,
          ip_address: String.t() | nil,
          at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      user_agent:
        if(is_nil(Map.get(map, "user_agent")), do: nil, else: Map.get(map, "user_agent")),
      ip_address:
        if(is_nil(Map.get(map, "ip_address")), do: nil, else: Map.get(map, "ip_address")),
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
      "user_agent" =>
        if(is_nil(value.user_agent), do: nil, else: Inttegro.Codec.encode(value.user_agent)),
      "ip_address" =>
        if(is_nil(value.ip_address), do: nil, else: Inttegro.Codec.encode(value.ip_address)),
      "at" => if(is_nil(value.at), do: nil, else: Inttegro.Codec.encode(value.at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.NextActionRequestConfirmation do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct last_request: nil, after: nil

  @type t :: %__MODULE__{
          last_request: Inttegro.Payments.NextActionConfirmRequest.t() | nil,
          after: DateTime.t() | nil
        }
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map) do
    %__MODULE__{
      last_request:
        if(is_nil(Map.get(map, "last_request")),
          do: nil,
          else: Inttegro.Payments.NextActionConfirmRequest.from_map(Map.get(map, "last_request"))
        ),
      after: Inttegro.Codec.decode_timestamp(Map.get(map, "after"))
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "last_request" =>
        if(is_nil(value.last_request), do: nil, else: Inttegro.Codec.encode(value.last_request)),
      "after" => value.after
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.PayoutConfiguration do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:enable_fx, :destination]
  defstruct enable_fx: nil, destination: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          enable_fx: boolean(),
          destination: Inttegro.Payments.PayoutConfigurationDestination.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      enable_fx: Map.fetch!(map, "enable_fx"),
      destination:
        Inttegro.Payments.PayoutConfigurationDestination.from_map(Map.fetch!(map, "destination"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "enable_fx" => Inttegro.Codec.encode(value.enable_fx),
      "destination" => Inttegro.Codec.encode(value.destination)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payments.PayoutConfigurationDestination do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:financial_account_id]
  defstruct financial_account_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          financial_account_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      financial_account_id: Map.fetch!(map, "financial_account_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "financial_account_id" => Inttegro.Codec.encode(value.financial_account_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
