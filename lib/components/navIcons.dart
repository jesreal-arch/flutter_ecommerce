import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavICons extends StatelessWidget {
  const NavICons({
    super.key,
    required this.icon,
    required this.name,
    required this.isSelected,
  });

  final IconData icon;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    : const Color.fromARGB(255, 255, 255, 255).withOpacity(.5),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
