# flutter_cart_design

A simple **Flutter Shopping Cart application** demonstrating product listing, cart management, quantity control, and dynamic total price calculation using **Provider State Management** and **Cached Network Images**.

---

## 📱 Features

* Product list displayed in **Grid Layout**
* **Add to Cart** functionality
* **Cart Icon Badge** showing number of items
* Cart screen displaying:

  * Product Image
  * Product Name
  * Product Price
  * Quantity Controls (- / +)
* Remove item when quantity becomes **zero**
* **Dynamic total price calculation**
* **Cached network images** for better performance
* Clean **folder architecture**

---

* Flutter
* Provider (State Management)
* Cached Network Image

---

## 📂 Project Structure

```
lib/
│
├── main.dart
│
├── models/
│   ├── product.dart
│   └── cart_item.dart
│
├── providers/
│   └── cart_provider.dart
│
├── screens/
│   ├── product_list_screen.dart
│   └── cart_screen.dart
│
└── widgets/
    ├── product_card.dart
    └── cart_item_tile.dart
```

## 🖼 UI Overview

### Product Screen

* Displays products in **grid layout**
* Each product has an **Add to Cart button**

### Cart Screen

* Shows list of added products
* Quantity controls
* Dynamic **total price**

Example:

```
Cart 🛒 (3)

Product 1
[-] 2 [+]

Product 2
[-] 1 [+]

Total Price: ₹2450
```

---

## ⚙️ State Management

The application uses **Provider with ChangeNotifier** to manage cart state.

### CartProvider Responsibilities

* Add item to cart
* Increase quantity
* Decrease quantity
* Remove item
* Calculate total price
* Notify UI updates

---
