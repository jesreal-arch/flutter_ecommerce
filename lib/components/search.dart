import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:riverpod_app/providers/provider.dart';

class Search extends ConsumerStatefulWidget {
  const Search({
    super.key,
  });

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  final TextEditingController search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: Container(
            height:45 ,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(.9)),
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 226, 223, 223),
                  Color.fromARGB(255, 241, 239, 239),
                  Color.fromARGB(255, 245, 241, 241),
                ])),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: search,
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).update((state) => value);
                  },
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Ionicons.search,
                      color: Colors.black.withOpacity(.9),
                    ),
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(.9)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
    
      ],
    );
  }
}
