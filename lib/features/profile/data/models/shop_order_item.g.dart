// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopOrderItem _$ShopOrderItemFromJson(Map<String, dynamic> json) =>
    _ShopOrderItem(
      productId: (json['productId'] as num?)?.toInt(),
      name: json['name'] as String?,
      productDescription: json['productDescription'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShopOrderItemToJson(_ShopOrderItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'productDescription': instance.productDescription,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'count': instance.count,
    };
