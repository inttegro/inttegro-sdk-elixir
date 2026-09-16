# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Chimes.EmailSchemaKind do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :gmail_view_action | :schema_org_order | :schema_org_invoice | String.t()
  @values %{
    gmail_view_action: "gmail_view_action",
    schema_org_order: "schema_org_order",
    schema_org_invoice: "schema_org_invoice"
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

defmodule Inttegro.Chimes.RecipientType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :phone | :email | String.t()
  @values %{
    phone: "phone",
    email: "email"
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

defmodule Inttegro.Chimes.Transport do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :sms | :email | String.t()
  @values %{
    sms: "sms",
    email: "email"
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

defmodule Inttegro.Chimes.InlineRecipientInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Chimes.InlineRecipientInputVariant1.t()
          | Inttegro.Chimes.InlineRecipientInputVariant2.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Chimes.InlineRecipientInputVariant1,
        Inttegro.Chimes.InlineRecipientInputVariant2
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

defmodule Inttegro.Chimes.RecipientInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Chimes.InlineRecipientInputVariant1.t()
          | Inttegro.Chimes.InlineRecipientInputVariant2.t()
          | Inttegro.Chimes.SavedCustomerRecipientInput.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Chimes.InlineRecipientInputVariant1,
        Inttegro.Chimes.InlineRecipientInputVariant2,
        Inttegro.Chimes.SavedCustomerRecipientInput
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

defmodule Inttegro.Chimes.SendRequestRecipient do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Chimes.InlineRecipientInputVariant1.t()
          | Inttegro.Chimes.InlineRecipientInputVariant2.t()
          | Inttegro.Chimes.SavedCustomerRecipientInput.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Chimes.InlineRecipientInputVariant1,
        Inttegro.Chimes.InlineRecipientInputVariant2,
        Inttegro.Chimes.SavedCustomerRecipientInput
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

defmodule Inttegro.Chimes.BroadcastCreationDetail do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:content, :created_at, :id, :recipients, :send_after, :sender_id]
  defstruct content: nil,
            created_at: nil,
            customer_ids: nil,
            email: nil,
            id: nil,
            idempotency_key: nil,
            purpose: nil,
            recipients: nil,
            send_after: nil,
            sender_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          content: String.t(),
          created_at: DateTime.t(),
          customer_ids: [String.t()] | nil,
          email: Inttegro.Chimes.EmailMessage.t() | nil,
          id: String.t(),
          idempotency_key: String.t() | nil,
          purpose: String.t() | nil,
          recipients: [String.t()],
          send_after: DateTime.t(),
          sender_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      content: Map.fetch!(map, "content"),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      customer_ids:
        if(is_nil(Map.get(map, "customer_ids")),
          do: nil,
          else: Enum.map(Map.get(map, "customer_ids"), fn item -> item end)
        ),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.EmailMessage.from_map(Map.get(map, "email"))
        ),
      id: Map.fetch!(map, "id"),
      idempotency_key:
        if(is_nil(Map.get(map, "idempotency_key")),
          do: nil,
          else: Map.get(map, "idempotency_key")
        ),
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      recipients: Enum.map(Map.fetch!(map, "recipients"), fn item -> item end),
      send_after: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "send_after")),
      sender_id: Map.fetch!(map, "sender_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "content" => Inttegro.Codec.encode(value.content),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "customer_ids" =>
        if(is_nil(value.customer_ids),
          do: nil,
          else: Enum.map(value.customer_ids, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "id" => Inttegro.Codec.encode(value.id),
      "idempotency_key" =>
        if(is_nil(value.idempotency_key),
          do: nil,
          else: Inttegro.Codec.encode(value.idempotency_key)
        ),
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "recipients" => Enum.map(value.recipients, fn item -> Inttegro.Codec.encode(item) end),
      "send_after" => Inttegro.Codec.encode(value.send_after),
      "sender_id" => Inttegro.Codec.encode(value.sender_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.BroadcastRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:recipients]
  defstruct request_meta: nil,
            message_template: nil,
            email: nil,
            purpose: nil,
            sender: nil,
            recipients: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          request_meta: Inttegro.Broadcasts.RequestMeta.t() | nil,
          message_template: Inttegro.MessageTemplates.BroadcastRequest.t() | nil,
          email: Inttegro.Chimes.EmailMessageInput.t() | nil,
          purpose: String.t() | nil,
          sender: String.t() | nil,
          recipients: [term()]
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
          else: Inttegro.Broadcasts.RequestMeta.from_map(Map.get(map, "request_meta"))
        ),
      message_template:
        if(is_nil(Map.get(map, "message_template")),
          do: nil,
          else:
            Inttegro.MessageTemplates.BroadcastRequest.decode(Map.get(map, "message_template"))
        ),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.EmailMessageInput.from_map(Map.get(map, "email"))
        ),
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      sender: if(is_nil(Map.get(map, "sender")), do: nil, else: Map.get(map, "sender")),
      recipients: Enum.map(Map.fetch!(map, "recipients"), fn item -> item end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "message_template" =>
        if(is_nil(value.message_template),
          do: nil,
          else: Inttegro.Codec.encode(value.message_template)
        ),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "sender" => if(is_nil(value.sender), do: nil, else: Inttegro.Codec.encode(value.sender)),
      "recipients" => Enum.map(value.recipients, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.Chime do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:created_at, :full_message, :id, :recipient, :sender_id]
  defstruct created_at: nil,
            custom_data: nil,
            customer_id: nil,
            email: nil,
            full_message: nil,
            id: nil,
            idempotency_key: nil,
            purpose: nil,
            recipient: nil,
            sender_id: nil,
            transmission: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          custom_data: Inttegro.CustomData.t() | nil,
          customer_id: String.t() | nil,
          email: Inttegro.Chimes.EmailMessage.t() | nil,
          full_message: String.t(),
          id: String.t(),
          idempotency_key: String.t() | nil,
          purpose: String.t() | nil,
          recipient: Inttegro.Chimes.Recipient.t(),
          sender_id: String.t(),
          transmission: Inttegro.Chimes.Transmission.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      customer_id:
        if(is_nil(Map.get(map, "customer_id")), do: nil, else: Map.get(map, "customer_id")),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.EmailMessage.from_map(Map.get(map, "email"))
        ),
      full_message: Map.fetch!(map, "full_message"),
      id: Map.fetch!(map, "id"),
      idempotency_key:
        if(is_nil(Map.get(map, "idempotency_key")),
          do: nil,
          else: Map.get(map, "idempotency_key")
        ),
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      recipient: Inttegro.Chimes.Recipient.from_map(Map.fetch!(map, "recipient")),
      sender_id: Map.fetch!(map, "sender_id"),
      transmission:
        if(is_nil(Map.get(map, "transmission")),
          do: nil,
          else: Inttegro.Chimes.Transmission.from_map(Map.get(map, "transmission"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "customer_id" =>
        if(is_nil(value.customer_id), do: nil, else: Inttegro.Codec.encode(value.customer_id)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "full_message" => Inttegro.Codec.encode(value.full_message),
      "id" => Inttegro.Codec.encode(value.id),
      "idempotency_key" =>
        if(is_nil(value.idempotency_key),
          do: nil,
          else: Inttegro.Codec.encode(value.idempotency_key)
        ),
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "recipient" => Inttegro.Codec.encode(value.recipient),
      "sender_id" => Inttegro.Codec.encode(value.sender_id),
      "transmission" =>
        if(is_nil(value.transmission), do: nil, else: Inttegro.Codec.encode(value.transmission))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.EmailEvent do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :occurred_at, :provider, :provider_message_id, :type]
  defstruct bounce_sub_type: nil,
            bounce_type: nil,
            complaint_sub_type: nil,
            id: nil,
            occurred_at: nil,
            provider: nil,
            provider_message_id: nil,
            reason: nil,
            reason_code: nil,
            recipient: nil,
            source: nil,
            suppress_recipient: nil,
            temporary: nil,
            type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          bounce_sub_type: String.t() | nil,
          bounce_type: String.t() | nil,
          complaint_sub_type: String.t() | nil,
          id: String.t(),
          occurred_at: DateTime.t(),
          provider: String.t(),
          provider_message_id: String.t(),
          reason: String.t() | nil,
          reason_code: String.t() | nil,
          recipient: String.t() | nil,
          source: String.t() | nil,
          suppress_recipient: boolean() | nil,
          temporary: boolean() | nil,
          type: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      bounce_sub_type:
        if(is_nil(Map.get(map, "bounce_sub_type")),
          do: nil,
          else: Map.get(map, "bounce_sub_type")
        ),
      bounce_type:
        if(is_nil(Map.get(map, "bounce_type")), do: nil, else: Map.get(map, "bounce_type")),
      complaint_sub_type:
        if(is_nil(Map.get(map, "complaint_sub_type")),
          do: nil,
          else: Map.get(map, "complaint_sub_type")
        ),
      id: Map.fetch!(map, "id"),
      occurred_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "occurred_at")),
      provider: Map.fetch!(map, "provider"),
      provider_message_id: Map.fetch!(map, "provider_message_id"),
      reason: if(is_nil(Map.get(map, "reason")), do: nil, else: Map.get(map, "reason")),
      reason_code:
        if(is_nil(Map.get(map, "reason_code")), do: nil, else: Map.get(map, "reason_code")),
      recipient: if(is_nil(Map.get(map, "recipient")), do: nil, else: Map.get(map, "recipient")),
      source: if(is_nil(Map.get(map, "source")), do: nil, else: Map.get(map, "source")),
      suppress_recipient:
        if(is_nil(Map.get(map, "suppress_recipient")),
          do: nil,
          else: Map.get(map, "suppress_recipient")
        ),
      temporary: if(is_nil(Map.get(map, "temporary")), do: nil, else: Map.get(map, "temporary")),
      type: Map.fetch!(map, "type")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bounce_sub_type" =>
        if(is_nil(value.bounce_sub_type),
          do: nil,
          else: Inttegro.Codec.encode(value.bounce_sub_type)
        ),
      "bounce_type" =>
        if(is_nil(value.bounce_type), do: nil, else: Inttegro.Codec.encode(value.bounce_type)),
      "complaint_sub_type" =>
        if(is_nil(value.complaint_sub_type),
          do: nil,
          else: Inttegro.Codec.encode(value.complaint_sub_type)
        ),
      "id" => Inttegro.Codec.encode(value.id),
      "occurred_at" => Inttegro.Codec.encode(value.occurred_at),
      "provider" => Inttegro.Codec.encode(value.provider),
      "provider_message_id" => Inttegro.Codec.encode(value.provider_message_id),
      "reason" => if(is_nil(value.reason), do: nil, else: Inttegro.Codec.encode(value.reason)),
      "reason_code" =>
        if(is_nil(value.reason_code), do: nil, else: Inttegro.Codec.encode(value.reason_code)),
      "recipient" =>
        if(is_nil(value.recipient), do: nil, else: Inttegro.Codec.encode(value.recipient)),
      "source" => if(is_nil(value.source), do: nil, else: Inttegro.Codec.encode(value.source)),
      "suppress_recipient" =>
        if(is_nil(value.suppress_recipient),
          do: nil,
          else: Inttegro.Codec.encode(value.suppress_recipient)
        ),
      "temporary" =>
        if(is_nil(value.temporary), do: nil, else: Inttegro.Codec.encode(value.temporary)),
      "type" => Inttegro.Codec.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.EmailMailbox do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct name: nil, address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          address: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      address: if(is_nil(Map.get(map, "address")), do: nil, else: Map.get(map, "address"))
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

defmodule Inttegro.Chimes.EmailMailboxInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct name: nil, address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          address: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      address: if(is_nil(Map.get(map, "address")), do: nil, else: Map.get(map, "address"))
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

defmodule Inttegro.Chimes.EmailMessage do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct subject: nil,
            text: nil,
            html: nil,
            from_: nil,
            reply_to: nil,
            headers: nil,
            safety: nil,
            schema: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          subject: String.t() | nil,
          text: String.t() | nil,
          html: String.t() | nil,
          from_: Inttegro.Chimes.EmailMailbox.t() | nil,
          reply_to: Inttegro.Chimes.EmailMailbox.t() | nil,
          headers: %{optional(String.t()) => String.t()} | nil,
          safety: Inttegro.Chimes.EmailSafetyResult.t() | nil,
          schema: Inttegro.Chimes.EmailSchemaMarkup.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      subject: if(is_nil(Map.get(map, "subject")), do: nil, else: Map.get(map, "subject")),
      text: if(is_nil(Map.get(map, "text")), do: nil, else: Map.get(map, "text")),
      html: if(is_nil(Map.get(map, "html")), do: nil, else: Map.get(map, "html")),
      from_:
        if(is_nil(Map.get(map, "from")),
          do: nil,
          else: Inttegro.Chimes.EmailMailbox.from_map(Map.get(map, "from"))
        ),
      reply_to:
        if(is_nil(Map.get(map, "reply_to")),
          do: nil,
          else: Inttegro.Chimes.EmailMailbox.from_map(Map.get(map, "reply_to"))
        ),
      headers:
        if(is_nil(Map.get(map, "headers")),
          do: nil,
          else: Map.new(Map.get(map, "headers"), fn {key, value} -> {key, value} end)
        ),
      safety:
        if(is_nil(Map.get(map, "safety")),
          do: nil,
          else: Inttegro.Chimes.EmailSafetyResult.from_map(Map.get(map, "safety"))
        ),
      schema:
        if(is_nil(Map.get(map, "schema")),
          do: nil,
          else: Inttegro.Chimes.EmailSchemaMarkup.from_map(Map.get(map, "schema"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "subject" => if(is_nil(value.subject), do: nil, else: Inttegro.Codec.encode(value.subject)),
      "text" => if(is_nil(value.text), do: nil, else: Inttegro.Codec.encode(value.text)),
      "html" => if(is_nil(value.html), do: nil, else: Inttegro.Codec.encode(value.html)),
      "from" => if(is_nil(value.from_), do: nil, else: Inttegro.Codec.encode(value.from_)),
      "reply_to" =>
        if(is_nil(value.reply_to), do: nil, else: Inttegro.Codec.encode(value.reply_to)),
      "headers" =>
        if(is_nil(value.headers),
          do: nil,
          else:
            Map.new(value.headers, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "safety" => if(is_nil(value.safety), do: nil, else: Inttegro.Codec.encode(value.safety)),
      "schema" => if(is_nil(value.schema), do: nil, else: Inttegro.Codec.encode(value.schema))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.EmailMessageInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:subject, :text, :from_]
  defstruct html: nil, reply_to: nil, headers: nil, subject: nil, text: nil, from_: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          html: String.t() | nil,
          reply_to: String.t() | nil,
          headers: %{optional(String.t()) => String.t()} | nil,
          subject: String.t(),
          text: String.t(),
          from_: Inttegro.Chimes.EmailMailboxInput.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      html: if(is_nil(Map.get(map, "html")), do: nil, else: Map.get(map, "html")),
      reply_to: if(is_nil(Map.get(map, "reply_to")), do: nil, else: Map.get(map, "reply_to")),
      headers:
        if(is_nil(Map.get(map, "headers")),
          do: nil,
          else: Map.new(Map.get(map, "headers"), fn {key, value} -> {key, value} end)
        ),
      subject: Map.fetch!(map, "subject"),
      text: Map.fetch!(map, "text"),
      from_: Inttegro.Chimes.EmailMailboxInput.from_map(Map.fetch!(map, "from"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "html" => if(is_nil(value.html), do: nil, else: Inttegro.Codec.encode(value.html)),
      "reply_to" =>
        if(is_nil(value.reply_to), do: nil, else: Inttegro.Codec.encode(value.reply_to)),
      "headers" =>
        if(is_nil(value.headers),
          do: nil,
          else:
            Map.new(value.headers, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "subject" => Inttegro.Codec.encode(value.subject),
      "text" => Inttegro.Codec.encode(value.text),
      "from" => Inttegro.Codec.encode(value.from_)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.EmailSafetyResult do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct status: nil,
            reason_codes: nil,
            sanitized_html: nil,
            normalized_text: nil,
            links: nil,
            scanner: nil,
            content_hash: nil,
            quarantine_notes: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          status: Inttegro.MessageTemplates.ContentSafetyStatus.t() | nil,
          reason_codes: [String.t()] | nil,
          sanitized_html: String.t() | nil,
          normalized_text: String.t() | nil,
          links: [Inttegro.Chimes.EmailScannedLink.t()] | nil,
          scanner: String.t() | nil,
          content_hash: String.t() | nil,
          quarantine_notes: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      status:
        if(is_nil(Map.get(map, "status")),
          do: nil,
          else: Inttegro.MessageTemplates.ContentSafetyStatus.decode(Map.get(map, "status"))
        ),
      reason_codes:
        if(is_nil(Map.get(map, "reason_codes")),
          do: nil,
          else: Enum.map(Map.get(map, "reason_codes"), fn item -> item end)
        ),
      sanitized_html:
        if(is_nil(Map.get(map, "sanitized_html")), do: nil, else: Map.get(map, "sanitized_html")),
      normalized_text:
        if(is_nil(Map.get(map, "normalized_text")),
          do: nil,
          else: Map.get(map, "normalized_text")
        ),
      links:
        if(is_nil(Map.get(map, "links")),
          do: nil,
          else:
            Enum.map(Map.get(map, "links"), fn item ->
              Inttegro.Chimes.EmailScannedLink.from_map(item)
            end)
        ),
      scanner: if(is_nil(Map.get(map, "scanner")), do: nil, else: Map.get(map, "scanner")),
      content_hash:
        if(is_nil(Map.get(map, "content_hash")), do: nil, else: Map.get(map, "content_hash")),
      quarantine_notes:
        if(is_nil(Map.get(map, "quarantine_notes")),
          do: nil,
          else: Map.get(map, "quarantine_notes")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "status" =>
        if(is_nil(value.status),
          do: nil,
          else: Inttegro.MessageTemplates.ContentSafetyStatus.encode(value.status)
        ),
      "reason_codes" =>
        if(is_nil(value.reason_codes),
          do: nil,
          else: Enum.map(value.reason_codes, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "sanitized_html" =>
        if(is_nil(value.sanitized_html),
          do: nil,
          else: Inttegro.Codec.encode(value.sanitized_html)
        ),
      "normalized_text" =>
        if(is_nil(value.normalized_text),
          do: nil,
          else: Inttegro.Codec.encode(value.normalized_text)
        ),
      "links" =>
        if(is_nil(value.links),
          do: nil,
          else: Enum.map(value.links, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "scanner" => if(is_nil(value.scanner), do: nil, else: Inttegro.Codec.encode(value.scanner)),
      "content_hash" =>
        if(is_nil(value.content_hash), do: nil, else: Inttegro.Codec.encode(value.content_hash)),
      "quarantine_notes" =>
        if(is_nil(value.quarantine_notes),
          do: nil,
          else: Inttegro.Codec.encode(value.quarantine_notes)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.EmailScannedLink do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct raw: nil, scheme: nil, host: nil, status: nil, reason: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          raw: String.t() | nil,
          scheme: String.t() | nil,
          host: String.t() | nil,
          status: Inttegro.MessageTemplates.ContentSafetyStatus.t() | nil,
          reason: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      raw: if(is_nil(Map.get(map, "raw")), do: nil, else: Map.get(map, "raw")),
      scheme: if(is_nil(Map.get(map, "scheme")), do: nil, else: Map.get(map, "scheme")),
      host: if(is_nil(Map.get(map, "host")), do: nil, else: Map.get(map, "host")),
      status:
        if(is_nil(Map.get(map, "status")),
          do: nil,
          else: Inttegro.MessageTemplates.ContentSafetyStatus.decode(Map.get(map, "status"))
        ),
      reason: if(is_nil(Map.get(map, "reason")), do: nil, else: Map.get(map, "reason"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "raw" => if(is_nil(value.raw), do: nil, else: Inttegro.Codec.encode(value.raw)),
      "scheme" => if(is_nil(value.scheme), do: nil, else: Inttegro.Codec.encode(value.scheme)),
      "host" => if(is_nil(value.host), do: nil, else: Inttegro.Codec.encode(value.host)),
      "status" =>
        if(is_nil(value.status),
          do: nil,
          else: Inttegro.MessageTemplates.ContentSafetyStatus.encode(value.status)
        ),
      "reason" => if(is_nil(value.reason), do: nil, else: Inttegro.Codec.encode(value.reason))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.EmailSchemaMarkup do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct kind: nil, json_ld: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          kind: Inttegro.Chimes.EmailSchemaKind.t() | nil,
          json_ld: %{optional(String.t()) => term()} | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      kind:
        if(is_nil(Map.get(map, "kind")),
          do: nil,
          else: Inttegro.Chimes.EmailSchemaKind.decode(Map.get(map, "kind"))
        ),
      json_ld:
        if(is_nil(Map.get(map, "json_ld")),
          do: nil,
          else: Map.new(Map.get(map, "json_ld"), fn {key, value} -> {key, value} end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "kind" =>
        if(is_nil(value.kind),
          do: nil,
          else: Inttegro.Chimes.EmailSchemaKind.encode(value.kind)
        ),
      "json_ld" =>
        if(is_nil(value.json_ld),
          do: nil,
          else:
            Map.new(value.json_ld, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.InlineRecipientInputVariant1 do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:phone, :type]
  defstruct name: nil, phone: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          phone: Inttegro.Chimes.InlineRecipientInputVariant1Phone.t(),
          type: Inttegro.Chimes.RecipientType.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone: Inttegro.Chimes.InlineRecipientInputVariant1Phone.from_map(Map.fetch!(map, "phone")),
      type: Inttegro.Chimes.RecipientType.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone" => Inttegro.Codec.encode(value.phone),
      "type" => Inttegro.Chimes.RecipientType.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.InlineRecipientInputVariant1Phone do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:number]
  defstruct number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          number: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: Map.fetch!(map, "number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.InlineRecipientInputVariant2 do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:email, :type]
  defstruct name: nil, email: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          email: Inttegro.Chimes.InlineRecipientInputVariant2Email.t(),
          type: Inttegro.Chimes.RecipientType.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      email: Inttegro.Chimes.InlineRecipientInputVariant2Email.from_map(Map.fetch!(map, "email")),
      type: Inttegro.Chimes.RecipientType.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "email" => Inttegro.Codec.encode(value.email),
      "type" => Inttegro.Chimes.RecipientType.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.InlineRecipientInputVariant2Email do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:address]
  defstruct address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          address: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address: Map.fetch!(map, "address")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "address" => Inttegro.Codec.encode(value.address)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size, :chimes]
  defstruct number: nil, size: nil, chimes: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          chimes: [Inttegro.Chimes.Chime.t()]
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
      chimes:
        Enum.map(Map.fetch!(map, "chimes"), fn item -> Inttegro.Chimes.Chime.from_map(item) end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "chimes" => Enum.map(value.chimes, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.Recipient do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct type: nil, name: nil, phone: nil, email: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: Inttegro.Chimes.RecipientType.t(),
          name: String.t() | nil,
          phone: Inttegro.Chimes.RecipientPhone.t() | nil,
          email: Inttegro.Chimes.RecipientEmail.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Chimes.RecipientType.decode(Map.fetch!(map, "type")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone:
        if(is_nil(Map.get(map, "phone")),
          do: nil,
          else: Inttegro.Chimes.RecipientPhone.from_map(Map.get(map, "phone"))
        ),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.RecipientEmail.from_map(Map.get(map, "email"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Chimes.RecipientType.encode(value.type),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone" => if(is_nil(value.phone), do: nil, else: Inttegro.Codec.encode(value.phone)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.RecipientEmail do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:address]
  defstruct address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          address: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address: Map.fetch!(map, "address")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "address" => Inttegro.Codec.encode(value.address)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.RecipientPhone do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number]
  defstruct number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: Map.fetch!(map, "number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.SavedCustomerRecipientInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:customer_id, :transport]
  defstruct customer_id: nil, transport: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          customer_id: String.t(),
          transport: Inttegro.Chimes.Transport.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      customer_id: Map.fetch!(map, "customer_id"),
      transport: Inttegro.Chimes.Transport.decode(Map.fetch!(map, "transport"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "customer_id" => Inttegro.Codec.encode(value.customer_id),
      "transport" => Inttegro.Chimes.Transport.encode(value.transport)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.Transmission do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:address, :created_at, :gateway, :id, :initialized_at, :mechanism, :status]
  defstruct address: nil,
            created_at: nil,
            delivered_at: nil,
            email_events: nil,
            email_failure_code: nil,
            email_failure_reason: nil,
            email_status: nil,
            error: nil,
            failed_at: nil,
            gateway: nil,
            gateway_message_id: nil,
            id: nil,
            initialized_at: nil,
            last_email_event_at: nil,
            mechanism: nil,
            sent_at: nil,
            sent_via: nil,
            status: nil,
            suppressed_at: nil,
            suppression_reason: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          address: String.t(),
          created_at: DateTime.t(),
          delivered_at: DateTime.t() | nil,
          email_events: [Inttegro.Chimes.EmailEvent.t()] | nil,
          email_failure_code: String.t() | nil,
          email_failure_reason: String.t() | nil,
          email_status: String.t() | nil,
          error: String.t() | nil,
          failed_at: DateTime.t() | nil,
          gateway: String.t(),
          gateway_message_id: String.t() | nil,
          id: String.t(),
          initialized_at: DateTime.t(),
          last_email_event_at: DateTime.t() | nil,
          mechanism: Inttegro.Chimes.Transport.t(),
          sent_at: DateTime.t() | nil,
          sent_via: Inttegro.Chimes.Transport.t() | nil,
          status: String.t(),
          suppressed_at: DateTime.t() | nil,
          suppression_reason: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address: Map.fetch!(map, "address"),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      delivered_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "delivered_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "delivered_at"))
        ),
      email_events:
        if(is_nil(Map.get(map, "email_events")),
          do: nil,
          else:
            Enum.map(Map.get(map, "email_events"), fn item ->
              Inttegro.Chimes.EmailEvent.from_map(item)
            end)
        ),
      email_failure_code:
        if(is_nil(Map.get(map, "email_failure_code")),
          do: nil,
          else: Map.get(map, "email_failure_code")
        ),
      email_failure_reason:
        if(is_nil(Map.get(map, "email_failure_reason")),
          do: nil,
          else: Map.get(map, "email_failure_reason")
        ),
      email_status:
        if(is_nil(Map.get(map, "email_status")), do: nil, else: Map.get(map, "email_status")),
      error: if(is_nil(Map.get(map, "error")), do: nil, else: Map.get(map, "error")),
      failed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "failed_at"))
        ),
      gateway: Map.fetch!(map, "gateway"),
      gateway_message_id:
        if(is_nil(Map.get(map, "gateway_message_id")),
          do: nil,
          else: Map.get(map, "gateway_message_id")
        ),
      id: Map.fetch!(map, "id"),
      initialized_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initialized_at")),
      last_email_event_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "last_email_event_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "last_email_event_at"))
        ),
      mechanism: Inttegro.Chimes.Transport.decode(Map.fetch!(map, "mechanism")),
      sent_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "sent_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "sent_at"))
        ),
      sent_via:
        if(is_nil(Map.get(map, "sent_via")),
          do: nil,
          else: Inttegro.Chimes.Transport.decode(Map.get(map, "sent_via"))
        ),
      status: Map.fetch!(map, "status"),
      suppressed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "suppressed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "suppressed_at"))
        ),
      suppression_reason:
        if(is_nil(Map.get(map, "suppression_reason")),
          do: nil,
          else: Map.get(map, "suppression_reason")
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "address" => Inttegro.Codec.encode(value.address),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "delivered_at" =>
        if(is_nil(value.delivered_at), do: nil, else: Inttegro.Codec.encode(value.delivered_at)),
      "email_events" =>
        if(is_nil(value.email_events),
          do: nil,
          else: Enum.map(value.email_events, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "email_failure_code" =>
        if(is_nil(value.email_failure_code),
          do: nil,
          else: Inttegro.Codec.encode(value.email_failure_code)
        ),
      "email_failure_reason" =>
        if(is_nil(value.email_failure_reason),
          do: nil,
          else: Inttegro.Codec.encode(value.email_failure_reason)
        ),
      "email_status" =>
        if(is_nil(value.email_status), do: nil, else: Inttegro.Codec.encode(value.email_status)),
      "error" => if(is_nil(value.error), do: nil, else: Inttegro.Codec.encode(value.error)),
      "failed_at" =>
        if(is_nil(value.failed_at), do: nil, else: Inttegro.Codec.encode(value.failed_at)),
      "gateway" => Inttegro.Codec.encode(value.gateway),
      "gateway_message_id" =>
        if(is_nil(value.gateway_message_id),
          do: nil,
          else: Inttegro.Codec.encode(value.gateway_message_id)
        ),
      "id" => Inttegro.Codec.encode(value.id),
      "initialized_at" => Inttegro.Codec.encode(value.initialized_at),
      "last_email_event_at" =>
        if(is_nil(value.last_email_event_at),
          do: nil,
          else: Inttegro.Codec.encode(value.last_email_event_at)
        ),
      "mechanism" => Inttegro.Chimes.Transport.encode(value.mechanism),
      "sent_at" => if(is_nil(value.sent_at), do: nil, else: Inttegro.Codec.encode(value.sent_at)),
      "sent_via" =>
        if(is_nil(value.sent_via),
          do: nil,
          else: Inttegro.Chimes.Transport.encode(value.sent_via)
        ),
      "status" => Inttegro.Codec.encode(value.status),
      "suppressed_at" =>
        if(is_nil(value.suppressed_at), do: nil, else: Inttegro.Codec.encode(value.suppressed_at)),
      "suppression_reason" =>
        if(is_nil(value.suppression_reason),
          do: nil,
          else: Inttegro.Codec.encode(value.suppression_reason)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:chime_id]
  defstruct chime_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          chime_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      chime_id: Map.fetch!(map, "chime_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "chime_id" => Inttegro.Codec.encode(value.chime_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct customer_id: nil, page_number: nil, page_size: nil, recipient: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          customer_id: String.t() | nil,
          page_number: integer() | nil,
          page_size: integer() | nil,
          recipient: String.t() | nil
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
      page_size: if(is_nil(Map.get(map, "page_size")), do: nil, else: Map.get(map, "page_size")),
      recipient: if(is_nil(Map.get(map, "recipient")), do: nil, else: Map.get(map, "recipient"))
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
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size)),
      "recipient" =>
        if(is_nil(value.recipient), do: nil, else: Inttegro.Codec.encode(value.recipient))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.ScheduleRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:recipients, :send_after]
  defstruct request_meta: nil,
            full_message: nil,
            email: nil,
            message_template: nil,
            sender_id: nil,
            purpose: nil,
            recipients: nil,
            send_after: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          request_meta: Inttegro.Chimes.ScheduleRequestMeta.t() | nil,
          full_message: String.t() | nil,
          email: Inttegro.Chimes.EmailMessageInput.t() | nil,
          message_template: Inttegro.MessageTemplates.ReferenceInput.t() | nil,
          sender_id: String.t() | nil,
          purpose: String.t() | nil,
          recipients: [term()],
          send_after: DateTime.t()
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
          else: Inttegro.Chimes.ScheduleRequestMeta.from_map(Map.get(map, "request_meta"))
        ),
      full_message:
        if(is_nil(Map.get(map, "full_message")), do: nil, else: Map.get(map, "full_message")),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.EmailMessageInput.from_map(Map.get(map, "email"))
        ),
      message_template:
        if(is_nil(Map.get(map, "message_template")),
          do: nil,
          else:
            Inttegro.MessageTemplates.ReferenceInput.from_map(Map.get(map, "message_template"))
        ),
      sender_id: if(is_nil(Map.get(map, "sender_id")), do: nil, else: Map.get(map, "sender_id")),
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      recipients: Enum.map(Map.fetch!(map, "recipients"), fn item -> item end),
      send_after: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "send_after"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "full_message" =>
        if(is_nil(value.full_message), do: nil, else: Inttegro.Codec.encode(value.full_message)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "message_template" =>
        if(is_nil(value.message_template),
          do: nil,
          else: Inttegro.Codec.encode(value.message_template)
        ),
      "sender_id" =>
        if(is_nil(value.sender_id), do: nil, else: Inttegro.Codec.encode(value.sender_id)),
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "recipients" => Enum.map(value.recipients, fn item -> Inttegro.Codec.encode(item) end),
      "send_after" => Inttegro.Codec.encode(value.send_after)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.ScheduleRequestMeta do
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

defmodule Inttegro.Chimes.ScheduleCreationDetail do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:created_at, :full_message, :id, :send_after, :sender_id]
  defstruct created_at: nil,
            customer_ids: nil,
            email: nil,
            executed_at: nil,
            full_message: nil,
            id: nil,
            idempotency_key: nil,
            purpose: nil,
            recipients: nil,
            send_after: nil,
            sender_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          customer_ids: [String.t()] | nil,
          email: Inttegro.Chimes.EmailMessage.t() | nil,
          executed_at: DateTime.t() | nil,
          full_message: String.t(),
          id: String.t(),
          idempotency_key: String.t() | nil,
          purpose: String.t() | nil,
          recipients: [String.t()] | nil,
          send_after: DateTime.t(),
          sender_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      customer_ids:
        if(is_nil(Map.get(map, "customer_ids")),
          do: nil,
          else: Enum.map(Map.get(map, "customer_ids"), fn item -> item end)
        ),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.EmailMessage.from_map(Map.get(map, "email"))
        ),
      executed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "executed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "executed_at"))
        ),
      full_message: Map.fetch!(map, "full_message"),
      id: Map.fetch!(map, "id"),
      idempotency_key:
        if(is_nil(Map.get(map, "idempotency_key")),
          do: nil,
          else: Map.get(map, "idempotency_key")
        ),
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      recipients:
        if(is_nil(Map.get(map, "recipients")),
          do: nil,
          else: Enum.map(Map.get(map, "recipients"), fn item -> item end)
        ),
      send_after: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "send_after")),
      sender_id: Map.fetch!(map, "sender_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "customer_ids" =>
        if(is_nil(value.customer_ids),
          do: nil,
          else: Enum.map(value.customer_ids, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "executed_at" =>
        if(is_nil(value.executed_at), do: nil, else: Inttegro.Codec.encode(value.executed_at)),
      "full_message" => Inttegro.Codec.encode(value.full_message),
      "id" => Inttegro.Codec.encode(value.id),
      "idempotency_key" =>
        if(is_nil(value.idempotency_key),
          do: nil,
          else: Inttegro.Codec.encode(value.idempotency_key)
        ),
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "recipients" =>
        if(is_nil(value.recipients),
          do: nil,
          else: Enum.map(value.recipients, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "send_after" => Inttegro.Codec.encode(value.send_after),
      "sender_id" => Inttegro.Codec.encode(value.sender_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.SendRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:recipient]
  defstruct full_message: nil,
            email: nil,
            message_template: nil,
            sender_id: nil,
            purpose: nil,
            custom_data: nil,
            request_meta: nil,
            recipient: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          full_message: String.t() | nil,
          email: Inttegro.Chimes.EmailMessageInput.t() | nil,
          message_template: Inttegro.MessageTemplates.ReferenceInput.t() | nil,
          sender_id: String.t() | nil,
          purpose: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          request_meta: Inttegro.Chimes.SendRequestMeta.t() | nil,
          recipient: Inttegro.Chimes.SendRequestRecipient.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      full_message:
        if(is_nil(Map.get(map, "full_message")), do: nil, else: Map.get(map, "full_message")),
      email:
        if(is_nil(Map.get(map, "email")),
          do: nil,
          else: Inttegro.Chimes.EmailMessageInput.from_map(Map.get(map, "email"))
        ),
      message_template:
        if(is_nil(Map.get(map, "message_template")),
          do: nil,
          else:
            Inttegro.MessageTemplates.ReferenceInput.from_map(Map.get(map, "message_template"))
        ),
      sender_id: if(is_nil(Map.get(map, "sender_id")), do: nil, else: Map.get(map, "sender_id")),
      purpose: if(is_nil(Map.get(map, "purpose")), do: nil, else: Map.get(map, "purpose")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      request_meta:
        if(is_nil(Map.get(map, "request_meta")),
          do: nil,
          else: Inttegro.Chimes.SendRequestMeta.from_map(Map.get(map, "request_meta"))
        ),
      recipient: Inttegro.Chimes.SendRequestRecipient.decode(Map.fetch!(map, "recipient"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "full_message" =>
        if(is_nil(value.full_message), do: nil, else: Inttegro.Codec.encode(value.full_message)),
      "email" => if(is_nil(value.email), do: nil, else: Inttegro.Codec.encode(value.email)),
      "message_template" =>
        if(is_nil(value.message_template),
          do: nil,
          else: Inttegro.Codec.encode(value.message_template)
        ),
      "sender_id" =>
        if(is_nil(value.sender_id), do: nil, else: Inttegro.Codec.encode(value.sender_id)),
      "purpose" => if(is_nil(value.purpose), do: nil, else: Inttegro.Codec.encode(value.purpose)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "recipient" => Inttegro.Codec.encode(value.recipient)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Chimes.SendRequestMeta do
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
