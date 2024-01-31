import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    required String password,
    required String name,
    required String role,
    required String avatar,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
