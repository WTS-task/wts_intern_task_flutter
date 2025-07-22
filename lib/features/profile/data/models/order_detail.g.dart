// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => _OrderDetail(
  shopOrder:
      json['shopOrder'] == null
          ? null
          : ShopOrder.fromJson(json['shopOrder'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDetailToJson(_OrderDetail instance) =>
    <String, dynamic>{'shopOrder': instance.shopOrder};
