defmodule Inttegro.ChildrenPolicies do
  @moduledoc """
  Looks up the active children policy assigned to the authenticated application and decodes its
  capability bounds into typed policy values.
  """
  alias Inttegro.Client

  @spec lookup(Client.t(), Inttegro.ChildrenPolicies.LookupRequest.t() | keyword(), keyword()) ::
          {:ok, Inttegro.ChildrenPolicies.ChildrenPolicy.t()} | {:error, Exception.t()}
  @doc "Returns the authenticated application's latest or an exact children-policy version."
  def lookup(client, request_or_options \\ [], options \\ [])

  def lookup(client, options, []) when is_list(options),
    do: lookup(client, Inttegro.ChildrenPolicies.LookupRequest.new!(), options)

  def lookup(client, %Inttegro.ChildrenPolicies.LookupRequest{} = request, options) do
    validate_version!(request.version)

    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/children_policies/lookup",
             Inttegro.Codec.encode(request),
             options,
             "children_policies.lookup",
             "children_policy",
             true
           ) do
      {:ok, Inttegro.ChildrenPolicies.ChildrenPolicy.from_map(value)}
    end
  end

  @spec page(Client.t(), Inttegro.ChildrenPolicies.PageRequest.t(), keyword()) ::
          {:ok, Inttegro.ChildrenPolicies.Page.t()} | {:error, Exception.t()}
  @doc "Lists immutable children-policy versions, newest first."
  def page(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/children_policies/page",
             Inttegro.Codec.encode(request),
             options,
             "children_policies.page",
             "page",
             true
           ) do
      {:ok, Inttegro.ChildrenPolicies.Page.from_map(value)}
    end
  end

  defp validate_version!(nil), do: :ok
  defp validate_version!(version) when is_integer(version) and version >= 1, do: :ok
  defp validate_version!(_version), do: raise(ArgumentError, "version must be a positive integer")
end
