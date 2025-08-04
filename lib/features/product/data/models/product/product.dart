import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/core/services/api/json_converters.dart';

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
    @BoolJsonConverter() @Default(false) isFavorite,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}