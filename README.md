# PayU Payment Integration in Flutter App

This Flutter project integrates the PayU payment gateway using the official `payu_checkoutpro_flutter` package. The integration includes a fully working **test payment** flow, ready for sandbox or production environments.

## Features

- Integrated **PayU CheckoutPro** for Flutter.
- Supports **test and live environments**.
- Multiple payment options: UPI, Netbanking, Wallets, Credit/Debit Cards, etc.
- Complete handling of **payment success**, **failure**, and **cancellation** callbacks.

## Important Notice ⚠️

> **Make sure to always use valid test or live PayU credentials (Merchant Key, Salt, etc.). Invalid or missing credentials WILL cause the app to crash or result in errors.**

## Installation

1. Add the dependency:

```yaml
dependencies:
  payu_checkoutpro_flutter: ^1.2.0
