import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/addtocart.dart';
import 'package:riverpod_app/providers/provider.dart';

class CartCard extends ConsumerWidget {
  const CartCard({super.key, required this.index, required this.productModel});

  final int index;
  final List<ProductModel> productModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CategoryModel categoryProduct =
        CategoryModel.fromJson(productModel[index].category);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
          spacing: 2,
            onPressed: ((context) {
              ref.read(cartProvider.notifier).removeTocart(productModel[index]);
            }),
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
                Flexible(
                    flex: 1,
                    child: Image.network(productModel[index].images[0])),
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
                          productModel[index].title,
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
                              "P${productModel[index].price}0",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    child: const Icon(
                                        Ionicons.add_circle_outline)),
                                Text(
                                  "0",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Ionicons.remove_circle_outline),
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
