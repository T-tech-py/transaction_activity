# 📱 Transaction Activity – Flutter UI Challenge

A lightweight Flutter interface for displaying mock transaction history with filter tabs, animations, and responsive layout for both mobile and web.

---

## ✨ Features

- List of 5 mock transactions with amount, date, and status.
- Dynamic filter tabs: **All**, **Successful**, **Pending**, **Failed**.
- Smooth fade animation when switching between filters.
- Fallback UI when no transactions match a filter.
- Responsive design for mobile and web screens.
- Clean architecture using **Riverpod** for state management.

---

## 🛠️ Technologies & Packages Used

| Package             | Purpose                                |
|---------------------|----------------------------------------|
| `flutter_hooks`     | Enables hooks for cleaner widget state |
| `hooks_riverpod`    | Modern, reactive state management      |
| `intl`              | Formatting transaction dates           |

---


### 📁 Project Structure

- **`lib/`**
  - **`main.dart`** – App entry point
  - **`app.dart`** – Sets up app theme and routing
  - **`core/`**
    - **`constants.dart`** – Filter enum and mock transaction data
    - **`models/`**
      - **`transaction.dart`** – Transaction model class
  - **`features/transaction/`**
    - **`application/`**
      - **`transaction_provider.dart`** – Business logic & state (Riverpod)
    - **`presentation/`**
      - **`transaction_page.dart`** – UI screen for transaction activity
      - **`widgets/`**
        - **`transaction_filter.dart`** – Filter chip UI
        - **`transaction_list.dart`** – List of filtered transactions
        - **`empty_state.dart`** – Fallback UI for no results
- **`pubspec.yaml`** – Dependencies and Flutter setup
- **`README.md`** – Project documentation (this file)

---

## 🧠 State Management (Riverpod)

The filter selection and transaction list are managed via `StateProvider` and `Provider`.

- `transaction_provider.dart`: Handles selected filter and provides filtered transaction list.
- UI widgets subscribe to providers using `HookConsumerWidget`.

---

## 💡 Animation

- A `FadeTransition` is applied to the transaction list when the filter changes to create a smooth UI update.

---

## 🖥️ Responsive Layout

- Uses `LayoutBuilder` and `Wrap` widgets for dynamic layout handling.
- Scales properly on both mobile and desktop screens.

---

## ▶️ How to Run

```bash
git clone https://github.com/t-techpy/transaction_activity.git
cd transaction_activity
flutter pub get
flutter run -d chrome     # For web
flutter run               # For mobile


![Demo]( )
