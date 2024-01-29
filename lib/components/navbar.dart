import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/components/navIcons.dart';
import 'package:riverpod_app/models/const.dart';
import 'package:riverpod_app/providers/provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final currentIndex = ref.watch(currentIndexProviderNavBar);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 18),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 43, 42, 42),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: iconsnav.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(currentIndexProviderNavBar.notifier)
                          .update((state) {
                        return index;
                      });
                    },
                    child: NavICons(
                      isSelected: currentIndex == index,
                      icon: iconsnav[index],
                      name: titlenav[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
