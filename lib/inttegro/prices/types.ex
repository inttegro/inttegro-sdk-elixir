# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Prices.Catalog do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :active, :nominal, :created_at]
  defstruct id: nil,
            label: nil,
            about: nil,
            active: nil,
            nominal: nil,
            product_id: nil,
            product: nil,
            created_at: nil,
            updated_at: nil,
            archived_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          label: String.t() | nil,
          about: String.t() | nil,
          active: boolean(),
          nominal: Inttegro.Money.Amount.t(),
          product_id: String.t() | nil,
          product: Inttegro.Prices.EmbeddedProduct.t() | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t() | nil,
          archived_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      active: Map.fetch!(map, "active"),
      nominal: Inttegro.Money.Amount.from_map(Map.fetch!(map, "nominal")),
      product_id:
        if(is_nil(Map.get(map, "product_id")), do: nil, else: Map.get(map, "product_id")),
      product:
        if(is_nil(Map.get(map, "product")),
          do: nil,
          else: Inttegro.Prices.EmbeddedProduct.from_map(Map.get(map, "product"))
        ),
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
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "active" => Inttegro.Codec.encode(value.active),
      "nominal" => Inttegro.Codec.encode(value.nominal),
      "product_id" =>
        if(is_nil(value.product_id), do: nil, else: Inttegro.Codec.encode(value.product_id)),
      "product" => if(is_nil(value.product), do: nil, else: Inttegro.Codec.encode(value.product)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at)),
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.CatalogParams do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:amount]
  defstruct product_id: nil, label: nil, about: nil, amount: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          product_id: String.t() | nil,
          label: String.t() | nil,
          about: String.t() | nil,
          amount: Inttegro.Money.AmountParams.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      product_id:
        if(is_nil(Map.get(map, "product_id")), do: nil, else: Map.get(map, "product_id")),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      amount: Inttegro.Money.AmountParams.from_map(Map.fetch!(map, "amount"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "product_id" =>
        if(is_nil(value.product_id), do: nil, else: Inttegro.Codec.encode(value.product_id)),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "amount" => Inttegro.Codec.encode(value.amount)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:price_id]
  defstruct price_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          price_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      price_id: Map.fetch!(map, "price_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "price_id" => Inttegro.Codec.encode(value.price_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.Price do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:currency, :value]
  defstruct currency: nil, value: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          currency: Inttegro.Money.Currency.t(),
          value: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      currency: Inttegro.Money.Currency.decode(Map.fetch!(map, "currency")),
      value: Map.fetch!(map, "value")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "currency" => Inttegro.Money.Currency.encode(value.currency),
      "value" => Inttegro.Codec.encode(value.value)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.ActionRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:price_id]
  defstruct price_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          price_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      price_id: Map.fetch!(map, "price_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "price_id" => Inttegro.Codec.encode(value.price_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.EmbeddedProduct do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :active, :created_at, :name, :type]
  defstruct id: nil,
            about: nil,
            active: nil,
            archived_at: nil,
            attributes: nil,
            category: nil,
            created_at: nil,
            custom_data: nil,
            description: nil,
            dimensions: nil,
            media: nil,
            name: nil,
            published_at: nil,
            reference: nil,
            shipment: nil,
            tax_code: nil,
            type: nil,
            unit_dim: nil,
            updated_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          about: String.t() | nil,
          active: boolean(),
          archived_at: DateTime.t() | nil,
          attributes: [Inttegro.Prices.EmbeddedProductAttributesItem.t()] | nil,
          category: String.t() | nil,
          created_at: DateTime.t(),
          custom_data: Inttegro.CustomData.t() | nil,
          description: String.t() | nil,
          dimensions: %{optional(String.t()) => term()} | nil,
          media: %{optional(String.t()) => term()} | nil,
          name: String.t(),
          published_at: DateTime.t() | nil,
          reference: String.t() | nil,
          shipment: %{optional(String.t()) => term()} | nil,
          tax_code: String.t() | nil,
          type: Inttegro.Products.Type.t(),
          unit_dim: String.t() | nil,
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
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      active: Map.fetch!(map, "active"),
      archived_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "archived_at"))
        ),
      attributes:
        if(is_nil(Map.get(map, "attributes")),
          do: nil,
          else:
            Enum.map(Map.get(map, "attributes"), fn item ->
              Inttegro.Prices.EmbeddedProductAttributesItem.from_map(item)
            end)
        ),
      category: if(is_nil(Map.get(map, "category")), do: nil, else: Map.get(map, "category")),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      description:
        if(is_nil(Map.get(map, "description")), do: nil, else: Map.get(map, "description")),
      dimensions:
        if(is_nil(Map.get(map, "dimensions")),
          do: nil,
          else: Map.new(Map.get(map, "dimensions"), fn {key, value} -> {key, value} end)
        ),
      media:
        if(is_nil(Map.get(map, "media")),
          do: nil,
          else: Map.new(Map.get(map, "media"), fn {key, value} -> {key, value} end)
        ),
      name: Map.fetch!(map, "name"),
      published_at:
        if(is_nil(Inttegro.Codec.decode_timestamp(Map.get(map, "published_at"))),
          do: nil,
          else: Inttegro.Codec.decode_timestamp(Map.get(map, "published_at"))
        ),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      shipment:
        if(is_nil(Map.get(map, "shipment")),
          do: nil,
          else: Map.new(Map.get(map, "shipment"), fn {key, value} -> {key, value} end)
        ),
      tax_code: if(is_nil(Map.get(map, "tax_code")), do: nil, else: Map.get(map, "tax_code")),
      type: Inttegro.Products.Type.decode(Map.fetch!(map, "type")),
      unit_dim: if(is_nil(Map.get(map, "unit_dim")), do: nil, else: Map.get(map, "unit_dim")),
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
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "active" => Inttegro.Codec.encode(value.active),
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at)),
      "attributes" =>
        if(is_nil(value.attributes),
          do: nil,
          else: Enum.map(value.attributes, fn item -> Inttegro.Codec.encode(item) end)
        ),
      "category" =>
        if(is_nil(value.category), do: nil, else: Inttegro.Codec.encode(value.category)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "description" =>
        if(is_nil(value.description), do: nil, else: Inttegro.Codec.encode(value.description)),
      "dimensions" =>
        if(is_nil(value.dimensions),
          do: nil,
          else:
            Map.new(value.dimensions, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "media" =>
        if(is_nil(value.media),
          do: nil,
          else:
            Map.new(value.media, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "name" => Inttegro.Codec.encode(value.name),
      "published_at" =>
        if(is_nil(value.published_at), do: nil, else: Inttegro.Codec.encode(value.published_at)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "shipment" =>
        if(is_nil(value.shipment),
          do: nil,
          else:
            Map.new(value.shipment, fn {key, value} ->
              {to_string(key), Inttegro.Codec.encode(value)}
            end)
        ),
      "tax_code" =>
        if(is_nil(value.tax_code), do: nil, else: Inttegro.Codec.encode(value.tax_code)),
      "type" => Inttegro.Products.Type.encode(value.type),
      "unit_dim" =>
        if(is_nil(value.unit_dim), do: nil, else: Inttegro.Codec.encode(value.unit_dim)),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.EmbeddedProductAttributesItem do
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

defmodule Inttegro.Prices.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  defstruct number: nil, size: nil, prices: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          number: integer() | nil,
          size: integer() | nil,
          prices: [Inttegro.Prices.Catalog.t()] | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      number: if(is_nil(Map.get(map, "number")), do: nil, else: Map.get(map, "number")),
      size: if(is_nil(Map.get(map, "size")), do: nil, else: Map.get(map, "size")),
      prices:
        if(is_nil(Map.get(map, "prices")),
          do: nil,
          else:
            Enum.map(Map.get(map, "prices"), fn item ->
              Inttegro.Prices.Catalog.from_map(item)
            end)
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "number" => if(is_nil(value.number), do: nil, else: Inttegro.Codec.encode(value.number)),
      "size" => if(is_nil(value.size), do: nil, else: Inttegro.Codec.encode(value.size)),
      "prices" =>
        if(is_nil(value.prices),
          do: nil,
          else: Enum.map(value.prices, fn item -> Inttegro.Codec.encode(item) end)
        )
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.PageItem do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:id, :active, :nominal, :created_at]
  defstruct id: nil,
            label: nil,
            about: nil,
            active: nil,
            nominal: nil,
            product_id: nil,
            product: nil,
            created_at: nil,
            updated_at: nil,
            archived_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          id: String.t(),
          label: String.t() | nil,
          about: String.t() | nil,
          active: boolean(),
          nominal: Inttegro.Money.Amount.t(),
          product_id: String.t() | nil,
          product: Inttegro.Prices.EmbeddedProduct.t() | nil,
          created_at: DateTime.t(),
          updated_at: DateTime.t() | nil,
          archived_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      id: Map.fetch!(map, "id"),
      label: if(is_nil(Map.get(map, "label")), do: nil, else: Map.get(map, "label")),
      about: if(is_nil(Map.get(map, "about")), do: nil, else: Map.get(map, "about")),
      active: Map.fetch!(map, "active"),
      nominal: Inttegro.Money.Amount.from_map(Map.fetch!(map, "nominal")),
      product_id:
        if(is_nil(Map.get(map, "product_id")), do: nil, else: Map.get(map, "product_id")),
      product:
        if(is_nil(Map.get(map, "product")),
          do: nil,
          else: Inttegro.Prices.EmbeddedProduct.from_map(Map.get(map, "product"))
        ),
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
        )
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "id" => Inttegro.Codec.encode(value.id),
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "active" => Inttegro.Codec.encode(value.active),
      "nominal" => Inttegro.Codec.encode(value.nominal),
      "product_id" =>
        if(is_nil(value.product_id), do: nil, else: Inttegro.Codec.encode(value.product_id)),
      "product" => if(is_nil(value.product), do: nil, else: Inttegro.Codec.encode(value.product)),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at)),
      "archived_at" =>
        if(is_nil(value.archived_at), do: nil, else: Inttegro.Codec.encode(value.archived_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.PageRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  defstruct page_number: nil, page_size: nil, product_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          page_number: integer() | nil,
          page_size: integer() | nil,
          product_id: String.t() | nil
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
      page_size: if(is_nil(Map.get(map, "page_size")), do: nil, else: Map.get(map, "page_size")),
      product_id:
        if(is_nil(Map.get(map, "product_id")), do: nil, else: Map.get(map, "product_id"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "page_number" =>
        if(is_nil(value.page_number), do: nil, else: Inttegro.Codec.encode(value.page_number)),
      "page_size" =>
        if(is_nil(value.page_size), do: nil, else: Inttegro.Codec.encode(value.page_size)),
      "product_id" =>
        if(is_nil(value.product_id), do: nil, else: Inttegro.Codec.encode(value.product_id))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.Params do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:currency, :value]
  defstruct currency: nil, value: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          currency: Inttegro.Money.Currency.t(),
          value: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      currency: Inttegro.Money.Currency.decode(Map.fetch!(map, "currency")),
      value: Map.fetch!(map, "value")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "currency" => Inttegro.Money.Currency.encode(value.currency),
      "value" => Inttegro.Codec.encode(value.value)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Prices.UpdateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:price_id]
  defstruct label: nil, about: nil, price_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          label: String.t() | nil,
          about: String.t() | nil,
          price_id: String.t()
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
      price_id: Map.fetch!(map, "price_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "label" => if(is_nil(value.label), do: nil, else: Inttegro.Codec.encode(value.label)),
      "about" => if(is_nil(value.about), do: nil, else: Inttegro.Codec.encode(value.about)),
      "price_id" => Inttegro.Codec.encode(value.price_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
