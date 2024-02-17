import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/auth/auth_riverpod.dart';

import 'package:riverpod_app/chat/chat_model.dart';
import 'package:riverpod_app/chat/chatmodelStream.dart';
import 'package:riverpod_app/chat/provider/chatprovider.dart';
import 'package:riverpod_app/chat/provider/datesent.dart';
import 'package:riverpod_app/models/usermodel.dart';
import 'package:riverpod_app/providers/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Inbox extends ConsumerStatefulWidget {
  const Inbox(this.recipient, {super.key});

  final UserModel recipient;

  @override
  ConsumerState<Inbox> createState() => _InboxState();
}

class _InboxState extends ConsumerState<Inbox> {
  final chatFN = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chatFN.addListener(() {
      if (chatFN.hasFocus) {
        Future.delayed(const Duration(milliseconds: 500), () {
          return scrollDown();
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
  }

  @override
  void dispose() {
    chatFN.dispose();
    super.dispose();
  }

  final ScrollController _controller = ScrollController();

  void scrollDown() {
    _controller.animateTo(_controller.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    final message = TextEditingController();
    final userToken = ref.watch(userTokenProvider);
    final currentUser = ref.watch(CurrentUserProvider(userToken));
    List<String> ids = [currentUser.value!.name, widget.recipient.name];
    ids.sort();
    String chatroomId = ids.join("_");
    final stream = FirebaseFirestore.instance
        .collection('chats')
        .doc(chatroomId)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();

    void login() {
      if (message.text.isNotEmpty) {
        ref.read(SendMessageProvider(
          widget.recipient.name,
          message.text,
          widget.recipient.avatar,
          currentUser.value!.name,
          widget.recipient.email,
        ));
        message.clear();
      } else {}
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Ionicons.menu),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(widget.recipient.avatar)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.recipient.name,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.recipient.email,
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LottieBuilder.network(
                "https://lottie.host/b0415db8-d19e-454c-8071-d0689244d141/qWTwoV1YNL.json");
          }

          return SingleChildScrollView(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final MessageModelFetch fetchData =
                      MessageModelFetch.fromSnapshot(
                          snapshot.data!.docs[index]);
                  DateTime lastLog = (fetchData.timeStamp.toDate());
                  String timeSent = DateFormat.jm().format(lastLog);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        alignment: fetchData.sender == currentUser.value!.name
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: fetchData.sender == currentUser.value!.name
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              fetchData.message,
                                              softWrap: true,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          timeSent,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black.withOpacity(.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        NetworkImage(currentUser.value!.avatar),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        NetworkImage(widget.recipient.avatar),
                                  ),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth:
                                                  MediaQuery.of(context).size.width),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              fetchData.message,
                                              softWrap: true,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                          Text(
                                          timeSent,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black.withOpacity(.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  );
                }),
          );
        },
        stream: stream,
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          color: Colors.white,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(77, 94, 91, 91),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        focusNode: chatFN,
                        controller: message,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter a message",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      login();
                      scrollDown();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                          child: Icon(
                        Ionicons.send,
                        color: Colors.white,
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
