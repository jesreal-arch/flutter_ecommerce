import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/auth/auth_riverpod.dart';
import 'package:riverpod_app/models/cartmodel_snapshot.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/addtocart.dart';
import 'package:riverpod_app/providers/firebase/firebase_riverpod.dart';
import 'package:riverpod_app/providers/provider.dart';

class CartCard extends HookConsumerWidget {
  const CartCard({
    super.key,
    required this.docId,
    required this.productModel,
    required this.onDelete,
  });

  final ProductModelFetch productModel;
  final Function onDelete;
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CategoryModel categoryProduct =
        CategoryModel.fromJson(productModel.category);
    final add = useState(1);
    final userToken = ref.watch(userTokenProvider);
    final currentUser = ref.watch(CurrentUserProvider(userToken));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            spacing: 2,
            onPressed: (context) {
              onDelete();
            },
            backgroundColor: Colors.red,
            icon: Ionicons.trash_bin,
          ),
        ]),
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(3, 0),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(flex: 1, child: Image.network(productModel.images[0])),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productModel.title,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${categoryProduct.name} Section",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'P${productModel.quantity}',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: (const Icon(Ionicons.add)),
                                  onPressed: () {
                                    add.value++;
                                    ref.read(UpdateQuanityProvider(
                                        currentUser.value!.name,
                                        docId,
                                        productModel.price * add.value));
                                  },
                                ),
                                Text(
                                  add.value.toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: (const Icon(Ionicons.remove)),
                                  onPressed: () {
                                    add.value--;
                                    ref.read(UpdateQuanityProvider(
                                        currentUser.value!.name,
                                        docId,
                                        productModel.price * add.value));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
