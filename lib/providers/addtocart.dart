import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_app/models/model_product.dart';

class CartNotifier extends StateNotifier<CartModel> {
  CartNotifier() : super(CartModel(cart: []));

  void addTocart(ProductModel product) {
    var updatedCart = state.cart;
    updatedCart.add(product);
    state = CartModel(cart: updatedCart);
  }
   void removeTocart(ProductModel product) {
    var updatedCart = state.cart;
    updatedCart.remove(product);
    state = CartModel(cart: updatedCart);
  }
}
final cartProvider = StateNotifierProvider((ref) => CartNotifier());


