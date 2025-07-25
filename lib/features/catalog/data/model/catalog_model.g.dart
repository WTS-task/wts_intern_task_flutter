// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogResponse _$CatalogResponseFromJson(Map<String, dynamic> json) =>
    _CatalogResponse(
      categoryId: (json['categoryId'] as num).toInt(),
      parentCategoryId: (json['parentCategoryId'] as num?)?.toInt(),
      title: json['title'] as String,
      fullName: json['fullName'] as String,
      description: json['description'] as String,
      isPublic: (json['isPublic'] as num).toInt(),
      hasSubcategories: (json['hasSubcategories'] as num).toInt(),
      icon: json['icon'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogResponseToJson(_CatalogResponse instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'parentCategoryId': instance.parentCategoryId,
      'title': instance.title,
      'fullName': instance.fullName,
      'description': instance.description,
      'isPublic': instance.isPublic,
      'hasSubcategories': instance.hasSubcategories,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
