// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageModelFetch {
  final String message;
  final String sender;
  final String receiver;
  final String receiverAvatar;
  final String emailReceiver;
  final Timestamp timeStamp;

  MessageModelFetch({
    required this.message,
    required this.sender,
    required this.receiver,
    required this.receiverAvatar,
    required this.emailReceiver,
    required this.timeStamp,
  });

  factory MessageModelFetch.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return MessageModelFetch(
        message: doc['message'],
        sender: doc['sender'],
        receiver: doc['receiver'],
        receiverAvatar: doc['receiverAvatar'],
        emailReceiver: doc['emailReceiver'],
        timeStamp: doc['timeStamp']);
  }
}
