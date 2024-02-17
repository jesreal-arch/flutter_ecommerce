import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:riverpod_app/auth/auth_riverpod.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/providers/provider.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final isSaved = useState(false);
    final nameController = useTextEditingController();
    final passController = useTextEditingController();
    final conpassController = useTextEditingController();
    final userToken = ref.watch(userTokenProvider);
    final currentUser = ref.watch(CurrentUserProvider(userToken));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.pinkAccent.withOpacity(.5),
                        offset: const Offset(3, 3),
                        blurRadius: 20,
                        spreadRadius: 1),
                    BoxShadow(
                        color: Colors.pinkAccent.withOpacity(.5),
                        offset: const Offset(-3, -3),
                        blurRadius: 20,
                        spreadRadius: 1),
                  ],
                  border: Border.all(width: 1, color: Colors.pinkAccent),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(currentUser.value!.avatar))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              currentUser.value!.name,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              currentUser.value!.email,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            Text(
              currentUser.value!.role == 'admin' ? 'Administrator' : 'Customer',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Text(
                      "Update Information",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: bgNavbar,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.email),
                                hintText: currentUser.value!.email,
                                hintStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                prefixIconColor: Colors.white),
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.person),
                                hintText: currentUser.value!.name,
                                hintStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                prefixIconColor: Colors.white),
                          ),
                          TextField(
                            controller: passController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.key),
                                hintText: currentUser.value!.password,
                                hintStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                prefixIconColor: Colors.white),
                          ),
                          TextField(
                            controller: conpassController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.key),
                                hintText: currentUser.value!.password,
                                hintStyle:
                                    GoogleFonts.poppins(color: Colors.white),
                                prefixIconColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        isSaved.value = true;
                        print(isSaved);

                        if (passController.text == conpassController.text) {
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text("Password is mismatched!"),
                                );
                              });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: !isSaved.value
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.save,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Save",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Updating",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const CircularProgressIndicator()
                                  ],
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
