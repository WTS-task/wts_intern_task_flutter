// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: (json['productId'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num?)?.toInt(),
      productDescription: json['productDescription'] as String,
      imageUrl: json['imageUrl'] as String?,
      isFavorite: (json['isFavorite'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'productDescription': instance.productDescription,
      'imageUrl': instance.imageUrl,
      'isFavorite': instance.isFavorite,
      'categoryId': instance.categoryId,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
      'images': instance.images,
    };
