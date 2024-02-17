import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/models/usermodel.dart';
import 'package:http/http.dart' as http;

part 'auth_riverpod.g.dart';

@Riverpod()
Future<UserModel> currentUser(CurrentUserRef ref, String userToken) async {
  final response = await http
      .get(Uri.https('api.escuelajs.co', '/api/v1/auth/profile'), headers: {
    "Authorization": "Bearer $userToken",
  });
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return UserModel.fromJson(json);
  } else {
    throw Exception();
  }
}

@Riverpod()
Future<void> updateUser(UpdateUserRef ref, int id, String upEmail,
    String upName, String upPassword) async {
  final response = await http.put(
    Uri.https('api.escuelajs.co', '/api/v1/user/$id'),
    body: {
      "email": upEmail,
      "name": upName,
      'password': upPassword,
    },
  );

}
