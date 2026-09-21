# Typed Inttegro API resource.

defmodule Inttegro.Orders do
  @moduledoc Inttegro.Docs.resource_doc(__MODULE__)
  alias Inttegro.Client

  @doc "Reports whether the order has recorded payment, including after completion."
  @spec paid?(Inttegro.Orders.Order.t()) :: boolean()
  def paid?(%Inttegro.Orders.Order{status: status, paid_at: paid_at}),
    do: status in [:paid, "paid"] or not is_nil(paid_at)

  @doc "Reports whether the order is waiting for payment."
  @spec requires_payment?(Inttegro.Orders.Order.t()) :: boolean()
  def requires_payment?(%Inttegro.Orders.Order{status: status}),
    do: status in [:requires_payment, "requires_payment"]

  @doc "Reports whether the order has reached a final state."
  @spec terminal?(Inttegro.Orders.Order.t()) :: boolean()
  def terminal?(%Inttegro.Orders.Order{status: status}),
    do:
      status in [
        :paid,
        :completed,
        :canceled,
        :expired,
        "paid",
        "completed",
        "canceled",
        "expired"
      ]

  @doc "Returns nested action details when the order payment requires action."
  @spec required_payment_action(Inttegro.Orders.Order.t()) ::
          Inttegro.Payments.NextAction.t() | nil
  def required_payment_action(%Inttegro.Orders.Order{payment: nil}), do: nil

  def required_payment_action(%Inttegro.Orders.Order{payment: payment}),
    do: Inttegro.Payments.required_action(payment)

  @doc """
  Creates a new order in Inttegro. This endpoint supports two flows: 1. New customer flow: Provide `customer_data` to create a new customer and order 2. Existing customer flow: Provide `customer_id` and optionally `payment_method_id` for known customers The order can be configured to execute payment immediately or require manual payment later.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.CreateRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      # Build one of the concrete request variants listed by Inttegro.Orders.CreateRequest.t/0.
      request = concrete_request

      case Inttegro.Orders.create(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec create(Client.t(), Inttegro.Orders.CreateRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def create(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/create",
             Inttegro.Codec.encode(request),
             options,
             "orders.create",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Retrieves details of an existing order by its ID. The order may or may not exist.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.LookupRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.LookupRequest.new!(request_attributes)

      case Inttegro.Orders.lookup(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec lookup(Client.t(), Inttegro.Orders.LookupRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def lookup(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/lookup",
             Inttegro.Codec.encode(request),
             options,
             "orders.lookup",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Updates mutable fields on an existing order and returns the same response shape as `/orders/lookup`. Use this endpoint to replace the order's full line item set, update the order number, receipt number, invoice settings, or statement descriptor, replace order-level `custom_data`, switch to a different saved payment method, tokenize a new payment method, clear the current payment method, or explicitly open, seal, or reseal the order via `finalize`. `line_items` is a full replacement field, not a sparse merge. `payment_method_id`, `payment_method_data`, and `clear_payment_method` are mutually exclusive. `custom_data` is metadata-only and does not require reopen or reseal by itself. Completed, paid, canceled, and expired orders cannot be updated. When mutating seal-sensitive fields on a sealed order, set `finalize: false` to reopen the order and leave it editable, or set `finalize: true` to apply the changes and reseal in the same request. If payment confirmation or execution has already started, Inttegro rejects edits that would change the order's economics or payment configuration.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.UpdateRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.UpdateRequest.new!(request_attributes)

      case Inttegro.Orders.update(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec update(Client.t(), Inttegro.Orders.UpdateRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def update(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/update",
             Inttegro.Codec.encode(request),
             options,
             "orders.update",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Initiates payment for an existing order. Supports two payment flows: 1. Use saved payment method: Provide only `order_id` to charge a previously saved payment method 2. Provide new payment details: Include `payment_method_data` with payment information

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.PayRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.PayRequest.new!(request_attributes)

      case Inttegro.Orders.pay(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec pay(Client.t(), Inttegro.Orders.PayRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def pay(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/pay",
             Inttegro.Codec.encode(request),
             options,
             "orders.pay",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Confirms a pending payment using a verification token (e.g., OTP sent to customer's phone)

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.ConfirmPaymentRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.ConfirmPaymentRequest.new!(request_attributes)

      case Inttegro.Orders.confirm_payment(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec confirm_payment(Client.t(), Inttegro.Orders.ConfirmPaymentRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def confirm_payment(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/confirm_payment",
             Inttegro.Codec.encode(request),
             options,
             "orders.confirm_payment",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Requests a new confirmation token to be sent to the customer for payment verification

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.RequestConfirmationRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.RequestConfirmationRequest.new!(request_attributes)

      case Inttegro.Orders.request_confirmation(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec request_confirmation(
          Client.t(),
          Inttegro.Orders.RequestConfirmationRequest.t(),
          keyword()
        ) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def request_confirmation(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/request_confirmation",
             Inttegro.Codec.encode(request),
             options,
             "orders.request_confirmation",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Cancels an existing order. `execute_refund` records whether a refund was requested as part of the cancellation evidence; this endpoint does not move funds or create a refund.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.CancelRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.CancelRequest.new!(request_attributes)

      case Inttegro.Orders.cancel(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec cancel(Client.t(), Inttegro.Orders.CancelRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def cancel(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/cancel",
             Inttegro.Codec.encode(request),
             options,
             "orders.cancel",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Finalizes an order to make it ready for payment. This endpoint seals the current order state and activates the hosted checkout page that you can share with customers. Use this when you've finished building the cart and want to present it to the customer for payment. The response includes the `sealed_at` timestamp marking when the order was finalized. If you later need to change line items, payment method, statement descriptor, or order number, use `/orders/update` with an explicit `finalize` decision to reopen or reseal the order.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.FinalizeRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.FinalizeRequest.new!(request_attributes)

      case Inttegro.Orders.finalize(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec finalize(Client.t(), Inttegro.Orders.FinalizeRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def finalize(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/finalize",
             Inttegro.Codec.encode(request),
             options,
             "orders.finalize",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Marks an order as completed, transitioning it to the `completed` state. An order can only be completed if its associated payment has been successfully paid. Use the `paid_out_of_band` parameter when payment happened offline (outside the Inttegro platform) to force the payment status to paid before completing the order. This is useful for cash payments, bank transfers, or other out-of-band payment methods. Once completed, the order status becomes `completed` and the `completed_at` timestamp is set.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.CompleteRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Order.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.CompleteRequest.new!(request_attributes)

      case Inttegro.Orders.complete(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec complete(Client.t(), Inttegro.Orders.CompleteRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Order.t()} | {:error, Exception.t()}
  def complete(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/complete",
             Inttegro.Codec.encode(request),
             options,
             "orders.complete",
             "order",
             true
           ) do
      {:ok, Inttegro.Orders.Order.from_map(value)}
    end
  end

  @doc """
  Sends the hosted invoice link for an existing order through Chime. The request body contains only `order_id`; delivery options are resolved from the order customer. If the customer has both a phone number and an email address, Inttegro sends both SMS and email Chimes. If only one contact method exists, Inttegro sends to that channel. The order must be finalized before Inttegro can send the hosted invoice link. This is an idempotent endpoint. Send retry keys with the `Idempotency-Key` header.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.DocumentDeliveryRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.DocumentDeliveryResult.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.DocumentDeliveryRequest.new!(request_attributes)

      case Inttegro.Orders.send_invoice(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec send_invoice(Client.t(), Inttegro.Orders.DocumentDeliveryRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.DocumentDeliveryResult.t()} | {:error, Exception.t()}
  def send_invoice(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/send_invoice",
             Inttegro.Codec.encode(request),
             options,
             "orders.send_invoice",
             nil,
             true
           ) do
      {:ok, Inttegro.Orders.DocumentDeliveryResult.from_map(value)}
    end
  end

  @doc """
  Sends the hosted receipt link for an existing paid order through Chime. The request body contains only `order_id`; receipt delivery never uses the invoice PDF path. If the customer has both a phone number and an email address, Inttegro sends both SMS and email Chimes. If only one contact method exists, Inttegro sends to that channel. The order must be paid before a receipt can be sent. This is an idempotent endpoint. Send retry keys with the `Idempotency-Key` header.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.DocumentDeliveryRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.DocumentDeliveryResult.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.DocumentDeliveryRequest.new!(request_attributes)

      case Inttegro.Orders.send_receipt(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec send_receipt(Client.t(), Inttegro.Orders.DocumentDeliveryRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.DocumentDeliveryResult.t()} | {:error, Exception.t()}
  def send_receipt(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/send_receipt",
             Inttegro.Codec.encode(request),
             options,
             "orders.send_receipt",
             nil,
             true
           ) do
      {:ok, Inttegro.Orders.DocumentDeliveryResult.from_map(value)}
    end
  end

  @doc """
  Retrieve a paginated list of the most recent orders for the authenticated application. Orders are sorted by `initiated_at` in descending order. Page numbers are zero-based, so page 0 contains the freshest activity.

  ## Parameters

  * `client` — an authenticated `Inttegro.Client`.
  * `request` — a `Inttegro.Orders.PageRequest` containing the operation input.
  * `options` — request options such as `:idempotency_key` and additional `:headers`.

  ## Returns

  Returns `{:ok, Inttegro.Orders.Page.t()}` when Inttegro accepts and decodes the operation. Returns
  `{:error, exception}` for API, transport, or decoding failures. A successful API response can
  still describe an asynchronous resource that has not reached its terminal state.

  ## Example

      request = Inttegro.Orders.PageRequest.new!(request_attributes)

      case Inttegro.Orders.page(client, request) do
        {:ok, result} -> result
        {:error, error} -> {:error, error}
      end
  """
  @spec page(Client.t(), Inttegro.Orders.PageRequest.t(), keyword()) ::
          {:ok, Inttegro.Orders.Page.t()} | {:error, Exception.t()}
  def page(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/page",
             Inttegro.Codec.encode(request),
             options,
             "orders.page",
             "page",
             true
           ) do
      {:ok, Inttegro.Orders.Page.from_map(value)}
    end
  end

  @doc "Search orders with a typed resource-local query."
  @spec search(Client.t(), Inttegro.Search.Request.t(), keyword()) ::
          {:ok, Inttegro.Search.Page.t()} | {:error, Exception.t()}
  def search(client, request, options \\ []) do
    with {:ok, value} <-
           Client.request(
             client,
             "POST",
             "/orders/search",
             Inttegro.Codec.encode(request),
             options,
             "orders.search",
             "search",
             true
           ) do
      {:ok, Inttegro.Search.Page.from_map(value)}
    end
  end
end
