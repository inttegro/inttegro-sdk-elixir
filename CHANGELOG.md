# Changelog

## 0.6.0

- Added typed search across customers, financial accounts, orders, payouts, and
  products, including filters, facets, sorting, cursor pagination, totals, and
  freshness metadata.
- Added typed verification purposes for OTP initiation requests.

## 0.5.0

- Breaking: replaced raw custom-data maps with immutable `Inttegro.CustomData`,
  `Inttegro.CustomDataInput`, and `Inttegro.CustomDataPatch` values.
- Preserved open-ended JSON inputs while making replacement and merge behavior
  explicit and validating custom-data size and key limits.
- Made the semantic custom-data transformation part of code generation so
  regenerated SDK types keep the public contract.

## 0.4.0

- Breaking: replaced payout maps and generic payloads with named request,
  response, settings, page, error, and destination structs.
- Made `ghs` the explicit supported payout-destination field and exposed payout
  timestamps as `DateTime` values.
- Added fluent resource semantics and removed server-internal purchase-intent
  activity response models.

## 0.3.0

- Breaking: replaced generic maps with named structs for balances, purchase intents, products, payment methods, payments, and orders.
- Breaking: exposed API timestamps as `DateTime` values and accepted `DateTime` values in timestamp request fields.

## 0.2.0

- Reorganized API types into domain namespaces such as `Inttegro.Orders.Order` and
  `Inttegro.Files.File` instead of exposing every schema directly below `Inttegro`.
- Added module, type, constructor, and resource-operation documentation derived from the public API
  contract, together with workflow guides for setup, payments, retries, pagination, files, and
  observability.
- Hid JSON encoding and decoding functions from the public reference while retaining them as SDK
  implementation details.
- Tightened financial-account and payment-method response models to exclude internal platform
  fields.

This release contains breaking module-name changes from `0.1.x`.

## 0.1.0

- Initial typed server SDK.
