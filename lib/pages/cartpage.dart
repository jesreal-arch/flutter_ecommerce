import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/components/card.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/addtocart.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCart = ref.watch(cartProvider) as CartModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("CartPAge"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: addCart.cart.length,
                itemBuilder: (context, index) {
                  final List<ProductModel> cartProducts = addCart.cart
                      .map(
                        (e) => e,
                      )
                      .toList();
                  return ProductCard(products: cartProducts, index: index);
                }),
          ],
        ),
      ),
    );
  }
}
