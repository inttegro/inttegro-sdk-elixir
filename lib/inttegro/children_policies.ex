defmodule Inttegro.ChildrenPolicies do
  @moduledoc """
  Looks up the active children policy assigned to the authenticated application and decodes its
  capability bounds into typed policy values.
  """
  alias Inttegro.Client

  @spec lookup(Client.t(), keyword()) ::
          {:ok, Inttegro.ChildrenPolicies.ChildrenPolicy.t()} | {:error, Exception.t()}
  @doc "Returns the authenticated application's current active children policy."
  def lookup(client, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/children_policies/lookup",
             %{},
             options,
             "children_policies.lookup",
             "children_policy",
             true
           ) do
      {:ok, Inttegro.ChildrenPolicies.ChildrenPolicy.from_map(value)}
    end
  end
end
