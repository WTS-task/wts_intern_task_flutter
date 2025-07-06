import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

part 'product_model.freezed.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int productId,
    required String name,
    required int? price,
    required String productDescription,
    required String? imageUrl,
    required int isFavorite,
    required int categoryId,
    required int? rating,
    required int createdAt,
    required List<String?> images,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
