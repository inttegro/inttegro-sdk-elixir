defmodule Inttegro.CustomData.Validation do
  @moduledoc false

  @max_key_bytes 256
  @max_encoded_bytes 25 * 1024

  @spec normalize!(map(), :data | :input | :patch) :: map()
  def normalize!(values, kind) when is_map(values) do
    Enum.each(values, fn
      {key, value} when is_binary(key) ->
        if byte_size(key) > @max_key_bytes do
          raise ArgumentError, "custom data key exceeds 256 bytes"
        end

        if kind == :data and not is_binary(value) do
          raise ArgumentError, "custom data response values must be strings"
        end

      {_key, _value} ->
        raise ArgumentError, "custom data keys must be strings"
    end)

    encoded = Jason.encode!(values)

    if byte_size(encoded) > @max_encoded_bytes do
      raise ArgumentError, "custom data exceeds 25 KiB"
    end

    Jason.decode!(encoded)
  rescue
    error in Jason.EncodeError ->
      raise ArgumentError,
            "custom data values must be JSON-serializable: #{Exception.message(error)}"
  end

  def normalize!(_values, _kind), do: raise(ArgumentError, "custom data must be a map")
end

defmodule Inttegro.CustomData do
  @moduledoc """
  Immutable merchant-defined string metadata returned by the Inttegro API.

  Use `put/3` or `delete/2` to derive a replacement value without mutating the
  response object that was originally decoded.
  """

  @enforce_keys [:values]
  defstruct values: %{}

  @opaque t :: %__MODULE__{values: %{optional(String.t()) => String.t()}}

  @spec new!(map()) :: t()
  def new!(values \\ %{}),
    do: %__MODULE__{values: Inttegro.CustomData.Validation.normalize!(values, :data)}

  @spec from_map(map()) :: t()
  def from_map(values), do: new!(values)

  @spec to_map(t()) :: map()
  def to_map(%__MODULE__{values: values}), do: values

  @spec get(t(), String.t(), String.t() | nil) :: String.t() | nil
  def get(%__MODULE__{values: values}, key, default \\ nil), do: Map.get(values, key, default)

  @spec put(t(), String.t(), String.t()) :: t()
  def put(%__MODULE__{values: values}, key, value), do: new!(Map.put(values, key, value))

  @spec delete(t(), String.t()) :: t()
  def delete(%__MODULE__{values: values}, key), do: new!(Map.delete(values, key))
end

defmodule Inttegro.CustomDataInput do
  @moduledoc """
  Immutable open-ended JSON metadata accepted by create and replacement requests.

  Values remain open-ended while the wrapper validates JSON compatibility and
  returns a new value for every `put/3` or `delete/2` operation.
  """

  @enforce_keys [:values]
  defstruct values: %{}

  @opaque t :: %__MODULE__{values: %{optional(String.t()) => term()}}

  @spec new!(map()) :: t()
  def new!(values \\ %{}),
    do: %__MODULE__{values: Inttegro.CustomData.Validation.normalize!(values, :input)}

  @spec from_map(map()) :: t()
  def from_map(values), do: new!(values)

  @spec to_map(t()) :: map()
  def to_map(%__MODULE__{values: values}), do: values

  @spec get(t(), String.t(), term()) :: term()
  def get(%__MODULE__{values: values}, key, default \\ nil), do: Map.get(values, key, default)

  @spec put(t(), String.t(), term()) :: t()
  def put(%__MODULE__{values: values}, key, value), do: new!(Map.put(values, key, value))

  @spec delete(t(), String.t()) :: t()
  def delete(%__MODULE__{values: values}, key), do: new!(Map.delete(values, key))
end

defmodule Inttegro.CustomDataPatch do
  @moduledoc """
  Immutable custom-data merge operations for patch-style requests.

  `set/3` records a value, `unset/2` emits JSON `null` to remove a remote key,
  and `remove_change/2` discards a pending local operation.
  """

  @enforce_keys [:changes]
  defstruct changes: %{}

  @opaque t :: %__MODULE__{changes: %{optional(String.t()) => term() | nil}}

  @spec new!(map()) :: t()
  def new!(changes \\ %{}),
    do: %__MODULE__{changes: Inttegro.CustomData.Validation.normalize!(changes, :patch)}

  @spec from_map(map()) :: t()
  def from_map(changes), do: new!(changes)

  @spec to_map(t()) :: map()
  def to_map(%__MODULE__{changes: changes}), do: changes

  @spec set(t(), String.t(), term()) :: t()
  def set(%__MODULE__{changes: changes}, key, value) when not is_nil(value),
    do: new!(Map.put(changes, key, value))

  def set(%__MODULE__{}, _key, nil),
    do: raise(ArgumentError, "use unset/2 to remove a custom-data value")

  @spec unset(t(), String.t()) :: t()
  def unset(%__MODULE__{changes: changes}, key), do: new!(Map.put(changes, key, nil))

  @spec remove_change(t(), String.t()) :: t()
  def remove_change(%__MODULE__{changes: changes}, key), do: new!(Map.delete(changes, key))
end
