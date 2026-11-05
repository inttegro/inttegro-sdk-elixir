defmodule Inttegro.PolicyHistoryTest do
  use ExUnit.Case, async: true

  test "lookup requests omit or serialize an exact version" do
    assert Inttegro.ChildrenPolicies.LookupRequest.new!() |> Inttegro.Codec.encode() == %{}

    assert Inttegro.ChildrenPolicies.LookupRequest.new!(version: 2) |> Inttegro.Codec.encode() ==
             %{"version" => 2}

    assert Inttegro.OperatingPolicies.LookupRequest.new!(operating_policy_id: "op_1")
           |> Inttegro.Codec.encode() == %{"operating_policy_id" => "op_1"}

    assert Inttegro.OperatingPolicies.LookupRequest.new!(
             operating_policy_id: "op_1",
             version: 3
           )
           |> Inttegro.Codec.encode() == %{"operating_policy_id" => "op_1", "version" => 3}

    assert_raise ArgumentError, fn ->
      Inttegro.ChildrenPolicies.LookupRequest.new!(version: 0)
    end
  end

  test "page requests serialize and responses decode version collections" do
    assert Inttegro.ChildrenPolicies.PageRequest.new!(number: 0, size: 20)
           |> Inttegro.Codec.encode() == %{"number" => 0, "size" => 20}

    assert Inttegro.OperatingPolicies.PageRequest.new!(operating_policy_id: "op_1", size: 10)
           |> Inttegro.Codec.encode() == %{"operating_policy_id" => "op_1", "size" => 10}

    children_page =
      Inttegro.ChildrenPolicies.Page.from_map(%{
        "number" => 0,
        "size" => 20,
        "count" => 1,
        "total" => 2,
        "has_more" => true,
        "versions" => [children_policy(2)]
      })

    operating_page =
      Inttegro.OperatingPolicies.Page.from_map(%{
        "number" => 0,
        "size" => 20,
        "count" => 1,
        "total" => 1,
        "has_more" => false,
        "versions" => [operating_policy(1)]
      })

    assert [%{version: 2}] = children_page.versions
    assert children_page.has_more
    assert [%{id: "op_1"}] = operating_page.versions
    refute operating_page.has_more
  end

  defp children_policy(version),
    do: %{
      "id" => "cp_1",
      "version" => version,
      "active_version" => 2,
      "name" => "Default",
      "capabilities" => %{},
      "created_at" => "2026-11-05T10:00:00Z",
      "updated_at" => "2026-11-05T10:00:00Z",
      "version_created_at" => "2026-11-05T10:00:00Z"
    }

  defp operating_policy(version),
    do: %{
      "id" => "op_1",
      "version" => version,
      "active_version" => 2,
      "name" => "Retail",
      "capabilities" => %{},
      "children_policy_id" => "cp_1",
      "children_policy_version" => 1,
      "created_at" => "2026-11-05T10:00:00Z",
      "updated_at" => "2026-11-05T10:00:00Z",
      "version_created_at" => "2026-11-05T10:00:00Z"
    }
end
