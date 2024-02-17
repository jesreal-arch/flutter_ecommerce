import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/models/usermodel.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@Freezed()
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String message,
    required String sender,
    required String receiver,
    required String receiverAvatar,
    required String receiverEmail,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  
}

@Freezed()
class SenderReceiver with _$SenderReceiver {
  const factory SenderReceiver({
    required UserModel sender,
    required UserModel receiver,
  }) = _SenderReceiver;

  factory SenderReceiver.fromJson(Map<String, dynamic> json) =>
      _$SenderReceiverFromJson(json);
}
