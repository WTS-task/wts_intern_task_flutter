// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  categoryId: (json['categoryId'] as num).toInt(),
  parentCategoryId: (json['parentCategoryId'] as num?)?.toInt(),
  title: json['title'] as String,
  fullName: json['fullName'] as String,
  description: json['description'] as String,
  isPublic: (json['isPublic'] as num).toInt(),
  hasSubcategories: json['hasSubcategories'] ?? false,
  icon: json['icon'] as String,
  createdAt: (json['createdAt'] as num).toInt(),
  updatedAt: (json['updatedAt'] as num).toInt(),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
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
