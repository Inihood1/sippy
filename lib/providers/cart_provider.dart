import 'package:flutter/material.dart';

// lib/providers/cart_provider.dart

import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  /// Read-only list of items in the shared cart
  List<CartItem> get items => List.unmodifiable(_items);

  /// Total number of items in the cart
  int get itemCount => _items.length;

  /// Total price of everything in the cart
  double get totalPrice => _items.fold(
    0.0,
        (sum, item) => sum + item.product.price,
  );

  /// Add a product to the cart, tagging it with who added it
  void addItem(Product product, String addedBy) {
    _items.add(CartItem(product: product, addedBy: addedBy));
    notifyListeners();
  }

  /// Remove a single cart item by index (optional)
  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  /// Clear everything—used when “Done Shopping”
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
