import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(.9)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [],
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 226, 223, 223),
                  Color.fromARGB(255, 241, 239, 239),
                  Color.fromARGB(255, 245, 241, 241),
                ])),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Ionicons.search,
                    color: Colors.black.withOpacity(.9),
                  ),
                  hintText: "Search",
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.black.withOpacity(.9)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(.9)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [],
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 231, 228, 228),
                  Color.fromARGB(255, 241, 239, 239),
                  Color.fromARGB(255, 245, 241, 241),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Ionicons.menu,
                color: Colors.black.withOpacity(.9),
                size: 19,
              ),
            ),
          ),
        )
      ],
    );
  }
}
