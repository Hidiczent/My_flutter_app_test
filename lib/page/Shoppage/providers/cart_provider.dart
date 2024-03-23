import 'package:app_present/page/Shoppage/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    } else {
      removeProduct(index);
    }
  }

  void removeProduct(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
