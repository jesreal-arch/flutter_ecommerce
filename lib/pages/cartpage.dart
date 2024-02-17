import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/auth/auth_riverpod.dart';
import 'package:riverpod_app/components/card.dart';
import 'package:riverpod_app/components/cartcard.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/models/cartmodel_snapshot.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/addtocart.dart';
import 'package:riverpod_app/providers/firebase/firebase_riverpod.dart';
import 'package:riverpod_app/providers/provider.dart';

final cartCount = StateProvider((ref) => 0);

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userToken = ref.watch(userTokenProvider);
    final currentUser = ref.watch(CurrentUserProvider(userToken));
    final docsId = ref.watch(GetIdCartProvider(currentUser.value!.name));

    final stream = FirebaseFirestore.instance
        .collection("Cart")
        .doc(currentUser.value!.name)
        .collection('products')
        .orderBy('timestamp', descending: true)
        .snapshots();

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
                        "You have  products in you cart!",
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
                StreamBuilder(
                    stream: stream,
                    builder: (context, snapshot) {
                      // ignore: unnecessary_null_comparison
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: LottieBuilder.network(
                              "https://lottie.host/97e5c15d-95df-4310-8e00-3b8d4eb89f8d/W7nKmv4i3j.json"),
                        );
                      }
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            final ProductModelFetch products =
                                ProductModelFetch.fromSnapshot(
                                    snapshot.data!.docs[index]);

                            return CartCard(
                              docId: docsId.value![index],
                              productModel: products,
                              onDelete: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: bgNavbar,
                                      title: Text(
                                        'Remove from cart',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                      content: Text(
                                          'Remove this product from your cart?',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white)),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Cancel',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Confirm',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            ref.read(DeleteCartProvider(
                                                currentUser.value!.name,
                                                docsId.value![index]));

                                            Navigator.of(context).pop();

                                            // Handle the confirm action
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
