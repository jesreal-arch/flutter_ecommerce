import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/chat/chat_model.dart';
import 'package:riverpod_app/chat/chatmodelStream.dart';

part 'chatprovider.g.dart';

@Riverpod()
Future<void> sendMessage(SendMessageRef ref, String receiver, String message,
    String receiverAvatar, String currentUser, String receiverEmail) async {
  Timestamp timestamp = Timestamp.now();
  
  List<String> ids = [currentUser, receiver];
  ids.sort();
  String chatroomId = ids.join("_");

  await FirebaseFirestore.instance
      .collection("chats")
      .doc(chatroomId)
      .collection("messages")
      .add({
    'message': message,
    'sender': currentUser,
    'receiver': receiver,
    'receiverAvatar': receiverAvatar,
    'emailReceiver': receiverEmail,
    'timeStamp': timestamp
  });
}
