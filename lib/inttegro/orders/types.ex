# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Orders.LineItemType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :product | :fee | :shipping | String.t()
  @values %{
    product: "product",
    fee: "fee",
    shipping: "shipping"
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

defmodule Inttegro.Orders.CreatedFromResourceType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :purchase_intent | String.t()
  @values %{
    purchase_intent: "purchase_intent"
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

defmodule Inttegro.Orders.Status do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t ::
          :preparing
          | :requires_payment
          | :paid
          | :completed
          | :canceled
          | :expired
          | :unknown
          | String.t()
  @values %{
    preparing: "preparing",
    requires_payment: "requires_payment",
    paid: "paid",
    completed: "completed",
    canceled: "canceled",
    expired: "expired",
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

defmodule Inttegro.Orders.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Orders.CreateNewCustomerInput.t()
          | Inttegro.Orders.CreateExistingCustomerInput.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Orders.CreateNewCustomerInput,
        Inttegro.Orders.CreateExistingCustomerInput
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

defmodule Inttegro.Orders.LineItemInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Orders.ProductLineItemInput.t()
          | Inttegro.Orders.FeeLineItemInput.t()
          | Inttegro.Orders.ShippingLineItemInput.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Orders.ProductLineItemInput,
        Inttegro.Orders.FeeLineItemInput,
        Inttegro.Orders.ShippingLineItemInput
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

defmodule Inttegro.Orders.LineItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Orders.ProductLineItem.t()
          | Inttegro.Orders.FeeLineItem.t()
          | Inttegro.Orders.ShippingLineItem.t()
          | Inttegro.Orders.DiscountLineItem.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Orders.ProductLineItem,
        Inttegro.Orders.FeeLineItem,
        Inttegro.Orders.ShippingLineItem,
        Inttegro.Orders.DiscountLineItem
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

defmodule Inttegro.Orders.ProductLineItemInputProduct do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :union)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :union)
  @type t ::
          Inttegro.Products.InlineDetailsInput.t()
          | Inttegro.Products.CatalogWithPriceDataInput.t()
          | Inttegro.Products.CatalogWithPriceReferenceInput.t()

  @doc false
  @spec decode(term()) :: t()
  def decode(value) do
    Enum.find_value(
      [
        Inttegro.Products.InlineDetailsInput,
        Inttegro.Products.CatalogWithPriceDataInput,
        Inttegro.Products.CatalogWithPriceReferenceInput
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

defmodule Inttegro.Orders.AddressInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name, :phone_number, :line1, :town, :country]
  defstruct line2: nil,
            region: nil,
            district: nil,
            post_code: nil,
            name: nil,
            phone_number: nil,
            line1: nil,
            town: nil,
            country: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          line2: String.t() | nil,
          region: String.t() | nil,
          district: String.t() | nil,
          post_code: String.t() | nil,
          name: String.t(),
          phone_number: String.t(),
          line1: String.t(),
          town: String.t(),
          country: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      line2: if(is_nil(Map.get(map, "line2")), do: nil, else: Map.get(map, "line2")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region")),
      district: if(is_nil(Map.get(map, "district")), do: nil, else: Map.get(map, "district")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      name: Map.fetch!(map, "name"),
      phone_number: Map.fetch!(map, "phone_number"),
      line1: Map.fetch!(map, "line1"),
      town: Map.fetch!(map, "town"),
      country: Map.fetch!(map, "country")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "line2" => if(is_nil(value.line2), do: nil, else: Inttegro.Codec.encode(value.line2)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region)),
      "district" =>
        if(is_nil(value.district), do: nil, else: Inttegro.Codec.encode(value.district)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "name" => Inttegro.Codec.encode(value.name),
      "phone_number" => Inttegro.Codec.encode(value.phone_number),
      "line1" => Inttegro.Codec.encode(value.line1),
      "town" => Inttegro.Codec.encode(value.town),
      "country" => Inttegro.Codec.encode(value.country)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.BillingDetailsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name, :email_address, :phone_number]
  defstruct address: nil, name: nil, email_address: nil, phone_number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          address: Inttegro.Orders.AddressInput.t() | nil,
          name: String.t(),
          email_address: String.t(),
          phone_number: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address:
        if(is_nil(Map.get(map, "address")),
          do: nil,
          else: Inttegro.Orders.AddressInput.from_map(Map.get(map, "address"))
        ),
      name: Map.fetch!(map, "name"),
      email_address: Map.fetch!(map, "email_address"),
      phone_number: Map.fetch!(map, "phone_number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "address" => if(is_nil(value.address), do: nil, else: Inttegro.Codec.encode(value.address)),
      "name" => Inttegro.Codec.encode(value.name),
      "email_address" => Inttegro.Codec.encode(value.email_address),
      "phone_number" => Inttegro.Codec.encode(value.phone_number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CancelRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct reason: nil, execute_refund: nil, order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          reason: String.t() | nil,
          execute_refund: boolean() | nil,
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      reason: if(is_nil(Map.get(map, "reason")), do: nil, else: Map.get(map, "reason")),
      execute_refund:
        if(is_nil(Map.get(map, "execute_refund")), do: nil, else: Map.get(map, "execute_refund")),
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "reason" => if(is_nil(value.reason), do: nil, else: Inttegro.Codec.encode(value.reason)),
      "execute_refund" =>
        if(is_nil(value.execute_refund),
          do: nil,
          else: Inttegro.Codec.encode(value.execute_refund)
        ),
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CompleteRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct paid_out_of_band: nil, order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          paid_out_of_band: boolean() | nil,
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      paid_out_of_band:
        if(is_nil(Map.get(map, "paid_out_of_band")),
          do: nil,
          else: Map.get(map, "paid_out_of_band")
        ),
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "paid_out_of_band" =>
        if(is_nil(value.paid_out_of_band),
          do: nil,
          else: Inttegro.Codec.encode(value.paid_out_of_band)
        ),
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ConfirmPaymentRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id, :payment_id, :confirmation_id, :token]
  defstruct order_id: nil, payment_id: nil, confirmation_id: nil, token: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          order_id: String.t(),
          payment_id: String.t(),
          confirmation_id: String.t(),
          token: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      order_id: Map.fetch!(map, "order_id"),
      payment_id: Map.fetch!(map, "payment_id"),
      confirmation_id: Map.fetch!(map, "confirmation_id"),
      token: Map.fetch!(map, "token")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "order_id" => Inttegro.Codec.encode(value.order_id),
      "payment_id" => Inttegro.Codec.encode(value.payment_id),
      "confirmation_id" => Inttegro.Codec.encode(value.confirmation_id),
      "token" => Inttegro.Codec.encode(value.token)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CreateExistingCustomerInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:customer_id, :line_items]
  defstruct payment_method_id: nil,
            payment_method_data: nil,
            receipt_number: nil,
            statement_descriptor: nil,
            statement_descriptor_prefix: nil,
            execute_payment: nil,
            finalize: nil,
            request_meta: nil,
            checkout_settings: nil,
            invoice_settings: nil,
            payout_settings: nil,
            custom_data: nil,
            billing_details: nil,
            shipping: nil,
            customer_id: nil,
            line_items: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_id: String.t() | nil,
          payment_method_data: Inttegro.PaymentMethods.DataInput.t() | nil,
          receipt_number: String.t() | nil,
          statement_descriptor: String.t() | nil,
          statement_descriptor_prefix: String.t() | nil,
          execute_payment: boolean() | nil,
          finalize: boolean() | nil,
          request_meta: Inttegro.Orders.CreateExistingCustomerInputRequestMeta.t() | nil,
          checkout_settings:
            Inttegro.Orders.CreateExistingCustomerInputCheckoutSettings.t() | nil,
          invoice_settings: Inttegro.Invoices.SettingsInput.t() | nil,
          payout_settings: Inttegro.Orders.PayoutSettingsRequest.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          billing_details: Inttegro.Orders.BillingDetailsInput.t() | nil,
          shipping: Inttegro.Orders.ShippingInput.t() | nil,
          customer_id: String.t(),
          line_items: [Inttegro.Orders.LineItemInput.t()]
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_id:
        if(is_nil(Map.get(map, "payment_method_id")),
          do: nil,
          else: Map.get(map, "payment_method_id")
        ),
      payment_method_data:
        if(is_nil(Map.get(map, "payment_method_data")),
          do: nil,
          else: Inttegro.PaymentMethods.DataInput.from_map(Map.get(map, "payment_method_data"))
        ),
      receipt_number:
        if(is_nil(Map.get(map, "receipt_number")), do: nil, else: Map.get(map, "receipt_number")),
      statement_descriptor:
        if(is_nil(Map.get(map, "statement_descriptor")),
          do: nil,
          else: Map.get(map, "statement_descriptor")
        ),
      statement_descriptor_prefix:
        if(is_nil(Map.get(map, "statement_descriptor_prefix")),
          do: nil,
          else: Map.get(map, "statement_descriptor_prefix")
        ),
      execute_payment:
        if(is_nil(Map.get(map, "execute_payment")),
          do: nil,
          else: Map.get(map, "execute_payment")
        ),
      finalize: if(is_nil(Map.get(map, "finalize")), do: nil, else: Map.get(map, "finalize")),
      request_meta:
        if(is_nil(Map.get(map, "request_meta")),
          do: nil,
          else:
            Inttegro.Orders.CreateExistingCustomerInputRequestMeta.from_map(
              Map.get(map, "request_meta")
            )
        ),
      checkout_settings:
        if(is_nil(Map.get(map, "checkout_settings")),
          do: nil,
          else:
            Inttegro.Orders.CreateExistingCustomerInputCheckoutSettings.from_map(
              Map.get(map, "checkout_settings")
            )
        ),
      invoice_settings:
        if(is_nil(Map.get(map, "invoice_settings")),
          do: nil,
          else: Inttegro.Invoices.SettingsInput.from_map(Map.get(map, "invoice_settings"))
        ),
      payout_settings:
        if(is_nil(Map.get(map, "payout_settings")),
          do: nil,
          else: Inttegro.Orders.PayoutSettingsRequest.from_map(Map.get(map, "payout_settings"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      billing_details:
        if(is_nil(Map.get(map, "billing_details")),
          do: nil,
          else: Inttegro.Orders.BillingDetailsInput.from_map(Map.get(map, "billing_details"))
        ),
      shipping:
        if(is_nil(Map.get(map, "shipping")),
          do: nil,
          else: Inttegro.Orders.ShippingInput.from_map(Map.get(map, "shipping"))
        ),
      customer_id: Map.fetch!(map, "customer_id"),
      line_items:
        Enum.map(Map.fetch!(map, "line_items"), fn item ->
          Inttegro.Orders.LineItemInput.decode(item)
        end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_id" =>
        if(is_nil(value.payment_method_id),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_id)
        ),
      "payment_method_data" =>
        if(is_nil(value.payment_method_data),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_data)
        ),
      "receipt_number" =>
        if(is_nil(value.receipt_number),
          do: nil,
          else: Inttegro.Codec.encode(value.receipt_number)
        ),
      "statement_descriptor" =>
        if(is_nil(value.statement_descriptor),
          do: nil,
          else: Inttegro.Codec.encode(value.statement_descriptor)
        ),
      "statement_descriptor_prefix" =>
        if(is_nil(value.statement_descriptor_prefix),
          do: nil,
          else: Inttegro.Codec.encode(value.statement_descriptor_prefix)
        ),
      "execute_payment" =>
        if(is_nil(value.execute_payment),
          do: nil,
          else: Inttegro.Codec.encode(value.execute_payment)
        ),
      "finalize" =>
        if(is_nil(value.finalize), do: nil, else: Inttegro.Codec.encode(value.finalize)),
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "checkout_settings" =>
        if(is_nil(value.checkout_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.checkout_settings)
        ),
      "invoice_settings" =>
        if(is_nil(value.invoice_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.invoice_settings)
        ),
      "payout_settings" =>
        if(is_nil(value.payout_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.payout_settings)
        ),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "billing_details" =>
        if(is_nil(value.billing_details),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_details)
        ),
      "shipping" =>
        if(is_nil(value.shipping), do: nil, else: Inttegro.Codec.encode(value.shipping)),
      "customer_id" => Inttegro.Codec.encode(value.customer_id),
      "line_items" => Enum.map(value.line_items, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CreateExistingCustomerInputCheckoutSettings do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct redirect_url: nil, cancel_url: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          redirect_url: String.t() | nil,
          cancel_url: String.t() | nil
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
      cancel_url:
        if(is_nil(Map.get(map, "cancel_url")), do: nil, else: Map.get(map, "cancel_url"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "redirect_url" =>
        if(is_nil(value.redirect_url), do: nil, else: Inttegro.Codec.encode(value.redirect_url)),
      "cancel_url" =>
        if(is_nil(value.cancel_url), do: nil, else: Inttegro.Codec.encode(value.cancel_url))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CreateExistingCustomerInputRequestMeta do
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

defmodule Inttegro.Orders.CreateNewCustomerInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:customer_data, :line_items]
  defstruct number: nil,
            receipt_number: nil,
            statement_descriptor: nil,
            statement_descriptor_prefix: nil,
            execute_payment: nil,
            finalize: nil,
            request_meta: nil,
            checkout_settings: nil,
            invoice_settings: nil,
            payout_settings: nil,
            custom_data: nil,
            billing_details: nil,
            shipping: nil,
            payment_method_data: nil,
            customer_data: nil,
            line_items: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          number: String.t() | nil,
          receipt_number: String.t() | nil,
          statement_descriptor: String.t() | nil,
          statement_descriptor_prefix: String.t() | nil,
          execute_payment: boolean() | nil,
          finalize: boolean() | nil,
          request_meta: Inttegro.Orders.CreateNewCustomerInputRequestMeta.t() | nil,
          checkout_settings: Inttegro.Orders.CreateNewCustomerInputCheckoutSettings.t() | nil,
          invoice_settings: Inttegro.Invoices.SettingsInput.t() | nil,
          payout_settings: Inttegro.Orders.PayoutSettingsRequest.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          billing_details: Inttegro.Orders.BillingDetailsInput.t() | nil,
          shipping: Inttegro.Orders.ShippingInput.t() | nil,
          payment_method_data: Inttegro.PaymentMethods.DataInput.t() | nil,
          customer_data: Inttegro.Customers.DataInput.t(),
          line_items: [Inttegro.Orders.LineItemInput.t()]
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      receipt_number:
        if(is_nil(Map.get(map, "receipt_number")), do: nil, else: Map.get(map, "receipt_number")),
      statement_descriptor:
        if(is_nil(Map.get(map, "statement_descriptor")),
          do: nil,
          else: Map.get(map, "statement_descriptor")
        ),
      statement_descriptor_prefix:
        if(is_nil(Map.get(map, "statement_descriptor_prefix")),
          do: nil,
          else: Map.get(map, "statement_descriptor_prefix")
        ),
      execute_payment:
        if(is_nil(Map.get(map, "execute_payment")),
          do: nil,
          else: Map.get(map, "execute_payment")
        ),
      finalize: if(is_nil(Map.get(map, "finalize")), do: nil, else: Map.get(map, "finalize")),
      request_meta:
        if(is_nil(Map.get(map, "request_meta")),
          do: nil,
          else:
            Inttegro.Orders.CreateNewCustomerInputRequestMeta.from_map(
              Map.get(map, "request_meta")
            )
        ),
      checkout_settings:
        if(is_nil(Map.get(map, "checkout_settings")),
          do: nil,
          else:
            Inttegro.Orders.CreateNewCustomerInputCheckoutSettings.from_map(
              Map.get(map, "checkout_settings")
            )
        ),
      invoice_settings:
        if(is_nil(Map.get(map, "invoice_settings")),
          do: nil,
          else: Inttegro.Invoices.SettingsInput.from_map(Map.get(map, "invoice_settings"))
        ),
      payout_settings:
        if(is_nil(Map.get(map, "payout_settings")),
          do: nil,
          else: Inttegro.Orders.PayoutSettingsRequest.from_map(Map.get(map, "payout_settings"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      billing_details:
        if(is_nil(Map.get(map, "billing_details")),
          do: nil,
          else: Inttegro.Orders.BillingDetailsInput.from_map(Map.get(map, "billing_details"))
        ),
      shipping:
        if(is_nil(Map.get(map, "shipping")),
          do: nil,
          else: Inttegro.Orders.ShippingInput.from_map(Map.get(map, "shipping"))
        ),
      payment_method_data:
        if(is_nil(Map.get(map, "payment_method_data")),
          do: nil,
          else: Inttegro.PaymentMethods.DataInput.from_map(Map.get(map, "payment_method_data"))
        ),
      customer_data: Inttegro.Customers.DataInput.from_map(Map.fetch!(map, "customer_data")),
      line_items:
        Enum.map(Map.fetch!(map, "line_items"), fn item ->
          Inttegro.Orders.LineItemInput.decode(item)
        end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "receipt_number" =>
        if(is_nil(value.receipt_number),
          do: nil,
          else: Inttegro.Codec.encode(value.receipt_number)
        ),
      "statement_descriptor" =>
        if(is_nil(value.statement_descriptor),
          do: nil,
          else: Inttegro.Codec.encode(value.statement_descriptor)
        ),
      "statement_descriptor_prefix" =>
        if(is_nil(value.statement_descriptor_prefix),
          do: nil,
          else: Inttegro.Codec.encode(value.statement_descriptor_prefix)
        ),
      "execute_payment" =>
        if(is_nil(value.execute_payment),
          do: nil,
          else: Inttegro.Codec.encode(value.execute_payment)
        ),
      "finalize" =>
        if(is_nil(value.finalize), do: nil, else: Inttegro.Codec.encode(value.finalize)),
      "request_meta" =>
        if(is_nil(value.request_meta), do: nil, else: Inttegro.Codec.encode(value.request_meta)),
      "checkout_settings" =>
        if(is_nil(value.checkout_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.checkout_settings)
        ),
      "invoice_settings" =>
        if(is_nil(value.invoice_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.invoice_settings)
        ),
      "payout_settings" =>
        if(is_nil(value.payout_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.payout_settings)
        ),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "billing_details" =>
        if(is_nil(value.billing_details),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_details)
        ),
      "shipping" =>
        if(is_nil(value.shipping), do: nil, else: Inttegro.Codec.encode(value.shipping)),
      "payment_method_data" =>
        if(is_nil(value.payment_method_data),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_data)
        ),
      "customer_data" => Inttegro.Codec.encode(value.customer_data),
      "line_items" => Enum.map(value.line_items, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CreateNewCustomerInputCheckoutSettings do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct redirect_url: nil, cancel_url: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          redirect_url: String.t() | nil,
          cancel_url: String.t() | nil
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
      cancel_url:
        if(is_nil(Map.get(map, "cancel_url")), do: nil, else: Map.get(map, "cancel_url"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "redirect_url" =>
        if(is_nil(value.redirect_url), do: nil, else: Inttegro.Codec.encode(value.redirect_url)),
      "cancel_url" =>
        if(is_nil(value.cancel_url), do: nil, else: Inttegro.Codec.encode(value.cancel_url))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CreateNewCustomerInputRequestMeta do
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

defmodule Inttegro.Orders.FeeDetailsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:amount]
  defstruct id: nil, label: nil, tax_code: nil, description: nil, custom_data: nil, amount: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          id: String.t() | nil,
          label: String.t() | nil,
          tax_code: String.t() | nil,
          description: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          amount: Inttegro.Money.AmountParams.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      amount: Inttegro.Money.AmountParams.from_map(Map.fetch!(map, "amount"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "amount" => Inttegro.Codec.encode(value.amount)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.FeeLineItemInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type, :fee]
  defstruct type: nil, fee: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.Orders.LineItemType.t(),
          fee: Inttegro.Orders.FeeDetailsInput.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Orders.LineItemType.decode(Map.fetch!(map, "type")),
      fee: Inttegro.Orders.FeeDetailsInput.from_map(Map.fetch!(map, "fee"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Orders.LineItemType.encode(value.type),
      "fee" => Inttegro.Codec.encode(value.fee)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.FinalizeRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.Order do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:customer, :id, :initiated_at, :status]
  defstruct canceled_at: nil,
            checkout_settings: nil,
            completed_at: nil,
            created_from: nil,
            custom_data: nil,
            customer: nil,
            expires_at: nil,
            id: nil,
            initiated_at: nil,
            invoice: nil,
            number: nil,
            receipt_number: nil,
            refunds: nil,
            invoice_settings: nil,
            status: nil,
            sealed_at: nil,
            line_item_group: nil,
            payment: nil,
            paid_at: nil,
            payment_due_at: nil,
            reference: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          canceled_at: DateTime.t() | nil,
          checkout_settings: Inttegro.Orders.CheckoutSettings.t() | nil,
          completed_at: DateTime.t() | nil,
          created_from: Inttegro.Orders.CreatedFrom.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          customer: Inttegro.Orders.Customer.t(),
          expires_at: DateTime.t() | nil,
          id: String.t(),
          initiated_at: DateTime.t(),
          invoice: Inttegro.Invoices.Order.t() | nil,
          number: String.t() | nil,
          receipt_number: String.t() | nil,
          refunds: [Inttegro.Refunds.Refund.t()] | nil,
          invoice_settings: Inttegro.Invoices.Settings.t() | nil,
          status: Inttegro.Orders.Status.t(),
          sealed_at: DateTime.t() | nil,
          line_item_group: Inttegro.Orders.LineItemGroup.t() | nil,
          payment: Inttegro.Payments.Payment.t() | nil,
          paid_at: DateTime.t() | nil,
          payment_due_at: DateTime.t() | nil,
          reference: String.t() | nil
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
      checkout_settings:
        if(is_nil(Map.get(map, "checkout_settings")),
          do: nil,
          else: Inttegro.Orders.CheckoutSettings.from_map(Map.get(map, "checkout_settings"))
        ),
      completed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "completed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "completed_at"))
        ),
      created_from:
        if(is_nil(Map.get(map, "created_from")),
          do: nil,
          else: Inttegro.Orders.CreatedFrom.from_map(Map.get(map, "created_from"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      customer: Inttegro.Orders.Customer.from_map(Map.fetch!(map, "customer")),
      expires_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "expires_at"))
        ),
      id: Map.fetch!(map, "id"),
      initiated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "initiated_at")),
      invoice:
        if(is_nil(Map.get(map, "invoice")),
          do: nil,
          else: Inttegro.Invoices.Order.from_map(Map.get(map, "invoice"))
        ),
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      receipt_number:
        if(is_nil(Map.get(map, "receipt_number")), do: nil, else: Map.get(map, "receipt_number")),
      refunds:
        if(is_nil(Map.get(map, "refunds")),
          do: nil,
          else:
            Enum.map(Map.get(map, "refunds"), fn item ->
              Inttegro.Refunds.Refund.from_map(item)
            end)
        ),
      invoice_settings:
        if(is_nil(Map.get(map, "invoice_settings")),
          do: nil,
          else: Inttegro.Invoices.Settings.from_map(Map.get(map, "invoice_settings"))
        ),
      status: Inttegro.Orders.Status.decode(Map.fetch!(map, "status")),
      sealed_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "sealed_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "sealed_at"))
        ),
      line_item_group:
        if(is_nil(Map.get(map, "line_item_group")),
          do: nil,
          else: Inttegro.Orders.LineItemGroup.from_map(Map.get(map, "line_item_group"))
        ),
      payment:
        if(is_nil(Map.get(map, "payment")),
          do: nil,
          else: Inttegro.Payments.Payment.from_map(Map.get(map, "payment"))
        ),
      paid_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "paid_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "paid_at"))
        ),
      payment_due_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "payment_due_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "payment_due_at"))
        ),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "canceled_at" =>
        if(is_nil(value.canceled_at), do: nil, else: Inttegro.Codec.encode(value.canceled_at)),
      "checkout_settings" =>
        if(is_nil(value.checkout_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.checkout_settings)
        ),
      "completed_at" =>
        if(is_nil(value.completed_at), do: nil, else: Inttegro.Codec.encode(value.completed_at)),
      "created_from" =>
        if(is_nil(value.created_from), do: nil, else: Inttegro.Codec.encode(value.created_from)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "customer" => Inttegro.Codec.encode(value.customer),
      "expires_at" =>
        if(is_nil(value.expires_at), do: nil, else: Inttegro.Codec.encode(value.expires_at)),
      "id" => Inttegro.Codec.encode(value.id),
      "initiated_at" => Inttegro.Codec.encode(value.initiated_at),
      "invoice" => if(is_nil(value.invoice), do: nil, else: Inttegro.Codec.encode(value.invoice)),
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "receipt_number" =>
        if(is_nil(value.receipt_number),
          do: nil,
          else: Inttegro.Codec.encode(value.receipt_number)
        ),
      "refunds" =>
        if(is_nil(value.refunds),
          do: nil,
          else: Enum.map(value.refunds, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "invoice_settings" =>
        if(is_nil(value.invoice_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.invoice_settings)
        ),
      "status" => Inttegro.Orders.Status.encode(value.status),
      "sealed_at" =>
        if(is_nil(value.sealed_at), do: nil, else: Inttegro.Codec.encode(value.sealed_at)),
      "line_item_group" =>
        if(is_nil(value.line_item_group),
          do: nil,
          else: Inttegro.Codec.encode(value.line_item_group)
        ),
      "payment" => if(is_nil(value.payment), do: nil, else: Inttegro.Codec.encode(value.payment)),
      "paid_at" => if(is_nil(value.paid_at), do: nil, else: Inttegro.Codec.encode(value.paid_at)),
      "payment_due_at" =>
        if(is_nil(value.payment_due_at),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_due_at)
        ),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.Address do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:country]
  defstruct name: nil,
            phone_number: nil,
            line1: nil,
            line2: nil,
            city: nil,
            region: nil,
            post_code: nil,
            country: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          name: String.t() | nil,
          phone_number: String.t() | nil,
          line1: String.t() | nil,
          line2: String.t() | nil,
          city: String.t() | nil,
          region: String.t() | nil,
          post_code: String.t() | nil,
          country: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      line1: if(is_nil(Map.get(map, "line1")), do: nil, else: Map.get(map, "line1")),
      line2: if(is_nil(Map.get(map, "line2")), do: nil, else: Map.get(map, "line2")),
      city: if(is_nil(Map.get(map, "city")), do: nil, else: Map.get(map, "city")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      country: Map.fetch!(map, "country")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "line1" => if(is_nil(value.line1), do: nil, else: Inttegro.Codec.encode(value.line1)),
      "line2" => if(is_nil(value.line2), do: nil, else: Inttegro.Codec.encode(value.line2)),
      "city" => if(is_nil(value.city), do: nil, else: Inttegro.Codec.encode(value.city)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "country" => Inttegro.Codec.encode(value.country)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CheckoutSettings do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct redirect_url: nil, cancel_url: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          redirect_url: String.t() | nil,
          cancel_url: String.t() | nil
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
      cancel_url:
        if(is_nil(Map.get(map, "cancel_url")), do: nil, else: Map.get(map, "cancel_url"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "redirect_url" =>
        if(is_nil(value.redirect_url), do: nil, else: Inttegro.Codec.encode(value.redirect_url)),
      "cancel_url" =>
        if(is_nil(value.cancel_url), do: nil, else: Inttegro.Codec.encode(value.cancel_url))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.CreatedFrom do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct source: nil, resource_type: nil, resource_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          source: String.t() | nil,
          resource_type: Inttegro.Orders.CreatedFromResourceType.t() | nil,
          resource_id: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      source: if(is_nil(Map.get(map, "source")), do: nil, else: Map.get(map, "source")),
      resource_type:
        if(is_nil(Map.get(map, "resource_type")),
          do: nil,
          else: Inttegro.Orders.CreatedFromResourceType.decode(Map.get(map, "resource_type"))
        ),
      resource_id:
        if(is_nil(Map.get(map, "resource_id")), do: nil, else: Map.get(map, "resource_id"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "source" => if(is_nil(value.source), do: nil, else: Inttegro.Codec.encode(value.source)),
      "resource_type" =>
        if(is_nil(value.resource_type),
          do: nil,
          else: Inttegro.Orders.CreatedFromResourceType.encode(value.resource_type)
        ),
      "resource_id" =>
        if(is_nil(value.resource_id), do: nil, else: Inttegro.Codec.encode(value.resource_id))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.Customer do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :guest, :name]
  defstruct id: nil,
            guest: nil,
            name: nil,
            email_address: nil,
            phone_number: nil,
            billing_address: nil,
            shipping_address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          guest: boolean(),
          name: String.t(),
          email_address: String.t() | nil,
          phone_number: String.t() | nil,
          billing_address: Inttegro.Orders.Address.t() | nil,
          shipping_address: Inttegro.Orders.Address.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      guest: Map.fetch!(map, "guest"),
      name: Map.fetch!(map, "name"),
      email_address:
        if(is_nil(Map.get(map, "email_address")), do: nil, else: Map.get(map, "email_address")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      billing_address:
        if(is_nil(Map.get(map, "billing_address")),
          do: nil,
          else: Inttegro.Orders.Address.from_map(Map.get(map, "billing_address"))
        ),
      shipping_address:
        if(is_nil(Map.get(map, "shipping_address")),
          do: nil,
          else: Inttegro.Orders.Address.from_map(Map.get(map, "shipping_address"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "guest" => Inttegro.Codec.encode(value.guest),
      "name" => Inttegro.Codec.encode(value.name),
      "email_address" =>
        if(is_nil(value.email_address), do: nil, else: Inttegro.Codec.encode(value.email_address)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "billing_address" =>
        if(is_nil(value.billing_address),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_address)
        ),
      "shipping_address" =>
        if(is_nil(value.shipping_address),
          do: nil,
          else: Inttegro.Codec.encode(value.shipping_address)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.DocumentDeliveryRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.DocumentDeliveryResult do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct delivery: nil, error: nil, order: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          delivery: Inttegro.Invoices.OrderDocumentDelivery.t() | nil,
          error: Inttegro.Errors.Error.t() | nil,
          order: Inttegro.Orders.Order.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      delivery:
        if(is_nil(Map.get(map, "delivery")),
          do: nil,
          else: Inttegro.Invoices.OrderDocumentDelivery.from_map(Map.get(map, "delivery"))
        ),
      error:
        if(is_nil(Map.get(map, "error")),
          do: nil,
          else: Inttegro.Errors.Error.from_map(Map.get(map, "error"))
        ),
      order:
        if(is_nil(Map.get(map, "order")),
          do: nil,
          else: Inttegro.Orders.Order.from_map(Map.get(map, "order"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "delivery" =>
        if(is_nil(value.delivery), do: nil, else: Inttegro.Codec.encode(value.delivery)),
      "error" => if(is_nil(value.error), do: nil, else: Inttegro.Codec.encode(value.error)),
      "order" => if(is_nil(value.order), do: nil, else: Inttegro.Codec.encode(value.order))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.FeeLineItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type, :fee]
  defstruct type: nil, fee: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t(),
          fee: Inttegro.Orders.FeeLineItemFee.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Map.fetch!(map, "type"),
      fee: Inttegro.Orders.FeeLineItemFee.from_map(Map.fetch!(map, "fee"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Codec.encode(value.type),
      "fee" => Inttegro.Codec.encode(value.fee)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.FeeLineItemFee do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :amount, :label]
  defstruct id: nil, description: nil, tax_code: nil, amount: nil, label: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          description: String.t() | nil,
          tax_code: String.t() | nil,
          amount: Inttegro.Money.Amount.t(),
          label: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      amount: Inttegro.Money.Amount.from_map(Map.fetch!(map, "amount")),
      label: Map.fetch!(map, "label")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "amount" => Inttegro.Codec.encode(value.amount),
      "label" => Inttegro.Codec.encode(value.label)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.Discount do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{}
  defstruct []
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map) when map == %{}, do: %__MODULE__{}
  @spec to_map(t()) :: map()
  def to_map(%__MODULE__{}), do: %{}
end

defmodule Inttegro.Orders.DiscountLineItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type, :discount]
  defstruct type: nil, discount: nil
  @type t :: %__MODULE__{type: String.t(), discount: Inttegro.Orders.Discount.t()}
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Map.fetch!(map, "type"),
      discount: Inttegro.Orders.Discount.from_map(Map.fetch!(map, "discount"))
    }
  end

  @spec to_map(t()) :: map()
  def to_map(value),
    do: %{"type" => value.type, "discount" => Inttegro.Codec.encode(value.discount)}
end

defmodule Inttegro.Orders.LineItemGroup do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:line_items, :total]
  defstruct line_items: nil, total: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          line_items: [Inttegro.Orders.LineItem.t()],
          total: Inttegro.Money.Amount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      line_items:
        Enum.map(Map.fetch!(map, "line_items"), fn item ->
          Inttegro.Orders.LineItem.decode(item)
        end),
      total: Inttegro.Money.Amount.from_map(Map.fetch!(map, "total"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "line_items" => Enum.map(value.line_items, fn item -> Inttegro.Codec.encode(item) end),
      "total" => Inttegro.Codec.encode(value.total)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size, :orders]
  defstruct number: nil, size: nil, orders: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          orders: [Inttegro.Orders.Order.t()]
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
      orders:
        Enum.map(Map.fetch!(map, "orders"), fn item -> Inttegro.Orders.Order.from_map(item) end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "orders" => Enum.map(value.orders, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.PayoutSettingsRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct destination: nil, enable_fx: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          destination: Inttegro.Orders.PayoutSettingsRequestDestination.t() | nil,
          enable_fx: boolean() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      destination:
        if(is_nil(Map.get(map, "destination")),
          do: nil,
          else:
            Inttegro.Orders.PayoutSettingsRequestDestination.from_map(Map.get(map, "destination"))
        ),
      enable_fx: if(is_nil(Map.get(map, "enable_fx")), do: nil, else: Map.get(map, "enable_fx"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "destination" =>
        if(is_nil(value.destination), do: nil, else: Inttegro.Codec.encode(value.destination)),
      "enable_fx" =>
        if(is_nil(value.enable_fx), do: nil, else: Inttegro.Codec.encode(value.enable_fx))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.PayoutSettingsRequestDestination do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:financial_account_id]
  defstruct financial_account_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
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

defmodule Inttegro.Orders.ProductLineItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type, :product]
  defstruct type: nil, product: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t(),
          product: Inttegro.Orders.ProductLineItemProduct.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Map.fetch!(map, "type"),
      product: Inttegro.Orders.ProductLineItemProduct.from_map(Map.fetch!(map, "product"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Codec.encode(value.type),
      "product" => Inttegro.Codec.encode(value.product)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ProductLineItemProduct do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :name, :price, :quantity]
  defstruct id: nil,
            product_id: nil,
            price_id: nil,
            reference: nil,
            about: nil,
            custom_data: nil,
            tax_code: nil,
            name: nil,
            category: nil,
            type: nil,
            price: nil,
            quantity: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          product_id: String.t() | nil,
          price_id: String.t() | nil,
          reference: String.t() | nil,
          about: String.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          tax_code: String.t() | nil,
          name: String.t(),
          category: String.t() | nil,
          type: String.t() | nil,
          price: Inttegro.Prices.Price.t(),
          quantity: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      product_id:
        if(is_nil(Map.get(map, "product_id")), do: nil, else: Map.get(map, "product_id")),
      price_id: if(is_nil(Map.get(map, "price_id")), do: nil, else: Map.get(map, "price_id")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      name: Map.fetch!(map, "name"),
      category: if(is_nil(Map.get(map, "category")), do: nil, else: Map.get(map, "category")),
      type: if(is_nil(Map.get(map, "type")), do: nil, else: Map.get(map, "type")),
      price: Inttegro.Prices.Price.from_map(Map.fetch!(map, "price")),
      quantity: Map.fetch!(map, "quantity")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "product_id" =>
        if(is_nil(value.product_id), do: nil, else: Inttegro.Codec.encode(value.product_id)),
      "price_id" =>
        if(is_nil(value.price_id), do: nil, else: Inttegro.Codec.encode(value.price_id)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "name" => Inttegro.Codec.encode(value.name),
      "category" =>
        if(is_nil(value.category), do: nil, else: Inttegro.Codec.encode(value.category)),
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Codec.encode(value.type)),
      "price" => Inttegro.Codec.encode(value.price),
      "quantity" => Inttegro.Codec.encode(value.quantity)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ShippingLineItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type, :shipping]
  defstruct type: nil, shipping: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: String.t(),
          shipping: Inttegro.Orders.ShippingLineItemShipping.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Map.fetch!(map, "type"),
      shipping: Inttegro.Orders.ShippingLineItemShipping.from_map(Map.fetch!(map, "shipping"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Codec.encode(value.type),
      "shipping" => Inttegro.Codec.encode(value.shipping)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ShippingLineItemShipping do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :fee]
  defstruct id: nil, tax_code: nil, label: nil, fee: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          tax_code: String.t() | nil,
          label: String.t() | nil,
          fee: Inttegro.Money.Amount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      fee: Inttegro.Money.Amount.from_map(Map.fetch!(map, "fee"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "fee" => Inttegro.Codec.encode(value.fee)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:page_size]
  defstruct page_number: nil, customer_id: nil, page_size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          page_number: integer() | nil,
          customer_id: String.t() | nil,
          page_size: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      page_number:
        if(is_nil(Map.get(map, "page_number")), do: nil, else: Map.get(map, "page_number")),
      customer_id:
        if(is_nil(Map.get(map, "customer_id")), do: nil, else: Map.get(map, "customer_id")),
      page_size: Map.fetch!(map, "page_size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "page_number" =>
        if(is_nil(value.page_number), do: nil, else: Inttegro.Codec.encode(value.page_number)),
      "customer_id" =>
        if(is_nil(value.customer_id), do: nil, else: Inttegro.Codec.encode(value.customer_id)),
      "page_size" => Inttegro.Codec.encode(value.page_size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.PayRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct payment_method_data: nil, payment_method_id: nil, paid_out_of_band: nil, order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          payment_method_data: Inttegro.PaymentMethods.DataInput.t() | nil,
          payment_method_id: String.t() | nil,
          paid_out_of_band: boolean() | nil,
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      payment_method_data:
        if(is_nil(Map.get(map, "payment_method_data")),
          do: nil,
          else: Inttegro.PaymentMethods.DataInput.from_map(Map.get(map, "payment_method_data"))
        ),
      payment_method_id:
        if(is_nil(Map.get(map, "payment_method_id")),
          do: nil,
          else: Map.get(map, "payment_method_id")
        ),
      paid_out_of_band:
        if(is_nil(Map.get(map, "paid_out_of_band")),
          do: nil,
          else: Map.get(map, "paid_out_of_band")
        ),
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "payment_method_data" =>
        if(is_nil(value.payment_method_data),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_data)
        ),
      "payment_method_id" =>
        if(is_nil(value.payment_method_id),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_id)
        ),
      "paid_out_of_band" =>
        if(is_nil(value.paid_out_of_band),
          do: nil,
          else: Inttegro.Codec.encode(value.paid_out_of_band)
        ),
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ProductLineItemInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type, :product]
  defstruct type: nil, product: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.Orders.LineItemType.t(),
          product: Inttegro.Orders.ProductLineItemInputProduct.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Orders.LineItemType.decode(Map.fetch!(map, "type")),
      product: Inttegro.Orders.ProductLineItemInputProduct.decode(Map.fetch!(map, "product"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Orders.LineItemType.encode(value.type),
      "product" => Inttegro.Codec.encode(value.product)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.RequestConfirmationRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ShippingDetailsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:fee]
  defstruct id: nil, tax_code: nil, custom_data: nil, fee: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          id: String.t() | nil,
          tax_code: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          fee: Inttegro.Money.AmountParams.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: if(is_nil(Map.get(map, "id")), do: nil, else: Map.get(map, "id")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      fee: Inttegro.Money.AmountParams.from_map(Map.fetch!(map, "fee"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => if(is_nil(value.id), do: nil, else: Inttegro.Codec.encode(value.id)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "fee" => Inttegro.Codec.encode(value.fee)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.ShippingInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:address]
  defstruct address: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          address: Inttegro.Orders.AddressInput.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      address: Inttegro.Orders.AddressInput.from_map(Map.fetch!(map, "address"))
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

defmodule Inttegro.Orders.ShippingLineItemInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type, :shipping]
  defstruct type: nil, shipping: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.Orders.LineItemType.t(),
          shipping: Inttegro.Orders.ShippingDetailsInput.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Orders.LineItemType.decode(Map.fetch!(map, "type")),
      shipping: Inttegro.Orders.ShippingDetailsInput.from_map(Map.fetch!(map, "shipping"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Orders.LineItemType.encode(value.type),
      "shipping" => Inttegro.Codec.encode(value.shipping)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.UpdateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:order_id]
  defstruct clear_payment_method: nil,
            custom_data: nil,
            invoice_settings: nil,
            finalize: nil,
            line_items: nil,
            number: nil,
            receipt_number: nil,
            payment_method_data: nil,
            payment_method_id: nil,
            statement_descriptor: nil,
            statement_descriptor_prefix: nil,
            order_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          clear_payment_method: boolean() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          invoice_settings: Inttegro.Invoices.SettingsInput.t() | nil,
          finalize: boolean() | nil,
          line_items: [Inttegro.Orders.LineItemInput.t()] | nil,
          number: String.t() | nil,
          receipt_number: String.t() | nil,
          payment_method_data: Inttegro.Orders.UpdateRequestPaymentMethodData.t() | nil,
          payment_method_id: String.t() | nil,
          statement_descriptor: String.t() | nil,
          statement_descriptor_prefix: String.t() | nil,
          order_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      clear_payment_method:
        if(is_nil(Map.get(map, "clear_payment_method")),
          do: nil,
          else: Map.get(map, "clear_payment_method")
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      invoice_settings:
        if(is_nil(Map.get(map, "invoice_settings")),
          do: nil,
          else: Inttegro.Invoices.SettingsInput.from_map(Map.get(map, "invoice_settings"))
        ),
      finalize: if(is_nil(Map.get(map, "finalize")), do: nil, else: Map.get(map, "finalize")),
      line_items:
        if(is_nil(Map.get(map, "line_items")),
          do: nil,
          else:
            Enum.map(Map.get(map, "line_items"), fn item ->
              Inttegro.Orders.LineItemInput.decode(item)
            end)
        ),
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      receipt_number:
        if(is_nil(Map.get(map, "receipt_number")), do: nil, else: Map.get(map, "receipt_number")),
      payment_method_data:
        if(is_nil(Map.get(map, "payment_method_data")),
          do: nil,
          else:
            Inttegro.Orders.UpdateRequestPaymentMethodData.from_map(
              Map.get(map, "payment_method_data")
            )
        ),
      payment_method_id:
        if(is_nil(Map.get(map, "payment_method_id")),
          do: nil,
          else: Map.get(map, "payment_method_id")
        ),
      statement_descriptor:
        if(is_nil(Map.get(map, "statement_descriptor")),
          do: nil,
          else: Map.get(map, "statement_descriptor")
        ),
      statement_descriptor_prefix:
        if(is_nil(Map.get(map, "statement_descriptor_prefix")),
          do: nil,
          else: Map.get(map, "statement_descriptor_prefix")
        ),
      order_id: Map.fetch!(map, "order_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "clear_payment_method" =>
        if(is_nil(value.clear_payment_method),
          do: nil,
          else: Inttegro.Codec.encode(value.clear_payment_method)
        ),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "invoice_settings" =>
        if(is_nil(value.invoice_settings),
          do: nil,
          else: Inttegro.Codec.encode(value.invoice_settings)
        ),
      "finalize" =>
        if(is_nil(value.finalize), do: nil, else: Inttegro.Codec.encode(value.finalize)),
      "line_items" =>
        if(is_nil(value.line_items),
          do: nil,
          else: Enum.map(value.line_items, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "receipt_number" =>
        if(is_nil(value.receipt_number),
          do: nil,
          else: Inttegro.Codec.encode(value.receipt_number)
        ),
      "payment_method_data" =>
        if(is_nil(value.payment_method_data),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_data)
        ),
      "payment_method_id" =>
        if(is_nil(value.payment_method_id),
          do: nil,
          else: Inttegro.Codec.encode(value.payment_method_id)
        ),
      "statement_descriptor" =>
        if(is_nil(value.statement_descriptor),
          do: nil,
          else: Inttegro.Codec.encode(value.statement_descriptor)
        ),
      "statement_descriptor_prefix" =>
        if(is_nil(value.statement_descriptor_prefix),
          do: nil,
          else: Inttegro.Codec.encode(value.statement_descriptor_prefix)
        ),
      "order_id" => Inttegro.Codec.encode(value.order_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.UpdateRequestPaymentMethodData do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type]
  defstruct mobile_money: nil, type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          mobile_money: Inttegro.Orders.UpdateRequestPaymentMethodDataMobileMoney.t() | nil,
          type: Inttegro.PaymentMethods.Type.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      mobile_money:
        if(is_nil(Map.get(map, "mobile_money")),
          do: nil,
          else:
            Inttegro.Orders.UpdateRequestPaymentMethodDataMobileMoney.from_map(
              Map.get(map, "mobile_money")
            )
        ),
      type: Inttegro.PaymentMethods.Type.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "mobile_money" =>
        if(is_nil(value.mobile_money), do: nil, else: Inttegro.Codec.encode(value.mobile_money)),
      "type" => Inttegro.PaymentMethods.Type.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Orders.UpdateRequestPaymentMethodDataMobileMoney do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:network, :account_number]
  defstruct network: nil, account_number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          network: Inttegro.PaymentMethods.MobileMoneyNetwork.t(),
          account_number: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      network: Inttegro.PaymentMethods.MobileMoneyNetwork.decode(Map.fetch!(map, "network")),
      account_number: Map.fetch!(map, "account_number")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "network" => Inttegro.PaymentMethods.MobileMoneyNetwork.encode(value.network),
      "account_number" => Inttegro.Codec.encode(value.account_number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
