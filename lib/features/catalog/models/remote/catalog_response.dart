import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';

part 'catalog_response.g.dart';

part 'catalog_response.freezed.dart';

@Freezed()
class CatalogResponse with _$CatalogResponse {
  const factory CatalogResponse({required CatalogData data}) = _CatalogResponse;

  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseFromJson(json);
}

@freezed
class CatalogData with _$CatalogData {
  const factory CatalogData({required List<CatalogModel> categories}) =
      _CatalogData;

  factory CatalogData.fromJson(Map<String, dynamic> json) =>
      _$CatalogDataFromJson(json);
}
