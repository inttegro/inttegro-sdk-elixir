defmodule Inttegro.Payments do
  @moduledoc """
  Payment state, attempts, confirmation requirements, and next actions attached to an order.

  These modules describe values returned through `Inttegro.Orders`; payment state may change after
  an operation returns. Inspect the order's latest payment state and follow its documented next
  action rather than treating request completion as proof of payment.
  """

  @doc "Reports whether the payment succeeded."
  @spec paid?(Inttegro.Payments.Payment.t()) :: boolean()
  def paid?(%Inttegro.Payments.Payment{status: status}), do: status in [:paid, "paid"]

  @doc "Reports whether the payment needs the caller to complete a next action."
  @spec requires_action?(Inttegro.Payments.Payment.t()) :: boolean()
  def requires_action?(%Inttegro.Payments.Payment{status: status}),
    do: status in [:requires_action, "requires_action"]

  @doc "Reports whether the payment has reached a final state."
  @spec terminal?(Inttegro.Payments.Payment.t()) :: boolean()
  def terminal?(%Inttegro.Payments.Payment{status: status}),
    do: status in [:paid, :canceled, :expired, :failed, "paid", "canceled", "expired", "failed"]

  @doc "Returns next-action details only when the payment requires action."
  @spec required_action(Inttegro.Payments.Payment.t()) ::
          Inttegro.Payments.NextAction.t() | nil
  def required_action(%Inttegro.Payments.Payment{} = payment) do
    if requires_action?(payment), do: payment.next_action
  end
end
