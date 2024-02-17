import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_app/auth/auth_riverpod.dart';
import 'package:riverpod_app/chat/chat.dart';
import 'package:riverpod_app/chat/chat_model.dart';
import 'package:riverpod_app/chat/provider/chatprovider.dart';
import 'package:riverpod_app/components/navbar.dart';
import 'package:riverpod_app/models/usermodel.dart';
import 'package:riverpod_app/providers/provider.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);
    final currentUser =
        ref.watch(CurrentUserProvider(ref.watch(userTokenProvider)));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(currentUser.value!.avatar),
            ),
          )
        ],
        title: Text(
          "Message",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: users.when(data: (users) {
                  final List<UserModel> perUser = users.map((user) {
                    return user;
                  }).toList();
                  return ListView.builder(
                      itemCount: perUser.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Inbox(
                                        perUser[index],
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(perUser[index].avatar),
                                ),
                                Text(
                                  perUser[index].name,
                                  style:
                                      GoogleFonts.poppins(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }, error: (e, s) {
                  return const Text("Error");
                }, loading: () {
                  return const CircularProgressIndicator();
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Recent Messages",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black.withOpacity(.7)),
                ),
              ),
              Expanded(
                child: users.when(data: (users) {
                  final List<UserModel> perUser = users.map((user) {
                    return user;
                  }).toList();
                  return ListView.builder(
                      itemCount: perUser.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Inbox(
                                          perUser[index],
                                        )),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                      perUser[index].avatar,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          perUser[index].name,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      });
                }, error: (e, s) {
                  return const Text("Error");
                }, loading: () {
                  return const CircularProgressIndicator();
                }),
              )
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
