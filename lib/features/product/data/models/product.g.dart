// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  productId: (json['productId'] as num?)?.toInt(),
  name: json['name'] as String?,
  productDescription: json['productDescription'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  userId: (json['userId'] as num?)?.toInt(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toInt(),
  popularity: (json['popularity'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: (json['createdAt'] as num?)?.toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
  isFavorite: (json['isFavorite'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'productId': instance.productId,
  'name': instance.name,
  'productDescription': instance.productDescription,
  'price': instance.price,
  'userId': instance.userId,
  'categoryId': instance.categoryId,
  'rating': instance.rating,
  'popularity': instance.popularity,
  'imageUrl': instance.imageUrl,
  'images': instance.images,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'isFavorite': instance.isFavorite,
};
