# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Invoices.DeliveryChannel do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :email | :sms | String.t()
  @values %{
    email: "email",
    sms: "sms"
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

defmodule Inttegro.Invoices.OrderDocumentKind do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :invoice | :receipt | String.t()
  @values %{
    invoice: "invoice",
    receipt: "receipt"
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

defmodule Inttegro.Invoices.Settings do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct number: nil, memo: nil, footer: nil, custom_data: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: String.t() | nil,
          memo: String.t() | nil,
          footer: String.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      memo: if(is_nil(Map.get(map, "memo")), do: nil, else: Map.get(map, "memo")),
      footer: if(is_nil(Map.get(map, "footer")), do: nil, else: Map.get(map, "footer")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "memo" => if(is_nil(value.memo), do: nil, else: Inttegro.Codec.encode(value.memo)),
      "footer" => if(is_nil(value.footer), do: nil, else: Inttegro.Codec.encode(value.footer)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.SettingsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct number: nil, memo: nil, footer: nil, custom_data: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          number: String.t() | nil,
          memo: String.t() | nil,
          footer: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      memo: if(is_nil(Map.get(map, "memo")), do: nil, else: Map.get(map, "memo")),
      footer: if(is_nil(Map.get(map, "footer")), do: nil, else: Map.get(map, "footer")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "memo" => if(is_nil(value.memo), do: nil, else: Inttegro.Codec.encode(value.memo)),
      "footer" => if(is_nil(value.footer), do: nil, else: Inttegro.Codec.encode(value.footer)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderDocumentDelivery do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct deliveries: nil,
            document_kind: nil,
            document_url: nil,
            failed_channels: nil,
            failures: nil,
            sent_channels: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          deliveries: [Inttegro.Invoices.OrderDocumentDeliveryAttempt.t()] | nil,
          document_kind: Inttegro.Invoices.OrderDocumentKind.t() | nil,
          document_url: String.t() | nil,
          failed_channels: [String.t()] | nil,
          failures: [Inttegro.Invoices.OrderDocumentDeliveryFailure.t()] | nil,
          sent_channels: [String.t()] | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      deliveries:
        if(is_nil(Map.get(map, "deliveries")),
          do: nil,
          else:
            Enum.map(Map.get(map, "deliveries"), fn item ->
              Inttegro.Invoices.OrderDocumentDeliveryAttempt.from_map(item)
            end)
        ),
      document_kind:
        if(is_nil(Map.get(map, "document_kind")),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentKind.decode(Map.get(map, "document_kind"))
        ),
      document_url:
        if(is_nil(Map.get(map, "document_url")), do: nil, else: Map.get(map, "document_url")),
      failed_channels:
        if(is_nil(Map.get(map, "failed_channels")),
          do: nil,
          else: Enum.map(Map.get(map, "failed_channels"), fn item -> item end)
        ),
      failures:
        if(is_nil(Map.get(map, "failures")),
          do: nil,
          else:
            Enum.map(Map.get(map, "failures"), fn item ->
              Inttegro.Invoices.OrderDocumentDeliveryFailure.from_map(item)
            end)
        ),
      sent_channels:
        if(is_nil(Map.get(map, "sent_channels")),
          do: nil,
          else: Enum.map(Map.get(map, "sent_channels"), fn item -> item end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "deliveries" =>
        if(is_nil(value.deliveries),
          do: nil,
          else: Enum.map(value.deliveries, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "document_kind" =>
        if(is_nil(value.document_kind),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentKind.encode(value.document_kind)
        ),
      "document_url" =>
        if(is_nil(value.document_url), do: nil, else: Inttegro.Codec.encode(value.document_url)),
      "failed_channels" =>
        if(is_nil(value.failed_channels),
          do: nil,
          else: Enum.map(value.failed_channels, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "failures" =>
        if(is_nil(value.failures),
          do: nil,
          else: Enum.map(value.failures, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "sent_channels" =>
        if(is_nil(value.sent_channels),
          do: nil,
          else: Enum.map(value.sent_channels, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderDocumentDeliveryAttempt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct channel: nil, chime_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          channel: Inttegro.Invoices.DeliveryChannel.t() | nil,
          chime_id: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      channel:
        if(is_nil(Map.get(map, "channel")),
          do: nil,
          else: Inttegro.Invoices.DeliveryChannel.decode(Map.get(map, "channel"))
        ),
      chime_id: if(is_nil(Map.get(map, "chime_id")), do: nil, else: Map.get(map, "chime_id"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "channel" =>
        if(is_nil(value.channel),
          do: nil,
          else: Inttegro.Invoices.DeliveryChannel.encode(value.channel)
        ),
      "chime_id" =>
        if(is_nil(value.chime_id), do: nil, else: Inttegro.Codec.encode(value.chime_id))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderDocumentDeliveryFailure do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct channel: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          channel: Inttegro.Invoices.DeliveryChannel.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      channel:
        if(is_nil(Map.get(map, "channel")),
          do: nil,
          else: Inttegro.Invoices.DeliveryChannel.decode(Map.get(map, "channel"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "channel" =>
        if(is_nil(value.channel),
          do: nil,
          else: Inttegro.Invoices.DeliveryChannel.encode(value.channel)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderDocumentFormat do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:url]
  defstruct url: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          url: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      url: Map.fetch!(map, "url")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "url" => Inttegro.Codec.encode(value.url)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderReceiptFormat do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:web, :pdf]
  defstruct web: nil, pdf: nil

  @type t :: %__MODULE__{
          web: Inttegro.Invoices.OrderDocumentFormat.t(),
          pdf: Inttegro.Invoices.OrderDocumentFormat.t()
        }

  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      web: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.fetch!(map, "web")),
      pdf: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.fetch!(map, "pdf"))
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value),
    do: %{"web" => Inttegro.Codec.encode(value.web), "pdf" => Inttegro.Codec.encode(value.pdf)}
end

defmodule Inttegro.Invoices.OrderDocumentDeliveryChannelSummary do
  @moduledoc """
  Summarizes accepted invoice or receipt deliveries for one channel.

  `count` is the number accepted for delivery, while `latest_sent_at` records
  when the most recent accepted delivery was sent.
  """
  @enforce_keys [:count, :latest_sent_at]
  defstruct count: nil, latest_sent_at: nil

  @type t :: %__MODULE__{count: non_neg_integer(), latest_sent_at: DateTime.t()}

  @spec from_map(map()) :: t()
  def from_map(map),
    do: %__MODULE__{
      count: Map.fetch!(map, "count"),
      latest_sent_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "latest_sent_at"))
    }

  @spec to_map(t()) :: map()
  def to_map(value),
    do: %{
      "count" => value.count,
      "latest_sent_at" => Inttegro.Codec.encode(value.latest_sent_at)
    }
end

defmodule Inttegro.Invoices.OrderDocumentDeliverySummaryChannels do
  @moduledoc """
  Groups accepted invoice or receipt delivery totals by channel.

  Email and SMS summaries are optional because only channels used for the
  document appear in the response.
  """
  defstruct email: nil, sms: nil

  @type t :: %__MODULE__{
          email: Inttegro.Invoices.OrderDocumentDeliveryChannelSummary.t() | nil,
          sms: Inttegro.Invoices.OrderDocumentDeliveryChannelSummary.t() | nil
        }

  @spec from_map(map()) :: t()
  def from_map(map),
    do: %__MODULE__{
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else:
            Inttegro.Invoices.OrderDocumentDeliveryChannelSummary.from_map(Map.get(map, "email"))
        ),
      sms:
        if(is_nil(Map.get(map, "sms")),
          do: nil,
          else:
            Inttegro.Invoices.OrderDocumentDeliveryChannelSummary.from_map(Map.get(map, "sms"))
        )
    }

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "email" =>
        if(is_nil(value.email),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentDeliveryChannelSummary.to_map(value.email)
        ),
      "sms" =>
        if(is_nil(value.sms),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentDeliveryChannelSummary.to_map(value.sms)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderDocumentDeliverySummary do
  @moduledoc """
  Aggregates accepted invoice or receipt deliveries across all channels.

  It contains the overall accepted delivery count and latest send time, plus
  per-channel summaries for email and SMS when those channels were used.
  """
  @enforce_keys [:channels, :latest_sent_at, :total_count]
  defstruct channels: nil, latest_sent_at: nil, total_count: nil

  @type t :: %__MODULE__{
          channels: Inttegro.Invoices.OrderDocumentDeliverySummaryChannels.t(),
          latest_sent_at: DateTime.t(),
          total_count: pos_integer()
        }

  @spec from_map(map()) :: t()
  def from_map(map),
    do: %__MODULE__{
      channels:
        Inttegro.Invoices.OrderDocumentDeliverySummaryChannels.from_map(
          Map.fetch!(map, "channels")
        ),
      latest_sent_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "latest_sent_at")),
      total_count: Map.fetch!(map, "total_count")
    }

  @spec to_map(t()) :: map()
  def to_map(value),
    do: %{
      "channels" => Inttegro.Invoices.OrderDocumentDeliverySummaryChannels.to_map(value.channels),
      "latest_sent_at" => Inttegro.Codec.encode(value.latest_sent_at),
      "total_count" => value.total_count
    }
end

defmodule Inttegro.Invoices.OrderReceipt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:format]
  defstruct format: nil, number: nil, delivery_summary: nil

  @type t :: %__MODULE__{
          format: Inttegro.Invoices.OrderReceiptFormat.t(),
          number: String.t() | nil,
          delivery_summary: Inttegro.Invoices.OrderDocumentDeliverySummary.t() | nil
        }

  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      format: Inttegro.Invoices.OrderReceiptFormat.from_map(Map.fetch!(map, "format")),
      number: Map.get(map, "number"),
      delivery_summary:
        if(is_nil(Map.get(map, "delivery_summary")),
          do: nil,
          else:
            Inttegro.Invoices.OrderDocumentDeliverySummary.from_map(
              Map.get(map, "delivery_summary")
            )
        )
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "format" => Inttegro.Codec.encode(value.format),
      "number" => value.number,
      "delivery_summary" =>
        if(is_nil(value.delivery_summary),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentDeliverySummary.to_map(value.delivery_summary)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.Order do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:format]
  defstruct number: nil, format: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: String.t() | nil,
          format: Inttegro.Invoices.OrderFormat.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      format: Inttegro.Invoices.OrderFormat.from_map(Map.fetch!(map, "format"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "format" => Inttegro.Codec.encode(value.format)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Invoices.OrderFormat do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:web, :pdf]
  defstruct web: nil, pdf: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          web: Inttegro.Invoices.OrderDocumentFormat.t(),
          pdf: Inttegro.Invoices.OrderDocumentFormat.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      web: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.fetch!(map, "web")),
      pdf: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.fetch!(map, "pdf"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "web" => Inttegro.Codec.encode(value.web),
      "pdf" => Inttegro.Codec.encode(value.pdf)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
