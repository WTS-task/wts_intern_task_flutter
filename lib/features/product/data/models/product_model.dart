import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    @HiveField(0) int? productId,
    @HiveField(1) String? name,
    @HiveField(2) String? productDescription,
    @HiveField(3) double? price,
    @HiveField(4) int? userId,
    @HiveField(5) int? categoryId,
    @HiveField(6) int? rating,
    @HiveField(7) int? popularity,
    @HiveField(8) String? imageUrl,
    @HiveField(9) List<String>? images,
    @HiveField(10) int? createdAt,
    @HiveField(11) int? updatedAt,
    @HiveField(12) int? isFavorite,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
