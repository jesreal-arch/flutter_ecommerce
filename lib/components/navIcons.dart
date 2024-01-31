import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/pages/cartpage.dart';
import 'package:riverpod_app/providers/addtocart.dart';

class NavICons extends ConsumerWidget {
  const NavICons({
    super.key,
    required this.icon,
    required this.name,
    required this.isSelected,
    required this.index,
  });

  final IconData icon;
  final int index;
  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCart = ref.watch(cartProvider) as CartModel;
    return index == 2
        ? Stack(children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    color: isSelected ? Colors.red : Colors.white,
                  ),
                ),
                Flexible(
                  child: Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.red
                            : const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(.5),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 5,
              child: Container(
                height: 15,
                width: 30,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3, 0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "${addCart.cart.length}",
                      style: GoogleFonts.poppins(
                          color: isSelected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
            )
          ])
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: isSelected ? Colors.red : Colors.white,
                ),
              ),
              Flexible(
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: isSelected
                          ? Colors.red
                          : const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(.5),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
  }
}
