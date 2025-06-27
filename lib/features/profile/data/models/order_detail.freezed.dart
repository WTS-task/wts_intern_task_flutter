// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetail {
  ShopOrder? get shopOrder;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      _$OrderDetailCopyWithImpl<OrderDetail>(this as OrderDetail, _$identity);

  /// Serializes this OrderDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderDetail &&
            (identical(other.shopOrder, shopOrder) ||
                other.shopOrder == shopOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shopOrder);

  @override
  String toString() {
    return 'OrderDetail(shopOrder: $shopOrder)';
  }
}

/// @nodoc
abstract mixin class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) _then) =
      _$OrderDetailCopyWithImpl;
  @useResult
  $Res call({ShopOrder? shopOrder});

  $ShopOrderCopyWith<$Res>? get shopOrder;
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res> implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._self, this._then);

  final OrderDetail _self;
  final $Res Function(OrderDetail) _then;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopOrder = freezed,
  }) {
    return _then(_self.copyWith(
      shopOrder: freezed == shopOrder
          ? _self.shopOrder
          : shopOrder // ignore: cast_nullable_to_non_nullable
              as ShopOrder?,
    ));
  }

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShopOrderCopyWith<$Res>? get shopOrder {
    if (_self.shopOrder == null) {
      return null;
    }

    return $ShopOrderCopyWith<$Res>(_self.shopOrder!, (value) {
      return _then(_self.copyWith(shopOrder: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _OrderDetail implements OrderDetail {
  const _OrderDetail({this.shopOrder});
  factory _OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  @override
  final ShopOrder? shopOrder;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderDetailCopyWith<_OrderDetail> get copyWith =>
      __$OrderDetailCopyWithImpl<_OrderDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderDetail &&
            (identical(other.shopOrder, shopOrder) ||
                other.shopOrder == shopOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shopOrder);

  @override
  String toString() {
    return 'OrderDetail(shopOrder: $shopOrder)';
  }
}

/// @nodoc
abstract mixin class _$OrderDetailCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$OrderDetailCopyWith(
          _OrderDetail value, $Res Function(_OrderDetail) _then) =
      __$OrderDetailCopyWithImpl;
  @override
  @useResult
  $Res call({ShopOrder? shopOrder});

  @override
  $ShopOrderCopyWith<$Res>? get shopOrder;
}

/// @nodoc
class __$OrderDetailCopyWithImpl<$Res> implements _$OrderDetailCopyWith<$Res> {
  __$OrderDetailCopyWithImpl(this._self, this._then);

  final _OrderDetail _self;
  final $Res Function(_OrderDetail) _then;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shopOrder = freezed,
  }) {
    return _then(_OrderDetail(
      shopOrder: freezed == shopOrder
          ? _self.shopOrder
          : shopOrder // ignore: cast_nullable_to_non_nullable
              as ShopOrder?,
    ));
  }

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShopOrderCopyWith<$Res>? get shopOrder {
    if (_self.shopOrder == null) {
      return null;
    }

    return $ShopOrderCopyWith<$Res>(_self.shopOrder!, (value) {
      return _then(_self.copyWith(shopOrder: value));
    });
  }
}

// dart format on
