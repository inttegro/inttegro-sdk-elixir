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
  defstruct channel: nil, error: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          channel: Inttegro.Invoices.DeliveryChannel.t() | nil,
          error: String.t() | nil
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
      error: if(is_nil(Map.get(map, "error")), do: nil, else: Map.get(map, "error"))
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
      "error" => if(is_nil(value.error), do: nil, else: Inttegro.Codec.encode(value.error))
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
  defstruct web: nil, pdf: nil, receipt: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          web: Inttegro.Invoices.OrderDocumentFormat.t(),
          pdf: Inttegro.Invoices.OrderDocumentFormat.t(),
          receipt: Inttegro.Invoices.OrderDocumentFormat.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      web: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.fetch!(map, "web")),
      pdf: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.fetch!(map, "pdf")),
      receipt:
        if(is_nil(Map.get(map, "receipt")),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentFormat.from_map(Map.get(map, "receipt"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "web" => Inttegro.Codec.encode(value.web),
      "pdf" => Inttegro.Codec.encode(value.pdf),
      "receipt" => if(is_nil(value.receipt), do: nil, else: Inttegro.Codec.encode(value.receipt))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
