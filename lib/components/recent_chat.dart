import 'package:flutter/material.dart';
import 'package:riverpod_app/chat/chatmodelStream.dart';

class Recents extends StatelessWidget {
  const Recents({super.key, required this.recipient});

  final MessageModelFetch recipient;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(recipient.receiverAvatar),
        ),
        Text(recipient.receiver),
        Text(recipient.message),
      ]),
    );
  }
}
