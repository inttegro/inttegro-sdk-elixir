# Generated Inttegro types for this domain. Do not edit manually.

defmodule Inttegro.Customers.CreateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name]
  defstruct billing_address: nil,
            custom_data: nil,
            email_address: nil,
            phone_number: nil,
            reference: nil,
            shipping_address: nil,
            title: nil,
            name: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          billing_address: Inttegro.Customers.AddressInput.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          email_address: String.t() | nil,
          phone_number: String.t() | nil,
          reference: String.t() | nil,
          shipping_address: Inttegro.Customers.AddressInput.t() | nil,
          title: String.t() | nil,
          name: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      billing_address:
        if(is_nil(Map.get(map, "billing_address")),
          do: nil,
          else: Inttegro.Customers.AddressInput.from_map(Map.get(map, "billing_address"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      email_address:
        if(is_nil(Map.get(map, "email_address")), do: nil, else: Map.get(map, "email_address")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      shipping_address:
        if(is_nil(Map.get(map, "shipping_address")),
          do: nil,
          else: Inttegro.Customers.AddressInput.from_map(Map.get(map, "shipping_address"))
        ),
      title: if(is_nil(Map.get(map, "title")), do: nil, else: Map.get(map, "title")),
      name: Map.fetch!(map, "name")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "billing_address" =>
        if(is_nil(value.billing_address),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_address)
        ),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "email_address" =>
        if(is_nil(value.email_address), do: nil, else: Inttegro.Codec.encode(value.email_address)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "shipping_address" =>
        if(is_nil(value.shipping_address),
          do: nil,
          else: Inttegro.Codec.encode(value.shipping_address)
        ),
      "title" => if(is_nil(value.title), do: nil, else: Inttegro.Codec.encode(value.title)),
      "name" => Inttegro.Codec.encode(value.name)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.Customer do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:balance, :created_at, :guest, :id, :name]
  defstruct balance: nil,
            billing_address: nil,
            created_at: nil,
            custom_data: nil,
            email_address: nil,
            guest: nil,
            id: nil,
            name: nil,
            phone_number: nil,
            reference: nil,
            shipping_address: nil,
            suffix: nil,
            title: nil,
            updated_at: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          balance: %{optional(String.t()) => Inttegro.Customers.BalanceValue.t()},
          billing_address: Inttegro.Customers.Address.t() | nil,
          created_at: DateTime.t(),
          custom_data: Inttegro.CustomData.t() | nil,
          email_address: String.t() | nil,
          guest: boolean(),
          id: String.t(),
          name: String.t(),
          phone_number: String.t() | nil,
          reference: String.t() | nil,
          shipping_address: Inttegro.Customers.Address.t() | nil,
          suffix: String.t() | nil,
          title: String.t() | nil,
          updated_at: DateTime.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      balance:
        Map.new(Map.fetch!(map, "balance"), fn {key, value} ->
          {key, Inttegro.Customers.BalanceValue.from_map(value)}
        end),
      billing_address:
        if(is_nil(Map.get(map, "billing_address")),
          do: nil,
          else: Inttegro.Customers.Address.from_map(Map.get(map, "billing_address"))
        ),
      created_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "created_at")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomData.from_map(Map.get(map, "custom_data"))
        ),
      email_address:
        if(is_nil(Map.get(map, "email_address")), do: nil, else: Map.get(map, "email_address")),
      guest: Map.fetch!(map, "guest"),
      id: Map.fetch!(map, "id"),
      name: Map.fetch!(map, "name"),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      shipping_address:
        if(is_nil(Map.get(map, "shipping_address")),
          do: nil,
          else: Inttegro.Customers.Address.from_map(Map.get(map, "shipping_address"))
        ),
      suffix: if(is_nil(Map.get(map, "suffix")), do: nil, else: Map.get(map, "suffix")),
      title: if(is_nil(Map.get(map, "title")), do: nil, else: Map.get(map, "title")),
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
      "balance" =>
        Map.new(value.balance, fn {key, value} ->
          {to_string(key), Inttegro.Codec.encode(value)}
        end),
      "billing_address" =>
        if(is_nil(value.billing_address),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_address)
        ),
      "created_at" => Inttegro.Codec.encode(value.created_at),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "email_address" =>
        if(is_nil(value.email_address), do: nil, else: Inttegro.Codec.encode(value.email_address)),
      "guest" => Inttegro.Codec.encode(value.guest),
      "id" => Inttegro.Codec.encode(value.id),
      "name" => Inttegro.Codec.encode(value.name),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "shipping_address" =>
        if(is_nil(value.shipping_address),
          do: nil,
          else: Inttegro.Codec.encode(value.shipping_address)
        ),
      "suffix" => if(is_nil(value.suffix), do: nil, else: Inttegro.Codec.encode(value.suffix)),
      "title" => if(is_nil(value.title), do: nil, else: Inttegro.Codec.encode(value.title)),
      "updated_at" =>
        if(is_nil(value.updated_at), do: nil, else: Inttegro.Codec.encode(value.updated_at))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.Address do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:country]
  defstruct city: nil,
            country: nil,
            line1: nil,
            line2: nil,
            name: nil,
            phone_number: nil,
            post_code: nil,
            region: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t(),
          line1: String.t() | nil,
          line2: String.t() | nil,
          name: String.t() | nil,
          phone_number: String.t() | nil,
          post_code: String.t() | nil,
          region: String.t() | nil
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      city: if(is_nil(Map.get(map, "city")), do: nil, else: Map.get(map, "city")),
      country: Map.fetch!(map, "country"),
      line1: if(is_nil(Map.get(map, "line1")), do: nil, else: Map.get(map, "line1")),
      line2: if(is_nil(Map.get(map, "line2")), do: nil, else: Map.get(map, "line2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "city" => if(is_nil(value.city), do: nil, else: Inttegro.Codec.encode(value.city)),
      "country" => Inttegro.Codec.encode(value.country),
      "line1" => if(is_nil(value.line1), do: nil, else: Inttegro.Codec.encode(value.line1)),
      "line2" => if(is_nil(value.line2), do: nil, else: Inttegro.Codec.encode(value.line2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region))
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.AddressInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:country]
  defstruct city: nil,
            line1: nil,
            line2: nil,
            name: nil,
            phone_number: nil,
            post_code: nil,
            region: nil,
            country: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          city: String.t() | nil,
          line1: String.t() | nil,
          line2: String.t() | nil,
          name: String.t() | nil,
          phone_number: String.t() | nil,
          post_code: String.t() | nil,
          region: String.t() | nil,
          country: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      city: if(is_nil(Map.get(map, "city")), do: nil, else: Map.get(map, "city")),
      line1: if(is_nil(Map.get(map, "line1")), do: nil, else: Map.get(map, "line1")),
      line2: if(is_nil(Map.get(map, "line2")), do: nil, else: Map.get(map, "line2")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      post_code: if(is_nil(Map.get(map, "post_code")), do: nil, else: Map.get(map, "post_code")),
      region: if(is_nil(Map.get(map, "region")), do: nil, else: Map.get(map, "region")),
      country: Map.fetch!(map, "country")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "city" => if(is_nil(value.city), do: nil, else: Inttegro.Codec.encode(value.city)),
      "line1" => if(is_nil(value.line1), do: nil, else: Inttegro.Codec.encode(value.line1)),
      "line2" => if(is_nil(value.line2), do: nil, else: Inttegro.Codec.encode(value.line2)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "post_code" =>
        if(is_nil(value.post_code), do: nil, else: Inttegro.Codec.encode(value.post_code)),
      "region" => if(is_nil(value.region), do: nil, else: Inttegro.Codec.encode(value.region)),
      "country" => Inttegro.Codec.encode(value.country)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.BalanceValue do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:as_of, :available]
  defstruct as_of: nil, available: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          as_of: DateTime.t(),
          available: Inttegro.Money.Amount.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      as_of: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "as_of")),
      available: Inttegro.Money.Amount.from_map(Map.fetch!(map, "available"))
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "as_of" => Inttegro.Codec.encode(value.as_of),
      "available" => Inttegro.Codec.encode(value.available)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.DataInput do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:name, :email_address, :phone_number]
  defstruct reference: nil, custom_data: nil, name: nil, email_address: nil, phone_number: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          reference: String.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
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
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
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
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "name" => Inttegro.Codec.encode(value.name),
      "email_address" => Inttegro.Codec.encode(value.email_address),
      "phone_number" => Inttegro.Codec.encode(value.phone_number)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.Page do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :domain)
  @enforce_keys [:customers, :number, :size]
  defstruct customers: nil, number: nil, size: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :domain)
  @type t :: %__MODULE__{
          customers: [Inttegro.Customers.Customer.t()],
          number: integer(),
          size: integer()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      customers:
        Enum.map(Map.fetch!(map, "customers"), fn item ->
          Inttegro.Customers.Customer.from_map(item)
        end),
      number: Map.fetch!(map, "number"),
      size: Map.fetch!(map, "size")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "customers" => Enum.map(value.customers, fn item -> Inttegro.Codec.encode(item) end),
      "number" => Inttegro.Codec.encode(value.number),
      "size" => Inttegro.Codec.encode(value.size)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.LookupRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:customer_id]
  defstruct customer_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          customer_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      customer_id: Map.fetch!(map, "customer_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "customer_id" => Inttegro.Codec.encode(value.customer_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end

defmodule Inttegro.Customers.PageRequest do
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

defmodule Inttegro.Customers.UpdateRequest do
  @moduledoc Inttegro.Docs.module_doc(__MODULE__, :request)
  @enforce_keys [:customer_id]
  defstruct billing_address: nil,
            custom_data: nil,
            email_address: nil,
            name: nil,
            phone_number: nil,
            reference: nil,
            shipping_address: nil,
            suffix: nil,
            title: nil,
            customer_id: nil

  @typedoc Inttegro.Docs.type_doc(__MODULE__, :request)
  @type t :: %__MODULE__{
          billing_address: Inttegro.Customers.AddressInput.t() | nil,
          custom_data: Inttegro.CustomDataInput.t() | nil,
          email_address: String.t() | nil,
          name: String.t() | nil,
          phone_number: String.t() | nil,
          reference: String.t() | nil,
          shipping_address: Inttegro.Customers.AddressInput.t() | nil,
          suffix: String.t() | nil,
          title: String.t() | nil,
          customer_id: String.t()
        }
  @doc Inttegro.Docs.constructor_doc(__MODULE__)
  @spec new!(map() | keyword()) :: t()
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)
  @doc false
  @spec from_map(map()) :: t()
  def from_map(map) when is_map(map) do
    %__MODULE__{
      billing_address:
        if(is_nil(Map.get(map, "billing_address")),
          do: nil,
          else: Inttegro.Customers.AddressInput.from_map(Map.get(map, "billing_address"))
        ),
      custom_data:
        if(is_nil(Map.get(map, "custom_data")),
          do: nil,
          else: Inttegro.CustomDataInput.from_map(Map.get(map, "custom_data"))
        ),
      email_address:
        if(is_nil(Map.get(map, "email_address")), do: nil, else: Map.get(map, "email_address")),
      name: if(is_nil(Map.get(map, "name")), do: nil, else: Map.get(map, "name")),
      phone_number:
        if(is_nil(Map.get(map, "phone_number")), do: nil, else: Map.get(map, "phone_number")),
      reference: if(is_nil(Map.get(map, "reference")), do: nil, else: Map.get(map, "reference")),
      shipping_address:
        if(is_nil(Map.get(map, "shipping_address")),
          do: nil,
          else: Inttegro.Customers.AddressInput.from_map(Map.get(map, "shipping_address"))
        ),
      suffix: if(is_nil(Map.get(map, "suffix")), do: nil, else: Map.get(map, "suffix")),
      title: if(is_nil(Map.get(map, "title")), do: nil, else: Map.get(map, "title")),
      customer_id: Map.fetch!(map, "customer_id")
    }
  end

  @doc false
  @spec to_map(t()) :: map()
  def to_map(value) do
    %{
      "billing_address" =>
        if(is_nil(value.billing_address),
          do: nil,
          else: Inttegro.Codec.encode(value.billing_address)
        ),
      "custom_data" =>
        if(is_nil(value.custom_data), do: nil, else: Inttegro.Codec.encode(value.custom_data)),
      "email_address" =>
        if(is_nil(value.email_address), do: nil, else: Inttegro.Codec.encode(value.email_address)),
      "name" => if(is_nil(value.name), do: nil, else: Inttegro.Codec.encode(value.name)),
      "phone_number" =>
        if(is_nil(value.phone_number), do: nil, else: Inttegro.Codec.encode(value.phone_number)),
      "reference" =>
        if(is_nil(value.reference), do: nil, else: Inttegro.Codec.encode(value.reference)),
      "shipping_address" =>
        if(is_nil(value.shipping_address),
          do: nil,
          else: Inttegro.Codec.encode(value.shipping_address)
        ),
      "suffix" => if(is_nil(value.suffix), do: nil, else: Inttegro.Codec.encode(value.suffix)),
      "title" => if(is_nil(value.title), do: nil, else: Inttegro.Codec.encode(value.title)),
      "customer_id" => Inttegro.Codec.encode(value.customer_id)
    }
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new()
  end
end
