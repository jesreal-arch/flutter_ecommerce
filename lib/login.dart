// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:riverpod_app/components/const.dart';
import 'package:http/http.dart' as https;

import 'package:riverpod_app/home.dart';
import 'package:riverpod_app/models/token.dart';
import 'package:riverpod_app/providers/provider.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authUser = ref.watch(userTokenProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(bgLogin),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 2, 28, 49).withOpacity(1),
                const Color.fromARGB(255, 2, 28, 49).withOpacity(.7),
                const Color.fromARGB(255, 2, 28, 49).withOpacity(.3),
                Colors.transparent,
                const Color.fromARGB(255, 2, 28, 49).withOpacity(.3),
                const Color.fromARGB(255, 2, 28, 49).withOpacity(.7),
                const Color.fromARGB(255, 2, 28, 49).withOpacity(.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  "Welcome!",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 0),
                        blurRadius: 6,
                      ),
                    ],
                    color: Color.fromARGB(255, 4, 41, 71),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: 15,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                controller: email,
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    labelText: "Username",
                                    border: InputBorder.none,
                                    labelStyle: GoogleFonts.openSans(
                                        color: Colors.white.withOpacity(.7))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 0),
                        blurRadius: 6,
                      ),
                    ],
                    color: Color.fromARGB(255, 4, 41, 71),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.key,
                            color: Colors.white,
                            size: 15,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                controller: pass,
                                obscureText: false,
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    border: InputBorder.none,
                                    labelStyle: GoogleFonts.openSans(
                                        color: Colors.white.withOpacity(.7))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    (login(email.text, pass.text));

                    /*if (email.text.isNotEmpty && pass.text.isNotEmpty) {
                      final authArgs = AuthArgs(
                        email: email.text,
                        password: pass.text,
                      );
                      ref.read(authLoginProvider(authArgs));
                      final isAuthenticated =
                          ref.read(getIsAuthenticatedProvider);
                      if (isAuthenticated.value!) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }
                    }
                    */
                  },
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(3, 0),
                          blurRadius: 6,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: const Color.fromARGB(255, 4, 41, 71)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const FaIcon(FontAwesomeIcons.arrowRight,
                              color: Color.fromARGB(255, 4, 41, 71)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Future<void> login(String email, String pass) async {
    if (email.isNotEmpty && pass.isNotEmpty) {
      var res = await https.post(
          Uri.parse("https://api.escuelajs.co/api/v1/auth/login"),
          body: ({
            'email': email,
            'password': pass,
          }));

      if (res.statusCode == 201) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LottieBuilder.network(
                "https://lottie.host/dc49cc07-ea7c-4092-8d1a-2bdbbb99bd95/TrcvRX1arR.json");
          },
        );
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pop(context); //pop dialog
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          );
        });
        var data = jsonDecode(res.body.toString());
        ref.read(userTokenProvider.notifier).update((token) {
          return data['access_token'];
        });
        print(ref.watch(userTokenProvider));
        print('Login successfully');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Mali")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error")));
    }
  }
}
