defmodule Inttegro.OperatingPolicies do
  @moduledoc """
  Creates, looks up, and versions reusable operating policies that a parent application may apply
  to child applications within its assigned children policy.
  """
  alias Inttegro.Client

  @spec create(Client.t(), Inttegro.OperatingPolicies.CreateRequest.t(), keyword()) ::
          {:ok, Inttegro.OperatingPolicies.OperatingPolicy.t()} | {:error, Exception.t()}
  @doc "Creates a reusable operating policy owned by the authenticated application."
  def create(client, request, options \\ []),
    do:
      request(client, "/operating_policies/create", request, options, "operating_policies.create")

  @spec lookup(Client.t(), String.t() | Inttegro.OperatingPolicies.LookupRequest.t(), keyword()) ::
          {:ok, Inttegro.OperatingPolicies.OperatingPolicy.t()} | {:error, Exception.t()}
  @doc "Returns the latest active version of an operating policy."
  def lookup(client, id_or_request, options \\ [])

  def lookup(client, id, options) when is_binary(id),
    do:
      lookup(
        client,
        Inttegro.OperatingPolicies.LookupRequest.new!(operating_policy_id: id),
        options
      )

  def lookup(client, request, options),
    do:
      request(client, "/operating_policies/lookup", request, options, "operating_policies.lookup")

  @spec update(Client.t(), Inttegro.OperatingPolicies.UpdateRequest.t(), keyword()) ::
          {:ok, Inttegro.OperatingPolicies.OperatingPolicy.t()} | {:error, Exception.t()}
  @doc "Creates and activates the next version of an operating policy."
  def update(client, request, options \\ []),
    do:
      request(client, "/operating_policies/update", request, options, "operating_policies.update")

  defp request(client, path, request, options, operation) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             path,
             Inttegro.Codec.encode(request),
             options,
             operation,
             "operating_policy",
             true
           ) do
      {:ok, Inttegro.OperatingPolicies.OperatingPolicy.from_map(value)}
    end
  end
end
