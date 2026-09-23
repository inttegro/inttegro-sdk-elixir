# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Payouts.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :initialized
          | :scheduled
          | :processing
          | :executing
          | :succeeded
          | :invalid
          | :canceled
          | String.t()
  @values %{
    initialized: "initialized",
    scheduled: "scheduled",
    processing: "processing",
    executing: "executing",
    succeeded: "succeeded",
    invalid: "invalid",
    canceled: "canceled"
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

defmodule Inttegro.Payouts.CancelRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payout_id]
  defstruct payout_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payout_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payout_id: Map.fetch!(map, "payout_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payout_id" => Inttegro.Codec.encode(value.payout_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.DisableAutomaticRequest do
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

defmodule Inttegro.Payouts.EnableAutomaticRequest do
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

defmodule Inttegro.Payouts.GetSettingsRequest do
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

defmodule Inttegro.Payouts.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:payout_id]
  defstruct payout_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payout_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payout_id: Map.fetch!(map, "payout_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payout_id" => Inttegro.Codec.encode(value.payout_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.PageRequest do
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

defmodule Inttegro.Payouts.BalanceTransaction do
  @moduledoc """
  Describes one balance transaction that funded a payout, including both the
  source's original amount and the exact amount allocated to this payout.
  """
  @enforce_keys [:allocated_amount, :amount, :id]
  defstruct allocated_amount: nil, amount: nil, id: nil

  @type t :: %__MODULE__{
          allocated_amount: Inttegro.Money.Amount.t(),
          amount: Inttegro.Money.Amount.t(),
          id: String.t()
        }

  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      allocated_amount: Inttegro.Money.Amount.from_map(Map.fetch!(map, "allocated_amount")),
      amount: Inttegro.Money.Amount.from_map(Map.fetch!(map, "amount")),
      id: Map.fetch!(map, "id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "allocated_amount" => Inttegro.Codec.encode(value.allocated_amount),
      "amount" => Inttegro.Codec.encode(value.amount),
      "id" => Inttegro.Codec.encode(value.id)
    }
  end
end

defmodule Inttegro.Payouts.Payout do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:destination_id, :execute_after, :id, :initiated_at, :max_amount, :status]
  defstruct amount: nil,
            balance_transactions: nil,
            canceled_at: nil,
            custom_data: nil,
            destination_id: nil,
            error: nil,
            execute_after: nil,
            executed_by: nil,
            expected_at: nil,
            failed_at: nil,
            id: nil,
            initiated_at: nil,
            initiated_by: nil,
            max_amount: nil,
            reference: nil,
            schedule_id: nil,
            scheduled_at: nil,
            scheduled_by: nil,
            sent_at: nil,
            source_id: nil,
            status: nil,
            succeeded_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          amount: Inttegro.Money.Amount.t() | nil,
          balance_transactions: [Inttegro.Payouts.BalanceTransaction.t()] | nil,
          canceled_at: DateTime.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          destination_id: String.t(),
          error: Inttegro.Payouts.Error.t() | nil,
          execute_after: DateTime.t(),
          executed_by: String.t() | nil,
          expected_at: DateTime.t() | nil,
          failed_at: DateTime.t() | nil,
          id: String.t(),
          initiated_at: DateTime.t(),
          initiated_by: String.t() | nil,
          max_amount: Inttegro.Money.Amount.t(),
          reference: String.t() | nil,
          schedule_id: String.t() | nil,
          scheduled_at: DateTime.t() | nil,
          scheduled_by: String.t() | nil,
          sent_at: DateTime.t() | nil,
          source_id: String.t() | nil,
          status: Inttegro.Payouts.Status.t(),
          succeeded_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      amount:
        if(is_nil(Map.get(map, "amount")),
          do: nil,
          else: Inttegro.Money.Amount.from_map(Map.get(map, "amount"))
        ),
      balance_transactions:
        if(is_nil(Map.get(map, "balance_transactions")),
          do: nil,
          else:
            Enum.map(Map.get(map, "balance_transactions"), fn item ->
              Inttegro.Payouts.BalanceTransaction.from_map(item)
            end)
        ),
      canceled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      destination_id: Map.fetch!(map, "destination_id"),
      error:
        if(is_nil(Map.get(map, "error")),
          do: nil,
          else: Inttegro.Payouts.Error.from_map(Map.get(map, "error"))
        ),
      execute_after: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "execute_after")),
      executed_by:
        if(is_nil(Map.get(map, "executed_by")), do: nil, else: Map.get(map, "executed_by")),
      expected_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expected_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expected_at"))
        ),
      failed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))
        ),
      id: Map.fetch!(map, "id"),
      initiated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initiated_at")),
      initiated_by:
        if(is_nil(Map.get(map, "initiated_by")), do: nil, else: Map.get(map, "initiated_by")),
      max_amount: Inttegro.Money.Amount.from_map(Map.fetch!(map, "max_amount")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      schedule_id:
        if(is_nil(Map.get(map, "schedule_id")), do: nil, else: Map.get(map, "schedule_id")),
      scheduled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "scheduled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "scheduled_at"))
        ),
      scheduled_by:
        if(is_nil(Map.get(map, "scheduled_by")), do: nil, else: Map.get(map, "scheduled_by")),
      sent_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "sent_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "sent_at"))
        ),
      source_id: if(is_nil(Map.get(map, "source_id")), do: nil, else: Map.get(map, "source_id")),
      status: Inttegro.Payouts.Status.decode(Map.fetch!(map, "status")),
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
      "amount" => if(is_nil(value.amount), do: nil, else: Inttegro.Codec.encode(value.amount)),
      "balance_transactions" =>
        if(is_nil(value.balance_transactions),
          do: nil,
          else: Enum.map(value.balance_transactions, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "canceled_at" =>
        if(is_nil(value.canceled_at), do: nil, else: Inttegro.Codec.encode(value.canceled_at)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "destination_id" => Inttegro.Codec.encode(value.destination_id),
      "error" => if(is_nil(value.error), do: nil, else: Inttegro.Codec.encode(value.error)),
      "execute_after" => Inttegro.Codec.encode(value.execute_after),
      "executed_by" =>
        if(is_nil(value.executed_by), do: nil, else: Inttegro.Codec.encode(value.executed_by)),
      "expected_at" =>
        if(is_nil(value.expected_at), do: nil, else: Inttegro.Codec.encode(value.expected_at)),
      "failed_at" =>
        if(is_nil(value.failed_at), do: nil, else: Inttegro.Codec.encode(value.failed_at)),
      "id" => Inttegro.Codec.encode(value.id),
      "initiated_at" => Inttegro.Codec.encode(value.initiated_at),
      "initiated_by" =>
        if(is_nil(value.initiated_by), do: nil, else: Inttegro.Codec.encode(value.initiated_by)),
      "max_amount" => Inttegro.Codec.encode(value.max_amount),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "schedule_id" =>
        if(is_nil(value.schedule_id), do: nil, else: Inttegro.Codec.encode(value.schedule_id)),
      "scheduled_at" =>
        if(is_nil(value.scheduled_at), do: nil, else: Inttegro.Codec.encode(value.scheduled_at)),
      "scheduled_by" =>
        if(is_nil(value.scheduled_by), do: nil, else: Inttegro.Codec.encode(value.scheduled_by)),
      "sent_at" => if(is_nil(value.sent_at), do: nil, else: Inttegro.Codec.encode(value.sent_at)),
      "source_id" =>
        if(is_nil(value.source_id), do: nil, else: Inttegro.Codec.encode(value.source_id)),
      "status" => Inttegro.Payouts.Status.encode(value.status),
      "succeeded_at" =>
        if(is_nil(value.succeeded_at), do: nil, else: Inttegro.Codec.encode(value.succeeded_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.Error do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:cause, :message, :occurred_at, :type]
  defstruct cause: nil, message: nil, occurred_at: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          cause: String.t(),
          message: String.t(),
          occurred_at: DateTime.t(),
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      cause: Map.fetch!(map, "cause"),
      message: Map.fetch!(map, "message"),
      occurred_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "occurred_at")),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "cause" => Inttegro.Codec.encode(value.cause),
      "message" => Inttegro.Codec.encode(value.message),
      "occurred_at" => Inttegro.Codec.encode(value.occurred_at),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size]
  defstruct number: nil, size: nil, payouts: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          payouts: [Inttegro.Payouts.Payout.t()] | nil
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
      payouts:
        if(is_nil(Map.get(map, "payouts")),
          do: nil,
          else:
            Enum.map(Map.get(map, "payouts"), fn item ->
              Inttegro.Payouts.Payout.from_map(item)
            end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "payouts" =>
        if(is_nil(value.payouts),
          do: nil,
          else: Enum.map(value.payouts, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.Destinations do
  @moduledoc """
  Financial accounts configured to receive payouts in supported currencies.

  Each field is a known currency route from the Inttegro payout contract. Use
  `ghs` for the financial account that receives Ghana cedi payouts.
  """
  defstruct ghs: nil

  @typedoc "A statically typed set of payout destinations."
  @type t :: %__MODULE__{ghs: String.t() | nil}

  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{ghs: Map.get(map, "ghs")}
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{"ghs" => value.ghs}
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SettingsLookup do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:destinations]
  defstruct destinations: nil, fx_enabled: nil, schedule: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          destinations: Inttegro.Payouts.Destinations.t(),
          fx_enabled: boolean() | nil,
          schedule: Inttegro.Payouts.SettingsLookupSchedule.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      destinations: Inttegro.Payouts.Destinations.from_map(Map.fetch!(map, "destinations")),
      fx_enabled:
        if(is_nil(Map.get(map, "fx_enabled")), do: nil, else: Map.get(map, "fx_enabled")),
      schedule:
        if(is_nil(Map.get(map, "schedule")),
          do: nil,
          else: Inttegro.Payouts.SettingsLookupSchedule.from_map(Map.get(map, "schedule"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "destinations" => Inttegro.Codec.encode(value.destinations),
      "fx_enabled" =>
        if(is_nil(value.fx_enabled), do: nil, else: Inttegro.Codec.encode(value.fx_enabled)),
      "schedule" =>
        if(is_nil(value.schedule), do: nil, else: Inttegro.Codec.encode(value.schedule))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SettingsLookupSchedule do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:aging_spec, :description, :interval, :name, :schedule_on, :type]
  defstruct aging_spec: nil,
            description: nil,
            interval: nil,
            name: nil,
            schedule_on: nil,
            type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          aging_spec: Inttegro.Payouts.SettingsLookupScheduleAgingSpec.t(),
          description: String.t(),
          interval: String.t(),
          name: String.t(),
          schedule_on: String.t(),
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      aging_spec:
        Inttegro.Payouts.SettingsLookupScheduleAgingSpec.from_map(Map.fetch!(map, "aging_spec")),
      description: Map.fetch!(map, "description"),
      interval: Map.fetch!(map, "interval"),
      name: Map.fetch!(map, "name"),
      schedule_on: Map.fetch!(map, "schedule_on"),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "aging_spec" => Inttegro.Codec.encode(value.aging_spec),
      "description" => Inttegro.Codec.encode(value.description),
      "interval" => Inttegro.Codec.encode(value.interval),
      "name" => Inttegro.Codec.encode(value.name),
      "schedule_on" => Inttegro.Codec.encode(value.schedule_on),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SettingsLookupScheduleAgingSpec do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:abide, :label, :t_plus]
  defstruct abide: nil, label: nil, t_plus: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          abide: String.t(),
          label: String.t(),
          t_plus: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      abide: Map.fetch!(map, "abide"),
      label: Map.fetch!(map, "label"),
      t_plus: Map.fetch!(map, "t_plus")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "abide" => Inttegro.Codec.encode(value.abide),
      "label" => Inttegro.Codec.encode(value.label),
      "t_plus" => Inttegro.Codec.encode(value.t_plus)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SettingsMutation do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct destinations: nil, fx_enabled: nil, id: nil, schedule: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          destinations: Inttegro.Payouts.Destinations.t() | nil,
          fx_enabled: boolean() | nil,
          id: String.t() | nil,
          schedule: Inttegro.Payouts.SettingsMutationSchedule.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      destinations:
        if(is_nil(Map.get(map, "destinations")),
          do: nil,
          else: Inttegro.Payouts.Destinations.from_map(Map.get(map, "destinations"))
        ),
      fx_enabled:
        if(is_nil(Map.get(map, "fx_enabled")), do: nil, else: Map.get(map, "fx_enabled")),
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      schedule:
        if(is_nil(Map.get(map, "schedule")),
          do: nil,
          else: Inttegro.Payouts.SettingsMutationSchedule.from_map(Map.get(map, "schedule"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "destinations" =>
        if(is_nil(value.destinations),
          do: nil,
          else: Inttegro.Codec.encode(value.destinations)
        ),
      "fx_enabled" =>
        if(is_nil(value.fx_enabled), do: nil, else: Inttegro.Codec.encode(value.fx_enabled)),
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "schedule" =>
        if(is_nil(value.schedule), do: nil, else: Inttegro.Codec.encode(value.schedule))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SettingsMutationSchedule do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:description, :id, :interval, :name, :schedule_on, :spec, :type]
  defstruct description: nil,
            id: nil,
            interval: nil,
            name: nil,
            schedule_on: nil,
            spec: nil,
            type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          description: String.t(),
          id: String.t(),
          interval: String.t(),
          name: String.t(),
          schedule_on: String.t(),
          spec: Inttegro.Payouts.SettingsMutationScheduleSpec.t(),
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      description: Map.fetch!(map, "description"),
      id: Map.fetch!(map, "id"),
      interval: Map.fetch!(map, "interval"),
      name: Map.fetch!(map, "name"),
      schedule_on: Map.fetch!(map, "schedule_on"),
      spec: Inttegro.Payouts.SettingsMutationScheduleSpec.from_map(Map.fetch!(map, "spec")),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "description" => Inttegro.Codec.encode(value.description),
      "id" => Inttegro.Codec.encode(value.id),
      "interval" => Inttegro.Codec.encode(value.interval),
      "name" => Inttegro.Codec.encode(value.name),
      "schedule_on" => Inttegro.Codec.encode(value.schedule_on),
      "spec" => Inttegro.Codec.encode(value.spec),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SettingsMutationScheduleSpec do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:abide, :id, :label, :t_plus]
  defstruct abide: nil, id: nil, label: nil, t_plus: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          abide: String.t(),
          id: String.t(),
          label: String.t(),
          t_plus: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      abide: Map.fetch!(map, "abide"),
      id: Map.fetch!(map, "id"),
      label: Map.fetch!(map, "label"),
      t_plus: Map.fetch!(map, "t_plus")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "abide" => Inttegro.Codec.encode(value.abide),
      "id" => Inttegro.Codec.encode(value.id),
      "label" => Inttegro.Codec.encode(value.label),
      "t_plus" => Inttegro.Codec.encode(value.t_plus)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.ScheduleRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:destination_id, :reference]
  defstruct execute_after: nil, max_amount: nil, destination_id: nil, reference: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          execute_after: DateTime.t() | nil,
          max_amount: integer() | nil,
          destination_id: String.t(),
          reference: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      execute_after:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "execute_after"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "execute_after"))
        ),
      max_amount:
        if(is_nil(Map.get(map, "max_amount")), do: nil, else: Map.get(map, "max_amount")),
      destination_id: Map.fetch!(map, "destination_id"),
      reference: Map.fetch!(map, "reference")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "execute_after" =>
        if(is_nil(value.execute_after), do: nil, else: Inttegro.Codec.encode(value.execute_after)),
      "max_amount" =>
        if(is_nil(value.max_amount), do: nil, else: Inttegro.Codec.encode(value.max_amount)),
      "destination_id" => Inttegro.Codec.encode(value.destination_id),
      "reference" => Inttegro.Codec.encode(value.reference)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Payouts.SetDestinationsRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:destinations]
  defstruct destinations: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          destinations: Inttegro.Payouts.Destinations.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      destinations: Inttegro.Payouts.Destinations.from_map(Map.fetch!(map, "destinations"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "destinations" => Inttegro.Codec.encode(value.destinations)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
