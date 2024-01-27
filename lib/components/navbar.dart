import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/components/navIcons.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 43, 42, 42),
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: bgNavbar,
                offset: Offset(3, 0),
                blurRadius: 6,
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavICons(
                  icon: Ionicons.home_outline,
                  name: 'Home',
                ),
                NavICons(
                  icon: Ionicons.mail_outline,
                  name: 'Message',
                ),
                NavICons(
                  icon: Ionicons.cart_outline,
                  name: 'Cart',
                ),
                NavICons(
                  icon: Ionicons.person_add_outline,
                  name: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
