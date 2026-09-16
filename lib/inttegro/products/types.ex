# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Products.ShipmentInputType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :delivery | :download | :render | :stream | String.t()
  @values %{
    delivery: "delivery",
    download: "download",
    render: "render",
    stream: "stream"
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

defmodule Inttegro.Products.ShipmentType do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :delivery | :download | :render | :service | :stream | String.t()
  @values %{
    delivery: "delivery",
    download: "download",
    render: "render",
    service: "service",
    stream: "stream"
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

defmodule Inttegro.Products.Type do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :enum)
  @typedoc Inttegro.Docs.type_doc(__MODULE__, :enum)
  @type t :: :physical | :digital | :service | :voucher | :custom | :cause | String.t()
  @values %{
    physical: "physical",
    digital: "digital",
    service: "service",
    voucher: "voucher",
    custom: "custom",
    cause: "cause"
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

defmodule Inttegro.Products.DetailsInput do
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

defmodule Inttegro.Products.AddPriceRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:product_id, :amount]
  defstruct label: nil, about: nil, product_id: nil, amount: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          label: String.t() | nil,
          about: String.t() | nil,
          product_id: String.t(),
          amount: Inttegro.Money.AmountParams.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      product_id: Map.fetch!(map, "product_id"),
      amount: Inttegro.Money.AmountParams.from_map(Map.fetch!(map, "amount"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "product_id" => Inttegro.Codec.encode(value.product_id),
      "amount" => Inttegro.Codec.encode(value.amount)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.CatalogWithPriceDataInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:price, :product_id, :quantity]
  defstruct price: nil, product_id: nil, quantity: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          price: Inttegro.Prices.Params.t(),
          product_id: String.t(),
          quantity: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      price: Inttegro.Prices.Params.from_map(Map.fetch!(map, "price")),
      product_id: Map.fetch!(map, "product_id"),
      quantity: Map.fetch!(map, "quantity")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "price" => Inttegro.Codec.encode(value.price),
      "product_id" => Inttegro.Codec.encode(value.product_id),
      "quantity" => Inttegro.Codec.encode(value.quantity)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.CatalogWithPriceReferenceInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:price_id, :product_id, :quantity]
  defstruct price_id: nil, product_id: nil, quantity: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          price_id: String.t(),
          product_id: String.t(),
          quantity: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      price_id: Map.fetch!(map, "price_id"),
      product_id: Map.fetch!(map, "product_id"),
      quantity: Map.fetch!(map, "quantity")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "price_id" => Inttegro.Codec.encode(value.price_id),
      "product_id" => Inttegro.Codec.encode(value.product_id),
      "quantity" => Inttegro.Codec.encode(value.quantity)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type, :name]
  defstruct reference: nil,
            description: nil,
            about: nil,
            tax_code: nil,
            category: nil,
            shipment: nil,
            dimensions: nil,
            unit_dimension: nil,
            media: nil,
            attributes: nil,
            publish: nil,
            custom_data: nil,
            type: nil,
            name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          reference: String.t() | nil,
          description: String.t() | nil,
          about: String.t() | nil,
          tax_code: String.t() | nil,
          category: String.t() | nil,
          shipment: Inttegro.Products.ShipmentInput.t() | nil,
          dimensions: Inttegro.Products.DimensionsInput.t() | nil,
          unit_dimension: String.t() | nil,
          media: Inttegro.Products.MediaInput.t() | nil,
          attributes: [Inttegro.Products.AttributeInput.t()] | nil,
          publish: boolean() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          type: Inttegro.Products.Type.t(),
          name: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      category: if(is_nil(Map.get(map, "category")), do: nil, else: Map.get(map, "category")),
      shipment:
        if(is_nil(Map.get(map, "shipment")),
          do: nil,
          else: Inttegro.Products.ShipmentInput.from_map(Map.get(map, "shipment"))
        ),
      dimensions:
        if(is_nil(Map.get(map, "dimensions")),
          do: nil,
          else: Inttegro.Products.DimensionsInput.from_map(Map.get(map, "dimensions"))
        ),
      unit_dimension:
        if(is_nil(Map.get(map, "unit_dimension")), do: nil, else: Map.get(map, "unit_dimension")),
      media:
        if(is_nil(Map.get(map, "media")),
          do: nil,
          else: Inttegro.Products.MediaInput.from_map(Map.get(map, "media"))
        ),
      attributes:
        if(is_nil(Map.get(map, "attributes")),
          do: nil,
          else:
            Enum.map(Map.get(map, "attributes"), fn item ->
              Inttegro.Products.AttributeInput.from_map(item)
            end)
        ),
      publish: if(is_nil(Map.get(map, "publish")), do: nil, else: Map.get(map, "publish")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      type: Inttegro.Products.Type.decode(Map.fetch!(map, "type")),
      name: Map.fetch!(map, "name")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "category" =>
        if(is_nil(value.category), do: nil, else: Inttegro.Codec.encode(value.category)),
      "shipment" =>
        if(is_nil(value.shipment), do: nil, else: Inttegro.Codec.encode(value.shipment)),
      "dimensions" =>
        if(is_nil(value.dimensions), do: nil, else: Inttegro.Codec.encode(value.dimensions)),
      "unit_dimension" =>
        if(is_nil(value.unit_dimension),
          do: nil,
          else: Inttegro.Codec.encode(value.unit_dimension)
        ),
      "media" => if(is_nil(value.media), do: nil, else: Inttegro.Codec.encode(value.media)),
      "attributes" =>
        if(is_nil(value.attributes),
          do: nil,
          else: Enum.map(value.attributes, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "publish" => if(is_nil(value.publish), do: nil, else: Inttegro.Codec.encode(value.publish)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "type" => Inttegro.Products.Type.encode(value.type),
      "name" => Inttegro.Codec.encode(value.name)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.InlineDetailsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name, :price, :quantity, :type]
  defstruct about: nil,
            custom_data: nil,
            reference: nil,
            tax_code: nil,
            name: nil,
            price: nil,
            quantity: nil,
            type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          about: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          reference: String.t() | nil,
          tax_code: String.t() | nil,
          name: String.t(),
          price: Inttegro.Prices.Params.t(),
          quantity: integer(),
          type: Inttegro.Products.Type.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      name: Map.fetch!(map, "name"),
      price: Inttegro.Prices.Params.from_map(Map.fetch!(map, "price")),
      quantity: Map.fetch!(map, "quantity"),
      type: Inttegro.Products.Type.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "name" => Inttegro.Codec.encode(value.name),
      "price" => Inttegro.Codec.encode(value.price),
      "quantity" => Inttegro.Codec.encode(value.quantity),
      "type" => Inttegro.Products.Type.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:product_id]
  defstruct product_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          product_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      product_id: Map.fetch!(map, "product_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "product_id" => Inttegro.Codec.encode(value.product_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.PageRequest do
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

defmodule Inttegro.Products.Product do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :type, :name, :active, :created_at]
  defstruct id: nil,
            type: nil,
            reference: nil,
            name: nil,
            description: nil,
            about: nil,
            tax_code: nil,
            category: nil,
            prices: nil,
            shipment: nil,
            media: nil,
            attributes: nil,
            dimensions: nil,
            custom_data: nil,
            active: nil,
            created_at: nil,
            updated_at: nil,
            archived_at: nil,
            published_at: nil,
            unit_dim: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          type: Inttegro.Products.Type.t(),
          reference: String.t() | nil,
          name: String.t(),
          description: String.t() | nil,
          about: String.t() | nil,
          tax_code: String.t() | nil,
          category: String.t() | nil,
          prices: [Inttegro.Products.PriceSummary.t()] | nil,
          shipment: Inttegro.Products.Shipment.t() | nil,
          media: Inttegro.Products.Media.t() | nil,
          attributes: [Inttegro.Products.Attribute.t()] | nil,
          dimensions: Inttegro.Products.Dimensions.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          active: boolean(),
          created_at: DateTime.t(),
          updated_at: DateTime.t() | nil,
          archived_at: DateTime.t() | nil,
          published_at: DateTime.t() | nil,
          unit_dim: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      type: Inttegro.Products.Type.decode(Map.fetch!(map, "type")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      name: Map.fetch!(map, "name"),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      category: if(is_nil(Map.get(map, "category")), do: nil, else: Map.get(map, "category")),
      prices:
        if(is_nil(Map.get(map, "prices")),
          do: nil,
          else:
            Enum.map(Map.get(map, "prices"), fn item ->
              Inttegro.Products.PriceSummary.from_map(item)
            end)
        ),
      shipment:
        if(is_nil(Map.get(map, "shipment")),
          do: nil,
          else: Inttegro.Products.Shipment.from_map(Map.get(map, "shipment"))
        ),
      media:
        if(is_nil(Map.get(map, "media")),
          do: nil,
          else: Inttegro.Products.Media.from_map(Map.get(map, "media"))
        ),
      attributes:
        if(is_nil(Map.get(map, "attributes")),
          do: nil,
          else:
            Enum.map(Map.get(map, "attributes"), fn item ->
              Inttegro.Products.Attribute.from_map(item)
            end)
        ),
      dimensions:
        if(is_nil(Map.get(map, "dimensions")),
          do: nil,
          else: Inttegro.Products.Dimensions.from_map(Map.get(map, "dimensions"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      active: Map.fetch!(map, "active"),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      updated_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "updated_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "updated_at"))
        ),
      archived_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))
        ),
      published_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "published_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "published_at"))
        ),
      unit_dim: if(is_nil(Map.get(map, "unit_dim")), do: nil, else: Map.get(map, "unit_dim"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "type" => Inttegro.Products.Type.encode(value.type),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "name" => Inttegro.Codec.encode(value.name),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "category" =>
        if(is_nil(value.category), do: nil, else: Inttegro.Codec.encode(value.category)),
      "prices" =>
        if(is_nil(value.prices),
          do: nil,
          else: Enum.map(value.prices, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "shipment" =>
        if(is_nil(value.shipment), do: nil, else: Inttegro.Codec.encode(value.shipment)),
      "media" => if(is_nil(value.media), do: nil, else: Inttegro.Codec.encode(value.media)),
      "attributes" =>
        if(is_nil(value.attributes),
          do: nil,
          else: Enum.map(value.attributes, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "dimensions" =>
        if(is_nil(value.dimensions), do: nil, else: Inttegro.Codec.encode(value.dimensions)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "active" => Inttegro.Codec.encode(value.active),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at)),
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at)),
      "published_at" =>
        if(is_nil(value.published_at), do: nil, else: Inttegro.Codec.encode(value.published_at)),
      "unit_dim" =>
        if(is_nil(value.unit_dim), do: nil, else: Inttegro.Codec.encode(value.unit_dim))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.ActionRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:product_id]
  defstruct product_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          product_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      product_id: Map.fetch!(map, "product_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "product_id" => Inttegro.Codec.encode(value.product_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.Attribute do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:name, :value]
  defstruct name: nil, value: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: Map.fetch!(map, "name"),
      value: Map.fetch!(map, "value")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => Inttegro.Codec.encode(value.name),
      "value" => Inttegro.Codec.encode(value.value)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.AttributeInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name, :value]
  defstruct name: nil, value: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      name: Map.fetch!(map, "name"),
      value: Map.fetch!(map, "value")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "name" => Inttegro.Codec.encode(value.name),
      "value" => Inttegro.Codec.encode(value.value)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.Dimensions do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct physical: nil, digital: nil, custom: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          physical: Inttegro.Products.DimensionsPhysical.t() | nil,
          digital: Inttegro.Products.DimensionsDigital.t() | nil,
          custom: Inttegro.Products.DimensionsCustom.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      physical:
        if(is_nil(Map.get(map, "physical")),
          do: nil,
          else: Inttegro.Products.DimensionsPhysical.from_map(Map.get(map, "physical"))
        ),
      digital:
        if(is_nil(Map.get(map, "digital")),
          do: nil,
          else: Inttegro.Products.DimensionsDigital.from_map(Map.get(map, "digital"))
        ),
      custom:
        if(is_nil(Map.get(map, "custom")),
          do: nil,
          else: Inttegro.Products.DimensionsCustom.from_map(Map.get(map, "custom"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "physical" =>
        if(is_nil(value.physical), do: nil, else: Inttegro.Codec.encode(value.physical)),
      "digital" => if(is_nil(value.digital), do: nil, else: Inttegro.Codec.encode(value.digital)),
      "custom" => if(is_nil(value.custom), do: nil, else: Inttegro.Codec.encode(value.custom))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsCustom do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct size_unit: nil, size: nil, details: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          size_unit: String.t() | nil,
          size: number() | nil,
          details: %{optional(String.t()) => String.t()} | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      size_unit: if(is_nil(Map.get(map, "size_unit")), do: nil, else: Map.get(map, "size_unit")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size")),
      details:
        if(is_nil(Map.get(map, "details")),
          do: nil,
          else: Map.new(Map.get(map, "details"), fn {key, value} -> {key, value} end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "size_unit" =>
        if(is_nil(value.size_unit), do: nil, else: Inttegro.Codec.encode(value.size_unit)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size)),
      "details" =>
        if(is_nil(value.details),
          do: nil,
          else:
            Map.new(value.details, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsDigital do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct bytes: nil, size_unit: nil, size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          bytes: number() | nil,
          size_unit: String.t() | nil,
          size: number() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      bytes: if(is_nil(Map.get(map, "bytes")), do: nil, else: Map.get(map, "bytes")),
      size_unit: if(is_nil(Map.get(map, "size_unit")), do: nil, else: Map.get(map, "size_unit")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bytes" => if(is_nil(value.bytes), do: nil, else: Inttegro.Codec.encode(value.bytes)),
      "size_unit" =>
        if(is_nil(value.size_unit), do: nil, else: Inttegro.Codec.encode(value.size_unit)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct physical: nil, digital: nil, custom: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          physical: Inttegro.Products.DimensionsInputPhysical.t() | nil,
          digital: Inttegro.Products.DimensionsInputDigital.t() | nil,
          custom: Inttegro.Products.DimensionsInputCustom.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      physical:
        if(is_nil(Map.get(map, "physical")),
          do: nil,
          else: Inttegro.Products.DimensionsInputPhysical.from_map(Map.get(map, "physical"))
        ),
      digital:
        if(is_nil(Map.get(map, "digital")),
          do: nil,
          else: Inttegro.Products.DimensionsInputDigital.from_map(Map.get(map, "digital"))
        ),
      custom:
        if(is_nil(Map.get(map, "custom")),
          do: nil,
          else: Inttegro.Products.DimensionsInputCustom.from_map(Map.get(map, "custom"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "physical" =>
        if(is_nil(value.physical), do: nil, else: Inttegro.Codec.encode(value.physical)),
      "digital" => if(is_nil(value.digital), do: nil, else: Inttegro.Codec.encode(value.digital)),
      "custom" => if(is_nil(value.custom), do: nil, else: Inttegro.Codec.encode(value.custom))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsInputCustom do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct size_unit: nil, size: nil, details: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          size_unit: String.t() | nil,
          size: number() | nil,
          details: %{optional(String.t()) => String.t()} | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      size_unit: if(is_nil(Map.get(map, "size_unit")), do: nil, else: Map.get(map, "size_unit")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size")),
      details:
        if(is_nil(Map.get(map, "details")),
          do: nil,
          else: Map.new(Map.get(map, "details"), fn {key, value} -> {key, value} end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "size_unit" =>
        if(is_nil(value.size_unit), do: nil, else: Inttegro.Codec.encode(value.size_unit)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size)),
      "details" =>
        if(is_nil(value.details),
          do: nil,
          else:
            Map.new(value.details, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsInputDigital do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct bytes: nil, size_unit: nil, size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          bytes: number() | nil,
          size_unit: String.t() | nil,
          size: number() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      bytes: if(is_nil(Map.get(map, "bytes")), do: nil, else: Map.get(map, "bytes")),
      size_unit: if(is_nil(Map.get(map, "size_unit")), do: nil, else: Map.get(map, "size_unit")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "bytes" => if(is_nil(value.bytes), do: nil, else: Inttegro.Codec.encode(value.bytes)),
      "size_unit" =>
        if(is_nil(value.size_unit), do: nil, else: Inttegro.Codec.encode(value.size_unit)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsInputPhysical do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct weight_unit: nil,
            weight: nil,
            size: nil,
            volume_unit: nil,
            volume: nil,
            length: nil,
            height: nil,
            width: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          weight_unit: String.t() | nil,
          weight: number() | nil,
          size: number() | nil,
          volume_unit: String.t() | nil,
          volume: number() | nil,
          length: number() | nil,
          height: number() | nil,
          width: number() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      weight_unit:
        if(is_nil(Map.get(map, "weight_unit")), do: nil, else: Map.get(map, "weight_unit")),
      weight: if(is_nil(Map.get(map, "weight")), do: nil, else: Map.get(map, "weight")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size")),
      volume_unit:
        if(is_nil(Map.get(map, "volume_unit")), do: nil, else: Map.get(map, "volume_unit")),
      volume: if(is_nil(Map.get(map, "volume")), do: nil, else: Map.get(map, "volume")),
      length: if(is_nil(Map.get(map, "length")), do: nil, else: Map.get(map, "length")),
      height: if(is_nil(Map.get(map, "height")), do: nil, else: Map.get(map, "height")),
      width: if(is_nil(Map.get(map, "width")), do: nil, else: Map.get(map, "width"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "weight_unit" =>
        if(is_nil(value.weight_unit), do: nil, else: Inttegro.Codec.encode(value.weight_unit)),
      "weight" => if(is_nil(value.weight), do: nil, else: Inttegro.Codec.encode(value.weight)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size)),
      "volume_unit" =>
        if(is_nil(value.volume_unit), do: nil, else: Inttegro.Codec.encode(value.volume_unit)),
      "volume" => if(is_nil(value.volume), do: nil, else: Inttegro.Codec.encode(value.volume)),
      "length" => if(is_nil(value.length), do: nil, else: Inttegro.Codec.encode(value.length)),
      "height" => if(is_nil(value.height), do: nil, else: Inttegro.Codec.encode(value.height)),
      "width" => if(is_nil(value.width), do: nil, else: Inttegro.Codec.encode(value.width))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.DimensionsPhysical do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct weight_unit: nil,
            weight: nil,
            size: nil,
            volume_unit: nil,
            volume: nil,
            length: nil,
            height: nil,
            width: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          weight_unit: String.t() | nil,
          weight: number() | nil,
          size: number() | nil,
          volume_unit: String.t() | nil,
          volume: number() | nil,
          length: number() | nil,
          height: number() | nil,
          width: number() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      weight_unit:
        if(is_nil(Map.get(map, "weight_unit")), do: nil, else: Map.get(map, "weight_unit")),
      weight: if(is_nil(Map.get(map, "weight")), do: nil, else: Map.get(map, "weight")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size")),
      volume_unit:
        if(is_nil(Map.get(map, "volume_unit")), do: nil, else: Map.get(map, "volume_unit")),
      volume: if(is_nil(Map.get(map, "volume")), do: nil, else: Map.get(map, "volume")),
      length: if(is_nil(Map.get(map, "length")), do: nil, else: Map.get(map, "length")),
      height: if(is_nil(Map.get(map, "height")), do: nil, else: Map.get(map, "height")),
      width: if(is_nil(Map.get(map, "width")), do: nil, else: Map.get(map, "width"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "weight_unit" =>
        if(is_nil(value.weight_unit), do: nil, else: Inttegro.Codec.encode(value.weight_unit)),
      "weight" => if(is_nil(value.weight), do: nil, else: Inttegro.Codec.encode(value.weight)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size)),
      "volume_unit" =>
        if(is_nil(value.volume_unit), do: nil, else: Inttegro.Codec.encode(value.volume_unit)),
      "volume" => if(is_nil(value.volume), do: nil, else: Inttegro.Codec.encode(value.volume)),
      "length" => if(is_nil(value.length), do: nil, else: Inttegro.Codec.encode(value.length)),
      "height" => if(is_nil(value.height), do: nil, else: Inttegro.Codec.encode(value.height)),
      "width" => if(is_nil(value.width), do: nil, else: Inttegro.Codec.encode(value.width))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.Media do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct hero_image: nil,
            thumbnail: nil,
            web_page_url: nil,
            brand_logo: nil,
            infographic: nil,
            promo_video: nil,
            demo_video: nil,
            gallery: nil,
            downloads: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          hero_image: String.t() | nil,
          thumbnail: String.t() | nil,
          web_page_url: String.t() | nil,
          brand_logo: String.t() | nil,
          infographic: String.t() | nil,
          promo_video: String.t() | nil,
          demo_video: String.t() | nil,
          gallery: [String.t()] | nil,
          downloads: [String.t()] | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      hero_image:
        if(is_nil(Map.get(map, "hero_image")), do: nil, else: Map.get(map, "hero_image")),
      thumbnail: if(is_nil(Map.get(map, "thumbnail")), do: nil, else: Map.get(map, "thumbnail")),
      web_page_url:
        if(is_nil(Map.get(map, "web_page_url")), do: nil, else: Map.get(map, "web_page_url")),
      brand_logo:
        if(is_nil(Map.get(map, "brand_logo")), do: nil, else: Map.get(map, "brand_logo")),
      infographic:
        if(is_nil(Map.get(map, "infographic")), do: nil, else: Map.get(map, "infographic")),
      promo_video:
        if(is_nil(Map.get(map, "promo_video")), do: nil, else: Map.get(map, "promo_video")),
      demo_video:
        if(is_nil(Map.get(map, "demo_video")), do: nil, else: Map.get(map, "demo_video")),
      gallery:
        if(is_nil(Map.get(map, "gallery")),
          do: nil,
          else: Enum.map(Map.get(map, "gallery"), fn item -> item end)
        ),
      downloads:
        if(is_nil(Map.get(map, "downloads")),
          do: nil,
          else: Enum.map(Map.get(map, "downloads"), fn item -> item end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "hero_image" =>
        if(is_nil(value.hero_image), do: nil, else: Inttegro.Codec.encode(value.hero_image)),
      "thumbnail" =>
        if(is_nil(value.thumbnail), do: nil, else: Inttegro.Codec.encode(value.thumbnail)),
      "web_page_url" =>
        if(is_nil(value.web_page_url), do: nil, else: Inttegro.Codec.encode(value.web_page_url)),
      "brand_logo" =>
        if(is_nil(value.brand_logo), do: nil, else: Inttegro.Codec.encode(value.brand_logo)),
      "infographic" =>
        if(is_nil(value.infographic), do: nil, else: Inttegro.Codec.encode(value.infographic)),
      "promo_video" =>
        if(is_nil(value.promo_video), do: nil, else: Inttegro.Codec.encode(value.promo_video)),
      "demo_video" =>
        if(is_nil(value.demo_video), do: nil, else: Inttegro.Codec.encode(value.demo_video)),
      "gallery" =>
        if(is_nil(value.gallery),
          do: nil,
          else: Enum.map(value.gallery, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "downloads" =>
        if(is_nil(value.downloads),
          do: nil,
          else: Enum.map(value.downloads, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.MediaInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct hero_image: nil,
            thumbnail: nil,
            web_page_url: nil,
            brand_logo: nil,
            infographic: nil,
            promo_video: nil,
            demo_video: nil,
            gallery: nil,
            downloads: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          hero_image: String.t() | nil,
          thumbnail: String.t() | nil,
          web_page_url: String.t() | nil,
          brand_logo: String.t() | nil,
          infographic: String.t() | nil,
          promo_video: String.t() | nil,
          demo_video: String.t() | nil,
          gallery: [String.t()] | nil,
          downloads: [String.t()] | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      hero_image:
        if(is_nil(Map.get(map, "hero_image")), do: nil, else: Map.get(map, "hero_image")),
      thumbnail: if(is_nil(Map.get(map, "thumbnail")), do: nil, else: Map.get(map, "thumbnail")),
      web_page_url:
        if(is_nil(Map.get(map, "web_page_url")), do: nil, else: Map.get(map, "web_page_url")),
      brand_logo:
        if(is_nil(Map.get(map, "brand_logo")), do: nil, else: Map.get(map, "brand_logo")),
      infographic:
        if(is_nil(Map.get(map, "infographic")), do: nil, else: Map.get(map, "infographic")),
      promo_video:
        if(is_nil(Map.get(map, "promo_video")), do: nil, else: Map.get(map, "promo_video")),
      demo_video:
        if(is_nil(Map.get(map, "demo_video")), do: nil, else: Map.get(map, "demo_video")),
      gallery:
        if(is_nil(Map.get(map, "gallery")),
          do: nil,
          else: Enum.map(Map.get(map, "gallery"), fn item -> item end)
        ),
      downloads:
        if(is_nil(Map.get(map, "downloads")),
          do: nil,
          else: Enum.map(Map.get(map, "downloads"), fn item -> item end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "hero_image" =>
        if(is_nil(value.hero_image), do: nil, else: Inttegro.Codec.encode(value.hero_image)),
      "thumbnail" =>
        if(is_nil(value.thumbnail), do: nil, else: Inttegro.Codec.encode(value.thumbnail)),
      "web_page_url" =>
        if(is_nil(value.web_page_url), do: nil, else: Inttegro.Codec.encode(value.web_page_url)),
      "brand_logo" =>
        if(is_nil(value.brand_logo), do: nil, else: Inttegro.Codec.encode(value.brand_logo)),
      "infographic" =>
        if(is_nil(value.infographic), do: nil, else: Inttegro.Codec.encode(value.infographic)),
      "promo_video" =>
        if(is_nil(value.promo_video), do: nil, else: Inttegro.Codec.encode(value.promo_video)),
      "demo_video" =>
        if(is_nil(value.demo_video), do: nil, else: Inttegro.Codec.encode(value.demo_video)),
      "gallery" =>
        if(is_nil(value.gallery),
          do: nil,
          else: Enum.map(value.gallery, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "downloads" =>
        if(is_nil(value.downloads),
          do: nil,
          else: Enum.map(value.downloads, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:number, :size, :products]
  defstruct number: nil, size: nil, products: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer(),
          size: integer(),
          products: [Inttegro.Products.Product.t()]
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
      products:
        Enum.map(Map.fetch!(map, "products"), fn item ->
          Inttegro.Products.Product.from_map(item)
        end)
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size),
      "products" => Enum.map(value.products, fn item -> Inttegro.Codec.encode(item) end)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.PriceSummary do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :active, :nominal]
  defstruct id: nil, active: nil, label: nil, nominal: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          active: boolean(),
          label: String.t() | nil,
          nominal: Inttegro.Money.Amount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      active: Map.fetch!(map, "active"),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      nominal: Inttegro.Money.Amount.from_map(Map.fetch!(map, "nominal"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "active" => Inttegro.Codec.encode(value.active),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "nominal" => Inttegro.Codec.encode(value.nominal)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.Delivery do
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

defmodule Inttegro.Products.Download do
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

defmodule Inttegro.Products.Render do
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

defmodule Inttegro.Products.Service do
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

defmodule Inttegro.Products.Stream do
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

defmodule Inttegro.Products.Shipment do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:type]
  defstruct type: nil, delivery: nil, download: nil, render: nil, service: nil, stream: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          type: Inttegro.Products.ShipmentType.t(),
          delivery: Inttegro.Products.Delivery.t() | nil,
          download: Inttegro.Products.Download.t() | nil,
          render: Inttegro.Products.Render.t() | nil,
          service: Inttegro.Products.Service.t() | nil,
          stream: Inttegro.Products.Stream.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Products.ShipmentType.decode(Map.fetch!(map, "type")),
      delivery:
        if(is_nil(Map.get(map, "delivery")),
          do: nil,
          else: Inttegro.Products.Delivery.from_map(Map.get(map, "delivery"))
        ),
      download:
        if(is_nil(Map.get(map, "download")),
          do: nil,
          else: Inttegro.Products.Download.from_map(Map.get(map, "download"))
        ),
      render:
        if(is_nil(Map.get(map, "render")),
          do: nil,
          else: Inttegro.Products.Render.from_map(Map.get(map, "render"))
        ),
      service:
        if(is_nil(Map.get(map, "service")),
          do: nil,
          else: Inttegro.Products.Service.from_map(Map.get(map, "service"))
        ),
      stream:
        if(is_nil(Map.get(map, "stream")),
          do: nil,
          else: Inttegro.Products.Stream.from_map(Map.get(map, "stream"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Products.ShipmentType.encode(value.type),
      "delivery" =>
        if(is_nil(value.delivery),
          do: nil,
          else: Inttegro.Codec.encode(value.delivery)
        ),
      "download" =>
        if(is_nil(value.download),
          do: nil,
          else: Inttegro.Codec.encode(value.download)
        ),
      "render" =>
        if(is_nil(value.render),
          do: nil,
          else: Inttegro.Codec.encode(value.render)
        ),
      "service" =>
        if(is_nil(value.service),
          do: nil,
          else: Inttegro.Codec.encode(value.service)
        ),
      "stream" =>
        if(is_nil(value.stream),
          do: nil,
          else: Inttegro.Codec.encode(value.stream)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.ShipmentInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:type]
  defstruct type: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.Products.ShipmentInputType.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type: Inttegro.Products.ShipmentInputType.decode(Map.fetch!(map, "type"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => Inttegro.Products.ShipmentInputType.encode(value.type)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.UpdateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:product_id]
  defstruct type: nil,
            name: nil,
            description: nil,
            about: nil,
            tax_code: nil,
            category: nil,
            shipment: nil,
            dimensions: nil,
            unit_dimension: nil,
            media: nil,
            images: nil,
            attributes: nil,
            custom_data: nil,
            product_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          type: Inttegro.Products.Type.t() | nil,
          name: String.t() | nil,
          description: String.t() | nil,
          about: String.t() | nil,
          tax_code: String.t() | nil,
          category: String.t() | nil,
          shipment: Inttegro.Products.ShipmentInput.t() | nil,
          dimensions: Inttegro.Products.DimensionsInput.t() | nil,
          unit_dimension: String.t() | nil,
          media: Inttegro.Products.MediaInput.t() | nil,
          images: [String.t()] | nil,
          attributes: [Inttegro.Products.AttributeInput.t()] | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          product_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      type:
        if(is_nil(Map.get(map, "type")),
          do: nil,
          else: Inttegro.Products.Type.decode(Map.get(map, "type"))
        ),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      category: if(is_nil(Map.get(map, "category")), do: nil, else: Map.get(map, "category")),
      shipment:
        if(is_nil(Map.get(map, "shipment")),
          do: nil,
          else: Inttegro.Products.ShipmentInput.from_map(Map.get(map, "shipment"))
        ),
      dimensions:
        if(is_nil(Map.get(map, "dimensions")),
          do: nil,
          else: Inttegro.Products.DimensionsInput.from_map(Map.get(map, "dimensions"))
        ),
      unit_dimension:
        if(is_nil(Map.get(map, "unit_dimension")), do: nil, else: Map.get(map, "unit_dimension")),
      media:
        if(is_nil(Map.get(map, "media")),
          do: nil,
          else: Inttegro.Products.MediaInput.from_map(Map.get(map, "media"))
        ),
      images:
        if(is_nil(Map.get(map, "images")),
          do: nil,
          else: Enum.map(Map.get(map, "images"), fn item -> item end)
        ),
      attributes:
        if(is_nil(Map.get(map, "attributes")),
          do: nil,
          else:
            Enum.map(Map.get(map, "attributes"), fn item ->
              Inttegro.Products.AttributeInput.from_map(item)
            end)
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      product_id: Map.fetch!(map, "product_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "type" => if(is_nil(value.type), do: nil, else: Inttegro.Products.Type.encode(value.type)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "category" =>
        if(is_nil(value.category), do: nil, else: Inttegro.Codec.encode(value.category)),
      "shipment" =>
        if(is_nil(value.shipment), do: nil, else: Inttegro.Codec.encode(value.shipment)),
      "dimensions" =>
        if(is_nil(value.dimensions), do: nil, else: Inttegro.Codec.encode(value.dimensions)),
      "unit_dimension" =>
        if(is_nil(value.unit_dimension),
          do: nil,
          else: Inttegro.Codec.encode(value.unit_dimension)
        ),
      "media" => if(is_nil(value.media), do: nil, else: Inttegro.Codec.encode(value.media)),
      "images" =>
        if(is_nil(value.images),
          do: nil,
          else: Enum.map(value.images, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "attributes" =>
        if(is_nil(value.attributes),
          do: nil,
          else: Enum.map(value.attributes, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "product_id" => Inttegro.Codec.encode(value.product_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Products.Updated do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :name, :type, :created_at]
  defstruct id: nil,
            name: nil,
            description: nil,
            about: nil,
            type: nil,
            reference: nil,
            tax_code: nil,
            category: nil,
            custom_data: nil,
            dimensions: nil,
            prices: nil,
            unit_dim: nil,
            created_at: nil,
            updated_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          description: String.t() | nil,
          about: String.t() | nil,
          type: Inttegro.Products.Type.t(),
          reference: String.t() | nil,
          tax_code: String.t() | nil,
          category: String.t() | nil,
          custom_data: Inttegro.CustomData.t() | nil,
          dimensions: Inttegro.Products.Dimensions.t() | nil,
          prices: [Inttegro.Products.PriceSummary.t()] | nil,
          unit_dim: String.t() | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      name: Map.fetch!(map, "name"),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      type: Inttegro.Products.Type.decode(Map.fetch!(map, "type")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      category: if(is_nil(Map.get(map, "category")), do: nil, else: Map.get(map, "category")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      dimensions:
        if(is_nil(Map.get(map, "dimensions")),
          do: nil,
          else: Inttegro.Products.Dimensions.from_map(Map.get(map, "dimensions"))
        ),
      prices:
        if(is_nil(Map.get(map, "prices")),
          do: nil,
          else:
            Enum.map(Map.get(map, "prices"), fn item ->
              Inttegro.Products.PriceSummary.from_map(item)
            end)
        ),
      unit_dim: if(is_nil(Map.get(map, "unit_dim")), do: nil, else: Map.get(map, "unit_dim")),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      updated_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "updated_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "updated_at"))
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "name" => Inttegro.Codec.encode(value.name),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "type" => Inttegro.Products.Type.encode(value.type),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "category" =>
        if(is_nil(value.category), do: nil, else: Inttegro.Codec.encode(value.category)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "dimensions" =>
        if(is_nil(value.dimensions), do: nil, else: Inttegro.Codec.encode(value.dimensions)),
      "prices" =>
        if(is_nil(value.prices),
          do: nil,
          else: Enum.map(value.prices, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "unit_dim" =>
        if(is_nil(value.unit_dim), do: nil, else: Inttegro.Codec.encode(value.unit_dim)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
