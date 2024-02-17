// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      message: json['message'] as String,
      sender: json['sender'] as String,
      receiver: json['receiver'] as String,
      receiverAvatar: json['receiverAvatar'] as String,
      receiverEmail: json['receiverEmail'] as String,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'receiverAvatar': instance.receiverAvatar,
      'receiverEmail': instance.receiverEmail,
    };

_$SenderReceiverImpl _$$SenderReceiverImplFromJson(Map<String, dynamic> json) =>
    _$SenderReceiverImpl(
      sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: UserModel.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SenderReceiverImplToJson(
        _$SenderReceiverImpl instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'receiver': instance.receiver,
    };
