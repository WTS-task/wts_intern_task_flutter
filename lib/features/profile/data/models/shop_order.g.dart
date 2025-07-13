// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopOrder _$ShopOrderFromJson(Map<String, dynamic> json) => _ShopOrder(
  shopOrderId: (json['shopOrderId'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  address: json['address'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  comment: json['comment'] as String?,
  shopOrderItems:
      (json['shopOrderItems'] as List<dynamic>?)
          ?.map((e) => ShopOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  createdAt: (json['createdAt'] as num?)?.toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShopOrderToJson(_ShopOrder instance) =>
    <String, dynamic>{
      'shopOrderId': instance.shopOrderId,
      'userId': instance.userId,
      'status': instance.status,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'comment': instance.comment,
      'shopOrderItems': instance.shopOrderItems,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
