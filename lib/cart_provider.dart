import 'package:flutter/material.dart';

class CartItem {
  String name;
  double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartProvider extends ChangeNotifier {
  List<CartItem> cartItem = [];

  void addToCart(CartItem item) {
    cartItem.add(item);
    notifyListeners();
  }
  }