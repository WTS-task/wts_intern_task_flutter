import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
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
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
