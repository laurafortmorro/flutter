import 'package:ecomerce/models/product.dart';
import 'package:flutter/material.dart';

class ShoppingCartProvider extends ChangeNotifier {
  List<CartProduct> productsQuantity= [];
  List<CartProduct> get cartProduct => cartProduct;

  ShoppingCartProvider() {
    fetchProductsCart();
  }

  Future fetchProductsCart() async {
  }


  void removeFromCart(CartProduct product) {
    CartProduct existingProduct = productsQuantity.firstWhere(
          (element) => element.id == product.id,
    );
    if (existingProduct != null) {
      if (existingProduct.quantity > 1) {
        existingProduct.quantity -= 1;
      } else {
        productsQuantity.remove(product);
      }
      notifyListeners();
    }
  }

  void addToCart(CartProduct product) {
    // Verifica si el producto ya está en el carrito
    bool found = false;
    for (var item in productsQuantity) {
      if (item.id == product.id) {
        item.quantity += product.quantity;
        found = true;
        break;
      }
    }
    // Si el producto no está en el carrito, agrégalo
    if (!found) {
      product.quantity = 1;
      productsQuantity.add(product);
    }
    notifyListeners();
  }

  void clearCart(CartProduct product) {
    productsQuantity.remove(product);
    notifyListeners();
  }
}
