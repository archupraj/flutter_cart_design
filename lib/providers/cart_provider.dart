import 'package:flutter/material.dart';
import 'package:flutter_cart_design/models/cart_item.dart';
import 'package:flutter_cart_design/models/product.dart';

class CartProvider extends ChangeNotifier {

  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  /// Total items count
  int get itemCount {
    int total = 0;
    for (var item in _items.values) {
      total += item.quantity;
    }
    return total;
  }

  /// Total price
  double get totalPrice {
    double total = 0;
    for (var item in _items.values) {
      total += item.totalPrice;
    }
    return total;
  }

  /// Add product
  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items.putIfAbsent(
        product.id,
            () => CartItem(product: product),
      );
    }

    notifyListeners();
  }

  /// Increase quantity
  void increaseQuantity(String productId) {
    _items[productId]!.quantity++;
    notifyListeners();
  }

  /// Decrease quantity
  void decreaseQuantity(String productId) {

    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity--;
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }
}