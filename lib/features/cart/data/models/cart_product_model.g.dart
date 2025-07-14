// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    _CartProductModel(
      count: (json['count'] as num).toInt(),
      isSelected: json['isSelected'] as bool,
      product:
          json['product'] == null
              ? null
              : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartProductModelToJson(_CartProductModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'isSelected': instance.isSelected,
      'product': instance.product,
    };
