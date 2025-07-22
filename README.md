🧾 Mini-POS Checkout Core
This project implements the core logic for a minimal Point-of-Sale (POS) system. It simulates a simple checkout process with the ability to:

- Load and display a product catalog

- Add and remove items from a cart

- Calculate totals and taxes

- Generate a receipt (Receipt Builder)

- Follow clean architecture principles using BLoC pattern

- Include unit tests for key components

✅ Versions
- Flutter 3.29.0
- Dart 3.7.0
- Xcode 16.3


✅ Features
📦 Product catalog with mock data

🛒 Cart functionality (add/remove/update items)

💰 Receipt builder with subtotal, tax, and total

🧪 Unit-tested core logic

⚙️ BLoC-based state management

📂 Structure
src/catalog: Product listing and fetching

src/cart: Cart logic and state

src/receipt.dart To build a receipt 

flutter pub get
flutter test


features/receipt: Receipt generation

core: Shared models and utils

🚀 Getting Started
