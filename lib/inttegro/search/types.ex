defmodule Inttegro.Search.Enum do
  @moduledoc "Converts the documented resource-search atoms to their exact API wire values and decodes those values without exposing raw payload handling to callers."
  @values %{
    "eq" => :eq,
    "in" => :in,
    "relevance" => :relevance,
    "updated_at" => :updated_at,
    "published_at" => :published_at,
    "asc" => :asc,
    "desc" => :desc,
    "customer" => :customer,
    "financial_account" => :financial_account,
    "order" => :order,
    "payout" => :payout,
    "product" => :product,
    "exact" => :exact,
    "lower_bound" => :lower_bound,
    "current" => :current,
    "delayed" => :delayed,
    "partial" => :partial,
    "unknown" => :unknown,
    "unavailable" => :unavailable
  }
  @reverse Map.new(@values, fn {wire, atom} -> {atom, wire} end)

  def encode(value) when is_atom(value), do: Map.fetch!(@reverse, value)
  def encode(value) when is_binary(value), do: value
  def decode(value) when is_binary(value), do: Map.get(@values, value, value)
end

defmodule Inttegro.Search.Filter do
  @moduledoc "A typed route-local search filter that applies the documented equality or inclusion operator to one supported resource field."
  @enforce_keys [:field, :operator, :values]
  defstruct [:field, :operator, :values]
  @type operator :: :eq | :in | String.t()
  @type t :: %__MODULE__{field: String.t(), operator: operator(), values: [String.t()]}
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def from_map(map),
    do:
      new!(
        field: Map.fetch!(map, "field"),
        operator: Inttegro.Search.Enum.decode(Map.fetch!(map, "operator")),
        values: Map.fetch!(map, "values")
      )

  def to_map(value),
    do: %{
      "field" => value.field,
      "operator" => Inttegro.Search.Enum.encode(value.operator),
      "values" => value.values
    }
end

defmodule Inttegro.Search.Facet do
  @moduledoc "A typed request for grouped counts over one route-local field, with an optional maximum number of returned buckets."
  @enforce_keys [:field]
  defstruct [:field, :limit]
  @type t :: %__MODULE__{field: String.t(), limit: integer() | nil}
  def new!(attrs), do: struct!(__MODULE__, attrs)
  def from_map(map), do: new!(field: Map.fetch!(map, "field"), limit: Map.get(map, "limit"))

  def to_map(value),
    do:
      %{"field" => value.field, "limit" => value.limit}
      |> Enum.reject(fn {_, item} -> is_nil(item) end)
      |> Map.new()
end

defmodule Inttegro.Search.Sort do
  @moduledoc "The selected resource-search ordering, pairing a supported sort field with its documented ascending or descending direction."
  @enforce_keys [:field, :direction]
  defstruct [:field, :direction]
  @type field :: :relevance | :updated_at | :published_at | String.t()
  @type direction :: :asc | :desc | String.t()
  @type t :: %__MODULE__{field: field(), direction: direction()}
  def new!(attrs), do: struct!(__MODULE__, attrs)

  def from_map(map),
    do:
      new!(
        field: Inttegro.Search.Enum.decode(Map.fetch!(map, "field")),
        direction: Inttegro.Search.Enum.decode(Map.fetch!(map, "direction"))
      )

  def to_map(value),
    do: %{
      "field" => Inttegro.Search.Enum.encode(value.field),
      "direction" => Inttegro.Search.Enum.encode(value.direction)
    }
end

defmodule Inttegro.Search.Request do
  @moduledoc "A typed resource-local search request containing text, filters, facets, ordering, page size, and an optional continuation cursor."
  defstruct [:text, :filters, :facets, :sort, :page_size, :cursor]

  @type t :: %__MODULE__{
          text: String.t() | nil,
          filters: [Inttegro.Search.Filter.t()] | nil,
          facets: [Inttegro.Search.Facet.t()] | nil,
          sort: Inttegro.Search.Sort.t() | nil,
          page_size: integer() | nil,
          cursor: String.t() | nil
        }
  def new!(attrs \\ %{}), do: struct!(__MODULE__, attrs)

  def to_map(value) do
    %{
      "text" => value.text,
      "filters" => encode_list(value.filters),
      "facets" => encode_list(value.facets),
      "sort" => if(value.sort, do: Inttegro.Search.Sort.to_map(value.sort)),
      "page_size" => value.page_size,
      "cursor" => value.cursor
    }
    |> Enum.reject(fn {_, item} -> is_nil(item) end)
    |> Map.new()
  end

  defp encode_list(nil), do: nil
  defp encode_list(values), do: Enum.map(values, &Inttegro.Codec.encode/1)
end

defmodule Inttegro.Search.Total do
  @moduledoc "The reported search result count together with the relation that states whether the value is exact or a lower bound."
  @enforce_keys [:value, :relation]
  defstruct [:value, :relation]
  @type relation :: :exact | :lower_bound | String.t()
  @type t :: %__MODULE__{value: integer(), relation: relation()}
  def from_map(map),
    do:
      struct!(__MODULE__,
        value: Map.fetch!(map, "value"),
        relation: Inttegro.Search.Enum.decode(Map.fetch!(map, "relation"))
      )

  def to_map(value),
    do: %{"value" => value.value, "relation" => Inttegro.Search.Enum.encode(value.relation)}
end

defmodule Inttegro.Search.ResourceTotal do
  @moduledoc "A typed per-resource search count that identifies the projected resource type and whether its reported value is exact."
  @enforce_keys [:resource_type, :value, :relation]
  defstruct [:resource_type, :value, :relation]

  @type t :: %__MODULE__{
          resource_type: atom() | String.t(),
          value: integer(),
          relation: Inttegro.Search.Total.relation()
        }
  def from_map(map),
    do:
      struct!(__MODULE__,
        resource_type: Inttegro.Search.Enum.decode(Map.fetch!(map, "resource_type")),
        value: Map.fetch!(map, "value"),
        relation: Inttegro.Search.Enum.decode(Map.fetch!(map, "relation"))
      )

  def to_map(value),
    do: %{
      "resource_type" => Inttegro.Search.Enum.encode(value.resource_type),
      "value" => value.value,
      "relation" => Inttegro.Search.Enum.encode(value.relation)
    }
end

defmodule Inttegro.Search.ResourceReference do
  @moduledoc "The canonical resource type and identifier carried by a search projection so the complete resource can be retrieved when needed."
  @enforce_keys [:type, :id]
  defstruct [:type, :id]
  @type t :: %__MODULE__{type: atom() | String.t(), id: String.t()}
  def from_map(map),
    do:
      struct!(__MODULE__,
        type: Inttegro.Search.Enum.decode(Map.fetch!(map, "type")),
        id: Map.fetch!(map, "id")
      )

  def to_map(value), do: %{"type" => Inttegro.Search.Enum.encode(value.type), "id" => value.id}
end

defmodule Inttegro.Search.Result do
  @moduledoc "A compact discovery projection returned by search. Retrieve the referenced canonical resource before making decisions or mutations."
  @enforce_keys [:resource, :title, :updated_at]
  defstruct [:resource, :title, :summary, :status, :customer_name, :amount, :url, :updated_at]

  @type t :: %__MODULE__{
          resource: Inttegro.Search.ResourceReference.t(),
          title: String.t(),
          summary: String.t() | nil,
          status: String.t() | nil,
          customer_name: String.t() | nil,
          amount: Inttegro.Money.Amount.t() | nil,
          url: String.t() | nil,
          updated_at: DateTime.t()
        }
  def from_map(map) do
    struct!(__MODULE__,
      resource: Inttegro.Search.ResourceReference.from_map(Map.fetch!(map, "resource")),
      title: Map.fetch!(map, "title"),
      summary: Map.get(map, "summary"),
      status: Map.get(map, "status"),
      customer_name: Map.get(map, "customer_name"),
      amount:
        if(Map.get(map, "amount"), do: Inttegro.Money.Amount.from_map(Map.get(map, "amount"))),
      url: Map.get(map, "url"),
      updated_at: Inttegro.Codec.decode_timestamp(Map.fetch!(map, "updated_at"))
    )
  end

  def to_map(value),
    do:
      Map.new(
        %{
          "resource" => Inttegro.Codec.encode(value.resource),
          "title" => value.title,
          "summary" => value.summary,
          "status" => value.status,
          "customer_name" => value.customer_name,
          "amount" => Inttegro.Codec.encode(value.amount),
          "url" => value.url,
          "updated_at" => Inttegro.Codec.encode(value.updated_at)
        },
        fn pair -> pair end
      )
      |> Enum.reject(fn {_, item} -> is_nil(item) end)
      |> Map.new()
end

defmodule Inttegro.Search.FacetBucket do
  @moduledoc "One typed facet bucket containing the exact returned field value and the number of matching projected resources."
  @enforce_keys [:value, :count]
  defstruct [:value, :count]
  @type t :: %__MODULE__{value: String.t(), count: integer()}
  def from_map(map),
    do: struct!(__MODULE__, value: Map.fetch!(map, "value"), count: Map.fetch!(map, "count"))

  def to_map(value), do: %{"value" => value.value, "count" => value.count}
end

defmodule Inttegro.Search.FacetResult do
  @moduledoc "The typed collection of grouped value buckets returned for one route-local facet field requested by the caller."
  @enforce_keys [:field, :buckets]
  defstruct [:field, :buckets]
  @type t :: %__MODULE__{field: String.t(), buckets: [Inttegro.Search.FacetBucket.t()]}
  def from_map(map),
    do:
      struct!(__MODULE__,
        field: Map.fetch!(map, "field"),
        buckets: Enum.map(Map.fetch!(map, "buckets"), &Inttegro.Search.FacetBucket.from_map/1)
      )

  def to_map(value),
    do: %{"field" => value.field, "buckets" => Enum.map(value.buckets, &Inttegro.Codec.encode/1)}
end

defmodule Inttegro.Search.ResourceFreshness do
  @moduledoc "Freshness metadata for one searched resource type, including when the projection was observed and last indexed when available."
  @enforce_keys [:resource_type, :state]
  defstruct [:resource_type, :state, :observed_at, :last_indexed_at]

  @type t :: %__MODULE__{
          resource_type: atom() | String.t(),
          state: atom() | String.t(),
          observed_at: DateTime.t() | nil,
          last_indexed_at: DateTime.t() | nil
        }
  def from_map(map),
    do:
      struct!(__MODULE__,
        resource_type: Inttegro.Search.Enum.decode(Map.fetch!(map, "resource_type")),
        state: Inttegro.Search.Enum.decode(Map.fetch!(map, "state")),
        observed_at: decode_optional(Map.get(map, "observed_at")),
        last_indexed_at: decode_optional(Map.get(map, "last_indexed_at"))
      )

  def to_map(value),
    do:
      %{
        "resource_type" => Inttegro.Search.Enum.encode(value.resource_type),
        "state" => Inttegro.Search.Enum.encode(value.state),
        "observed_at" => Inttegro.Codec.encode(value.observed_at),
        "last_indexed_at" => Inttegro.Codec.encode(value.last_indexed_at)
      }
      |> Enum.reject(fn {_, item} -> is_nil(item) end)
      |> Map.new()

  defp decode_optional(nil), do: nil
  defp decode_optional(value), do: Inttegro.Codec.decode_timestamp(value)
end

defmodule Inttegro.Search.Freshness do
  @moduledoc "Overall search-index freshness plus optional resource-specific timestamps that help callers judge the age of discovery projections."
  @enforce_keys [:state]
  defstruct [:state, :observed_at, :resources]

  @type t :: %__MODULE__{
          state: atom() | String.t(),
          observed_at: DateTime.t() | nil,
          resources: [Inttegro.Search.ResourceFreshness.t()] | nil
        }
  def from_map(map),
    do:
      struct!(__MODULE__,
        state: Inttegro.Search.Enum.decode(Map.fetch!(map, "state")),
        observed_at: decode_optional(Map.get(map, "observed_at")),
        resources: decode_resources(Map.get(map, "resources"))
      )

  def to_map(value),
    do:
      %{
        "state" => Inttegro.Search.Enum.encode(value.state),
        "observed_at" => Inttegro.Codec.encode(value.observed_at),
        "resources" =>
          if(value.resources, do: Enum.map(value.resources, &Inttegro.Codec.encode/1))
      }
      |> Enum.reject(fn {_, item} -> is_nil(item) end)
      |> Map.new()

  defp decode_optional(nil), do: nil
  defp decode_optional(value), do: Inttegro.Codec.decode_timestamp(value)
  defp decode_resources(nil), do: nil

  defp decode_resources(values),
    do: Enum.map(values, &Inttegro.Search.ResourceFreshness.from_map/1)
end

defmodule Inttegro.Search.Page do
  @moduledoc "A typed page of resource discovery projections with totals, facets, freshness metadata, ordering, and an opaque continuation cursor."
  @enforce_keys [
    :resource_types,
    :sort,
    :page_size,
    :result_count,
    :has_more,
    :total,
    :resource_totals,
    :results,
    :facets,
    :freshness
  ]
  defstruct [
    :resource_types,
    :sort,
    :page_size,
    :result_count,
    :has_more,
    :total,
    :resource_totals,
    :results,
    :facets,
    :next_cursor,
    :freshness
  ]

  @type t :: %__MODULE__{
          resource_types: [atom() | String.t()],
          sort: Inttegro.Search.Sort.t(),
          page_size: integer(),
          result_count: integer(),
          has_more: boolean(),
          total: Inttegro.Search.Total.t(),
          resource_totals: [Inttegro.Search.ResourceTotal.t()],
          results: [Inttegro.Search.Result.t()],
          facets: [Inttegro.Search.FacetResult.t()],
          next_cursor: String.t() | nil,
          freshness: Inttegro.Search.Freshness.t()
        }
  def from_map(map) do
    struct!(__MODULE__,
      resource_types: Enum.map(Map.fetch!(map, "resource_types"), &Inttegro.Search.Enum.decode/1),
      sort: Inttegro.Search.Sort.from_map(Map.fetch!(map, "sort")),
      page_size: Map.fetch!(map, "page_size"),
      result_count: Map.fetch!(map, "result_count"),
      has_more: Map.fetch!(map, "has_more"),
      total: Inttegro.Search.Total.from_map(Map.fetch!(map, "total")),
      resource_totals:
        Enum.map(Map.fetch!(map, "resource_totals"), &Inttegro.Search.ResourceTotal.from_map/1),
      results: Enum.map(Map.fetch!(map, "results"), &Inttegro.Search.Result.from_map/1),
      facets: Enum.map(Map.fetch!(map, "facets"), &Inttegro.Search.FacetResult.from_map/1),
      next_cursor: Map.get(map, "next_cursor"),
      freshness: Inttegro.Search.Freshness.from_map(Map.fetch!(map, "freshness"))
    )
  end
end
