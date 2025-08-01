import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/core/services/api/json_converters.dart';

part 'category.g.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required int categoryId,
    required int? parentCategoryId,
    required String title,
    required String fullName,
    required String description,
    required int isPublic,
    @BoolJsonConverter() @Default(false) hasSubcategories,
    required String icon,
    required int createdAt,
    required int updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
