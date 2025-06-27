// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopOrderItem {
  int? get productId;
  String? get name;
  String? get productDescription;
  String? get imageUrl;
  int? get price;
  int? get count;

  /// Create a copy of ShopOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShopOrderItemCopyWith<ShopOrderItem> get copyWith =>
      _$ShopOrderItemCopyWithImpl<ShopOrderItem>(
          this as ShopOrderItem, _$identity);

  /// Serializes this ShopOrderItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShopOrderItem &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productDescription, productDescription) ||
                other.productDescription == productDescription) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, name, productDescription, imageUrl, price, count);

  @override
  String toString() {
    return 'ShopOrderItem(productId: $productId, name: $name, productDescription: $productDescription, imageUrl: $imageUrl, price: $price, count: $count)';
  }
}

/// @nodoc
abstract mixin class $ShopOrderItemCopyWith<$Res> {
  factory $ShopOrderItemCopyWith(
          ShopOrderItem value, $Res Function(ShopOrderItem) _then) =
      _$ShopOrderItemCopyWithImpl;
  @useResult
  $Res call(
      {int? productId,
      String? name,
      String? productDescription,
      String? imageUrl,
      int? price,
      int? count});
}

/// @nodoc
class _$ShopOrderItemCopyWithImpl<$Res>
    implements $ShopOrderItemCopyWith<$Res> {
  _$ShopOrderItemCopyWithImpl(this._self, this._then);

  final ShopOrderItem _self;
  final $Res Function(ShopOrderItem) _then;

  /// Create a copy of ShopOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? name = freezed,
    Object? productDescription = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? count = freezed,
  }) {
    return _then(_self.copyWith(
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: freezed == productDescription
          ? _self.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ShopOrderItem implements ShopOrderItem {
  const _ShopOrderItem(
      {this.productId,
      this.name,
      this.productDescription,
      this.imageUrl,
      this.price,
      this.count});
  factory _ShopOrderItem.fromJson(Map<String, dynamic> json) =>
      _$ShopOrderItemFromJson(json);

  @override
  final int? productId;
  @override
  final String? name;
  @override
  final String? productDescription;
  @override
  final String? imageUrl;
  @override
  final int? price;
  @override
  final int? count;

  /// Create a copy of ShopOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShopOrderItemCopyWith<_ShopOrderItem> get copyWith =>
      __$ShopOrderItemCopyWithImpl<_ShopOrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShopOrderItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopOrderItem &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productDescription, productDescription) ||
                other.productDescription == productDescription) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, name, productDescription, imageUrl, price, count);

  @override
  String toString() {
    return 'ShopOrderItem(productId: $productId, name: $name, productDescription: $productDescription, imageUrl: $imageUrl, price: $price, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$ShopOrderItemCopyWith<$Res>
    implements $ShopOrderItemCopyWith<$Res> {
  factory _$ShopOrderItemCopyWith(
          _ShopOrderItem value, $Res Function(_ShopOrderItem) _then) =
      __$ShopOrderItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? productId,
      String? name,
      String? productDescription,
      String? imageUrl,
      int? price,
      int? count});
}

/// @nodoc
class __$ShopOrderItemCopyWithImpl<$Res>
    implements _$ShopOrderItemCopyWith<$Res> {
  __$ShopOrderItemCopyWithImpl(this._self, this._then);

  final _ShopOrderItem _self;
  final $Res Function(_ShopOrderItem) _then;

  /// Create a copy of ShopOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = freezed,
    Object? name = freezed,
    Object? productDescription = freezed,
    Object? imageUrl = freezed,
    Object? price = freezed,
    Object? count = freezed,
  }) {
    return _then(_ShopOrderItem(
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: freezed == productDescription
          ? _self.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
