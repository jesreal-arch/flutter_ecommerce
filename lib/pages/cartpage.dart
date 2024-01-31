import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/components/card.dart';
import 'package:riverpod_app/components/cartcard.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/addtocart.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCart = ref.watch(cartProvider) as CartModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Ionicons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: bgNavbar.withOpacity(.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Ionicons.cart,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: Text(
                        "You have ${addCart.cart.length} products in you cart!",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                addCart.cart.isEmpty
                    ? Center(
                        child: LottieBuilder.network(
                            "https://lottie.host/a4185e7f-d36c-4fab-bd0b-b3ad1bfd91de/e09xNrvu8L.json"),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: addCart.cart.length,
                        itemBuilder: (context, index) {
                          final List<ProductModel> cartProducts = addCart.cart
                              .map(
                                (e) => e,
                              )
                              .toList();
                          return CartCard(
                              productModel: cartProducts, index: index);
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
