import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_product.freezed.dart';
part 'model_product.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required double price,
    required Map<String, dynamic> category,
    required String description,
    required List<String> images,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@Freezed()
class CategoryModel with _$CategoryModel{
  const factory CategoryModel({
    required int id,
    required String name,
    required String image,
  }) = _CategoryModel;
 factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

}