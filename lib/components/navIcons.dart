import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class NavICons extends StatelessWidget {
  const NavICons({
    super.key,
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Flexible(
          child: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 12,
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(.5), fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
