import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_model.g.dart';

part 'catalog_model.freezed.dart';

@freezed
abstract class CatalogResponse with _$CatalogResponse {
  const factory CatalogResponse({
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
  }) = _CatalogResponse;

  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseFromJson(json);
}
