import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    int? categoryId,
    int? parentCategoryId,
    String? title,
    String? fullName,
    String? description,
    int? isPublic,
    int? hasSubcategories,
    int? priority,
    String? icon,
    int? createdAt,
    int? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}