// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@Freezed()
class TokenModel with _$TokenModel {
  const factory TokenModel({
    
    required String access_token,
    required String refresh_token,
 
  }) = _TokenModel;
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
