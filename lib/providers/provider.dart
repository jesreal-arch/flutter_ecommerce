import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/models/token.dart';
import 'package:riverpod_app/models/usermodel.dart';
import 'package:riverpod_app/models/usermodel.dart';

part 'provider.g.dart';

@Riverpod()
Future<List<ProductModel>> showProducts(
    ShowProductsRef ref, String idProduct, String productName) async {
  final queryParameters = {
    'categoryId': idProduct,
    'title': productName,
  };
  final response = await http
      .get(Uri.https('api.escuelajs.co', '/api/v1/products/', queryParameters));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body);
    return json.map((prods) => ProductModel.fromJson(prods)).toList();
  } else {
    throw Exception();
  }
}

@Riverpod()
Future<List<CategoryModel>> showCategories(ShowCategoriesRef ref) async {
  final response =
      await http.get(Uri.https('api.escuelajs.co', '/api/v1/products'));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body)['category'];
    return json.map((prods) => CategoryModel.fromJson(prods)).toList();
  } else {
    throw Exception();
  }
}

@Riverpod()
Future<List<CategoryModel>> showcategory(ShowcategoryRef ref) async {
  final response =
      await http.get(Uri.https('api.escuelajs.co', '/api/v1/categories'));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body);
    return json.map((prods) => CategoryModel.fromJson(prods)).toList();
  } else {
    throw Exception();
  }
}

@Riverpod()
Future<List<UserModel>> users(UsersRef ref) async {
  final response =
      await http.get(Uri.https('api.escuelajs.co', '/api/v1/users'));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body);
    return json.map((prods) => UserModel.fromJson(prods)).toList();
  } else {
    throw Exception();
  }
}

@Riverpod()
Future<TokenModel> userauth(
    UserauthRef ref, String email, String password) async {
  final response = await http
      .post(Uri.https('api.escuelajs.co', '/api/v1/auth/login'), body: {
    "email": email,
    "password": password,
  });
  if (response.statusCode == 201) {
    final json = jsonDecode(response.body);
    return json.map((e) => TokenModel.fromJson(e));
  } else {
    throw Exception();
  }
}

final currentIndexProviderNavBar = StateProvider((ref) {
  return 0;
});
final currentIndexProviderHeader = StateProvider((ref) {
  return 1;
});
final currentPageView = StateProvider((ref) {
  return 0;
});
final searchProvider = StateProvider((ref) => "");

final userTokenProvider = StateProvider((ref) => "");
final timeprovider = StateProvider((ref) => false);
