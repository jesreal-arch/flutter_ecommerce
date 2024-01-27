import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/models/model_product.dart';

part 'provider.g.dart';

@Riverpod()
Future<List<ProductModel>> showProducts(ShowProductsRef ref) async {
  final response = await http.get(Uri.https('api.escuelajs.co', '/api/v1/products'));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body);
    return json.map((prods) => ProductModel.fromJson(prods)).toList();
  } else {
    throw Exception();
  }
}

@Riverpod()
Future<List<CategoryModel>> showCategories(ShowCategoriesRef ref) async {
  final response = await http.get(Uri.https('api.escuelajs.co', '/api/v1/products'));
  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body)['category'];
    return json.map((prods) => CategoryModel.fromJson(prods)).toList();
  } else {
    throw Exception();
  }
}

final currentIndexProviderNavBar = StateProvider((ref) {
  return 0;
});