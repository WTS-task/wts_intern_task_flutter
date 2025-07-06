// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogResponseImpl _$$CatalogResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CatalogResponseImpl(
  data: CatalogData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CatalogResponseImplToJson(
  _$CatalogResponseImpl instance,
) => <String, dynamic>{'data': instance.data};

_$CatalogDataImpl _$$CatalogDataImplFromJson(Map<String, dynamic> json) =>
    _$CatalogDataImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CatalogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CatalogDataImplToJson(_$CatalogDataImpl instance) =>
    <String, dynamic>{'categories': instance.categories};
