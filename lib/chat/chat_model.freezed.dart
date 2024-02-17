// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get message => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  String get receiver => throw _privateConstructorUsedError;
  String get receiverAvatar => throw _privateConstructorUsedError;
  String get receiverEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {String message,
      String sender,
      String receiver,
      String receiverAvatar,
      String receiverEmail});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sender = null,
    Object? receiver = null,
    Object? receiverAvatar = null,
    Object? receiverEmail = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String,
      receiverAvatar: null == receiverAvatar
          ? _value.receiverAvatar
          : receiverAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      receiverEmail: null == receiverEmail
          ? _value.receiverEmail
          : receiverEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String sender,
      String receiver,
      String receiverAvatar,
      String receiverEmail});
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sender = null,
    Object? receiver = null,
    Object? receiverAvatar = null,
    Object? receiverEmail = null,
  }) {
    return _then(_$MessageModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String,
      receiverAvatar: null == receiverAvatar
          ? _value.receiverAvatar
          : receiverAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      receiverEmail: null == receiverEmail
          ? _value.receiverEmail
          : receiverEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  const _$MessageModelImpl(
      {required this.message,
      required this.sender,
      required this.receiver,
      required this.receiverAvatar,
      required this.receiverEmail});

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final String message;
  @override
  final String sender;
  @override
  final String receiver;
  @override
  final String receiverAvatar;
  @override
  final String receiverEmail;

  @override
  String toString() {
    return 'MessageModel(message: $message, sender: $sender, receiver: $receiver, receiverAvatar: $receiverAvatar, receiverEmail: $receiverEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.receiverAvatar, receiverAvatar) ||
                other.receiverAvatar == receiverAvatar) &&
            (identical(other.receiverEmail, receiverEmail) ||
                other.receiverEmail == receiverEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, sender, receiver, receiverAvatar, receiverEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel(
      {required final String message,
      required final String sender,
      required final String receiver,
      required final String receiverAvatar,
      required final String receiverEmail}) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  String get message;
  @override
  String get sender;
  @override
  String get receiver;
  @override
  String get receiverAvatar;
  @override
  String get receiverEmail;
  @override
  @JsonKey(ignore: true)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SenderReceiver _$SenderReceiverFromJson(Map<String, dynamic> json) {
  return _SenderReceiver.fromJson(json);
}

/// @nodoc
mixin _$SenderReceiver {
  UserModel get sender => throw _privateConstructorUsedError;
  UserModel get receiver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SenderReceiverCopyWith<SenderReceiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenderReceiverCopyWith<$Res> {
  factory $SenderReceiverCopyWith(
          SenderReceiver value, $Res Function(SenderReceiver) then) =
      _$SenderReceiverCopyWithImpl<$Res, SenderReceiver>;
  @useResult
  $Res call({UserModel sender, UserModel receiver});

  $UserModelCopyWith<$Res> get sender;
  $UserModelCopyWith<$Res> get receiver;
}

/// @nodoc
class _$SenderReceiverCopyWithImpl<$Res, $Val extends SenderReceiver>
    implements $SenderReceiverCopyWith<$Res> {
  _$SenderReceiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? receiver = null,
  }) {
    return _then(_value.copyWith(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserModel,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get sender {
    return $UserModelCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get receiver {
    return $UserModelCopyWith<$Res>(_value.receiver, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SenderReceiverImplCopyWith<$Res>
    implements $SenderReceiverCopyWith<$Res> {
  factory _$$SenderReceiverImplCopyWith(_$SenderReceiverImpl value,
          $Res Function(_$SenderReceiverImpl) then) =
      __$$SenderReceiverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel sender, UserModel receiver});

  @override
  $UserModelCopyWith<$Res> get sender;
  @override
  $UserModelCopyWith<$Res> get receiver;
}

/// @nodoc
class __$$SenderReceiverImplCopyWithImpl<$Res>
    extends _$SenderReceiverCopyWithImpl<$Res, _$SenderReceiverImpl>
    implements _$$SenderReceiverImplCopyWith<$Res> {
  __$$SenderReceiverImplCopyWithImpl(
      _$SenderReceiverImpl _value, $Res Function(_$SenderReceiverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? receiver = null,
  }) {
    return _then(_$SenderReceiverImpl(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserModel,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SenderReceiverImpl implements _SenderReceiver {
  const _$SenderReceiverImpl({required this.sender, required this.receiver});

  factory _$SenderReceiverImpl.fromJson(Map<String, dynamic> json) =>
      _$$SenderReceiverImplFromJson(json);

  @override
  final UserModel sender;
  @override
  final UserModel receiver;

  @override
  String toString() {
    return 'SenderReceiver(sender: $sender, receiver: $receiver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SenderReceiverImpl &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sender, receiver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SenderReceiverImplCopyWith<_$SenderReceiverImpl> get copyWith =>
      __$$SenderReceiverImplCopyWithImpl<_$SenderReceiverImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SenderReceiverImplToJson(
      this,
    );
  }
}

abstract class _SenderReceiver implements SenderReceiver {
  const factory _SenderReceiver(
      {required final UserModel sender,
      required final UserModel receiver}) = _$SenderReceiverImpl;

  factory _SenderReceiver.fromJson(Map<String, dynamic> json) =
      _$SenderReceiverImpl.fromJson;

  @override
  UserModel get sender;
  @override
  UserModel get receiver;
  @override
  @JsonKey(ignore: true)
  _$$SenderReceiverImplCopyWith<_$SenderReceiverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
