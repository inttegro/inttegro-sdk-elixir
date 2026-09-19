# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Otp.AlphabetType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :numeric | :alpha | :alphanumeric | String.t()
  @values %{
    numeric: "numeric",
    alpha: "alpha",
    alphanumeric: "alphanumeric"
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

defmodule Inttegro.Otp.Purpose do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :account_creation
          | :account_recovery
          | :email_verification
          | :financial_account_verification
          | :password_reset
          | :payment_confirmation
          | :payment_method_verification
          | :payout_confirmation
          | :phone_verification
          | :sensitive_action
          | :sign_in
          | :transaction_confirmation
          | :unspecified
          | String.t()
  @values %{
    account_creation: "account_creation",
    account_recovery: "account_recovery",
    email_verification: "email_verification",
    financial_account_verification: "financial_account_verification",
    password_reset: "password_reset",
    payment_confirmation: "payment_confirmation",
    payment_method_verification: "payment_method_verification",
    payout_confirmation: "payout_confirmation",
    phone_verification: "phone_verification",
    sensitive_action: "sensitive_action",
    sign_in: "sign_in",
    transaction_confirmation: "transaction_confirmation",
    unspecified: "unspecified"
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

defmodule Inttegro.Otp.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :canceled
          | :expired
          | :pending
          | :pending_delivery
          | :pending_verification
          | :verified
          | String.t()
  @values %{
    canceled: "canceled",
    expired: "expired",
    pending: "pending",
    pending_delivery: "pending_delivery",
    pending_verification: "pending_verification",
    verified: "verified"
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

defmodule Inttegro.Otp.TransmissionStatus do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :delivered | :failed | :submitted | String.t()
  @values %{
    delivered: "delivered",
    failed: "failed",
    submitted: "submitted"
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

defmodule Inttegro.Otp.VerificationVerdict do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :fail | :pass | String.t()
  @values %{
    fail: "fail",
    pass: "pass"
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

defmodule Inttegro.Otp.InitiateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:recipient, :service_name, :token_size]
  defstruct async_delivery: nil,
            message_template: nil,
            purpose: nil,
            sender: nil,
            token_alphabet: nil,
            token_alphabet_type: nil,
            validity_duration_in_minutes: nil,
            recipient: nil,
            service_name: nil,
            token_size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          async_delivery: boolean() | nil,
          message_template: String.t() | nil,
          purpose: Inttegro.Otp.Purpose.t(),
          sender: String.t() | nil,
          token_alphabet: String.t() | nil,
          token_alphabet_type: Inttegro.Otp.AlphabetType.t() | nil,
          validity_duration_in_minutes: integer() | nil,
          recipient: String.t(),
          service_name: String.t(),
          token_size: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      async_delivery:
        if(is_nil(Map.get(map, "async_delivery")), do: nil, else: Map.get(map, "async_delivery")),
      message_template:
        if(is_nil(Map.get(map, "message_template")),
          do: nil,
          else: Map.get(map, "message_template")
        ),
      purpose: Inttegro.Otp.Purpose.decode(Map.fetch!(map, "purpose")),
      sender: if(is_nil(Map.get(map, "sender")), do: nil, else: Map.get(map, "sender")),
      token_alphabet:
        if(is_nil(Map.get(map, "token_alphabet")), do: nil, else: Map.get(map, "token_alphabet")),
      token_alphabet_type:
        if(is_nil(Map.get(map, "token_alphabet_type")),
          do: nil,
          else: Inttegro.Otp.AlphabetType.decode(Map.get(map, "token_alphabet_type"))
        ),
      validity_duration_in_minutes:
        if(is_nil(Map.get(map, "validity_duration_in_minutes")),
          do: nil,
          else: Map.get(map, "validity_duration_in_minutes")
        ),
      recipient: Map.fetch!(map, "recipient"),
      service_name: Map.fetch!(map, "service_name"),
      token_size: Map.fetch!(map, "token_size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "async_delivery" =>
        if(is_nil(value.async_delivery),
          do: nil,
          else: Inttegro.Codec.encode(value.async_delivery)
        ),
      "message_template" =>
        if(is_nil(value.message_template),
          do: nil,
          else: Inttegro.Codec.encode(value.message_template)
        ),
      "purpose" => Inttegro.Otp.Purpose.encode(value.purpose),
      "sender" => if(is_nil(value.sender), do: nil, else: Inttegro.Codec.encode(value.sender)),
      "token_alphabet" =>
        if(is_nil(value.token_alphabet),
          do: nil,
          else: Inttegro.Codec.encode(value.token_alphabet)
        ),
      "token_alphabet_type" =>
        if(is_nil(value.token_alphabet_type),
          do: nil,
          else: Inttegro.Otp.AlphabetType.encode(value.token_alphabet_type)
        ),
      "validity_duration_in_minutes" =>
        if(is_nil(value.validity_duration_in_minutes),
          do: nil,
          else: Inttegro.Codec.encode(value.validity_duration_in_minutes)
        ),
      "recipient" => Inttegro.Codec.encode(value.recipient),
      "service_name" => Inttegro.Codec.encode(value.service_name),
      "token_size" => Inttegro.Codec.encode(value.token_size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:transaction_id]
  defstruct transaction_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          transaction_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      transaction_id: Map.fetch!(map, "transaction_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "transaction_id" => Inttegro.Codec.encode(value.transaction_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.Transaction do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:expires_at, :full_message, :id, :initiated_at, :status]
  defstruct cancel_reason: nil,
            canceled_at: nil,
            expires_at: nil,
            full_message: nil,
            id: nil,
            initiated_at: nil,
            status: nil,
            transmission: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          cancel_reason: String.t() | nil,
          canceled_at: DateTime.t() | nil,
          expires_at: DateTime.t(),
          full_message: String.t(),
          id: String.t(),
          initiated_at: DateTime.t(),
          status: Inttegro.Otp.Status.t(),
          transmission: Inttegro.Otp.Transmission.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      cancel_reason:
        if(is_nil(Map.get(map, "cancel_reason")), do: nil, else: Map.get(map, "cancel_reason")),
      canceled_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "canceled_at"))
        ),
      expires_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "expires_at")),
      full_message: Map.fetch!(map, "full_message"),
      id: Map.fetch!(map, "id"),
      initiated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initiated_at")),
      status: Inttegro.Otp.Status.decode(Map.fetch!(map, "status")),
      transmission:
        if(is_nil(Map.get(map, "transmission")),
          do: nil,
          else: Inttegro.Otp.Transmission.from_map(Map.get(map, "transmission"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "cancel_reason" =>
        if(is_nil(value.cancel_reason), do: nil, else: Inttegro.Codec.encode(value.cancel_reason)),
      "canceled_at" =>
        if(is_nil(value.canceled_at), do: nil, else: Inttegro.Codec.encode(value.canceled_at)),
      "expires_at" => Inttegro.Codec.encode(value.expires_at),
      "full_message" => Inttegro.Codec.encode(value.full_message),
      "id" => Inttegro.Codec.encode(value.id),
      "initiated_at" => Inttegro.Codec.encode(value.initiated_at),
      "status" => Inttegro.Otp.Status.encode(value.status),
      "transmission" =>
        if(is_nil(value.transmission), do: nil, else: Inttegro.Codec.encode(value.transmission))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.Transmission do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:recipient, :sender_id]
  defstruct recipient: nil, sender_id: nil, sent_at: nil, sent_via: nil, status: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          recipient: String.t(),
          sender_id: String.t(),
          sent_at: DateTime.t() | nil,
          sent_via: String.t() | nil,
          status: Inttegro.Otp.TransmissionStatus.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      recipient: Map.fetch!(map, "recipient"),
      sender_id: Map.fetch!(map, "sender_id"),
      sent_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "sent_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "sent_at"))
        ),
      sent_via: if(is_nil(Map.get(map, "sent_via")), do: nil, else: Map.get(map, "sent_via")),
      status:
        if(is_nil(Map.get(map, "status")),
          do: nil,
          else: Inttegro.Otp.TransmissionStatus.decode(Map.get(map, "status"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "recipient" => Inttegro.Codec.encode(value.recipient),
      "sender_id" => Inttegro.Codec.encode(value.sender_id),
      "sent_at" => if(is_nil(value.sent_at), do: nil, else: Inttegro.Codec.encode(value.sent_at)),
      "sent_via" =>
        if(is_nil(value.sent_via), do: nil, else: Inttegro.Codec.encode(value.sent_via)),
      "status" =>
        if(is_nil(value.status),
          do: nil,
          else: Inttegro.Otp.TransmissionStatus.encode(value.status)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.Verification do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:transaction, :verification_attempt]
  defstruct transaction: nil, verification_attempt: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          transaction: Inttegro.Otp.Transaction.t(),
          verification_attempt: Inttegro.Otp.VerificationAttempt.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      transaction: Inttegro.Otp.Transaction.from_map(Map.fetch!(map, "transaction")),
      verification_attempt:
        Inttegro.Otp.VerificationAttempt.from_map(Map.fetch!(map, "verification_attempt"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "transaction" => Inttegro.Codec.encode(value.transaction),
      "verification_attempt" => Inttegro.Codec.encode(value.verification_attempt)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.VerificationAttempt do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:attempted_at, :id, :presented_token, :recipient, :result]
  defstruct attempted_at: nil, id: nil, presented_token: nil, recipient: nil, result: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          attempted_at: DateTime.t(),
          id: String.t(),
          presented_token: String.t(),
          recipient: String.t(),
          result: Inttegro.Otp.VerificationAttemptResult.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      attempted_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "attempted_at")),
      id: Map.fetch!(map, "id"),
      presented_token: Map.fetch!(map, "presented_token"),
      recipient: Map.fetch!(map, "recipient"),
      result: Inttegro.Otp.VerificationAttemptResult.from_map(Map.fetch!(map, "result"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "attempted_at" => Inttegro.Codec.encode(value.attempted_at),
      "id" => Inttegro.Codec.encode(value.id),
      "presented_token" => Inttegro.Codec.encode(value.presented_token),
      "recipient" => Inttegro.Codec.encode(value.recipient),
      "result" => Inttegro.Codec.encode(value.result)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.VerificationAttemptResult do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:verdict]
  defstruct detail: nil, verdict: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          detail: String.t() | nil,
          verdict: Inttegro.Otp.VerificationVerdict.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      detail: if(is_nil(Map.get(map, "detail")), do: nil, else: Map.get(map, "detail")),
      verdict: Inttegro.Otp.VerificationVerdict.decode(Map.fetch!(map, "verdict"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "detail" => if(is_nil(value.detail), do: nil, else: Inttegro.Codec.encode(value.detail)),
      "verdict" => Inttegro.Otp.VerificationVerdict.encode(value.verdict)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Otp.VerifyRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:transaction_id, :recipient, :token]
  defstruct transaction_id: nil, recipient: nil, token: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          transaction_id: String.t(),
          recipient: String.t(),
          token: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      transaction_id: Map.fetch!(map, "transaction_id"),
      recipient: Map.fetch!(map, "recipient"),
      token: Map.fetch!(map, "token")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "transaction_id" => Inttegro.Codec.encode(value.transaction_id),
      "recipient" => Inttegro.Codec.encode(value.recipient),
      "token" => Inttegro.Codec.encode(value.token)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
