import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    int? productId,
    String? name,
    String? productDescription,
    double? price,
    int? userId,
    int? categoryId,
    int? rating,
    int? popularity,
    String? imageUrl,
    List<String>? images,
    int? createdAt,
    int? updatedAt,
    int? isFavorite,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
