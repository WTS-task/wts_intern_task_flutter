import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_model.g.dart';

part 'catalog_model.freezed.dart';

@Freezed()
class CatalogModel with _$CatalogModel {
  const factory CatalogModel({
    required int categoryId,
    required int? parentCategoryId,
    required String title,
    required String fullName,
    required String description,
    required int isPublic,
    required int hasSubcategories,
    required String icon,
    required int createdAt,
    required int updatedAt,
  }) = _CatalogModel;

  factory CatalogModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogModelFromJson(json);
}
