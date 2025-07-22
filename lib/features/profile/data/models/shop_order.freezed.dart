// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopOrder {

 int? get shopOrderId; int? get userId; int? get status; String? get address; String? get phoneNumber; String? get comment; List<ShopOrderItem>? get shopOrderItems; int? get totalPrice; int? get createdAt; int? get updatedAt;
/// Create a copy of ShopOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopOrderCopyWith<ShopOrder> get copyWith => _$ShopOrderCopyWithImpl<ShopOrder>(this as ShopOrder, _$identity);

  /// Serializes this ShopOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopOrder&&(identical(other.shopOrderId, shopOrderId) || other.shopOrderId == shopOrderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.shopOrderItems, shopOrderItems)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopOrderId,userId,status,address,phoneNumber,comment,const DeepCollectionEquality().hash(shopOrderItems),totalPrice,createdAt,updatedAt);

@override
String toString() {
  return 'ShopOrder(shopOrderId: $shopOrderId, userId: $userId, status: $status, address: $address, phoneNumber: $phoneNumber, comment: $comment, shopOrderItems: $shopOrderItems, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShopOrderCopyWith<$Res>  {
  factory $ShopOrderCopyWith(ShopOrder value, $Res Function(ShopOrder) _then) = _$ShopOrderCopyWithImpl;
@useResult
$Res call({
 int? shopOrderId, int? userId, int? status, String? address, String? phoneNumber, String? comment, List<ShopOrderItem>? shopOrderItems, int? totalPrice, int? createdAt, int? updatedAt
});




}
/// @nodoc
class _$ShopOrderCopyWithImpl<$Res>
    implements $ShopOrderCopyWith<$Res> {
  _$ShopOrderCopyWithImpl(this._self, this._then);

  final ShopOrder _self;
  final $Res Function(ShopOrder) _then;

/// Create a copy of ShopOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shopOrderId = freezed,Object? userId = freezed,Object? status = freezed,Object? address = freezed,Object? phoneNumber = freezed,Object? comment = freezed,Object? shopOrderItems = freezed,Object? totalPrice = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
shopOrderId: freezed == shopOrderId ? _self.shopOrderId : shopOrderId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,shopOrderItems: freezed == shopOrderItems ? _self.shopOrderItems : shopOrderItems // ignore: cast_nullable_to_non_nullable
as List<ShopOrderItem>?,totalPrice: freezed == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopOrder].
extension ShopOrderPatterns on ShopOrder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopOrder() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopOrder value)  $default,){
final _that = this;
switch (_that) {
case _ShopOrder():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopOrder value)?  $default,){
final _that = this;
switch (_that) {
case _ShopOrder() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? shopOrderId,  int? userId,  int? status,  String? address,  String? phoneNumber,  String? comment,  List<ShopOrderItem>? shopOrderItems,  int? totalPrice,  int? createdAt,  int? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopOrder() when $default != null:
return $default(_that.shopOrderId,_that.userId,_that.status,_that.address,_that.phoneNumber,_that.comment,_that.shopOrderItems,_that.totalPrice,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? shopOrderId,  int? userId,  int? status,  String? address,  String? phoneNumber,  String? comment,  List<ShopOrderItem>? shopOrderItems,  int? totalPrice,  int? createdAt,  int? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ShopOrder():
return $default(_that.shopOrderId,_that.userId,_that.status,_that.address,_that.phoneNumber,_that.comment,_that.shopOrderItems,_that.totalPrice,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? shopOrderId,  int? userId,  int? status,  String? address,  String? phoneNumber,  String? comment,  List<ShopOrderItem>? shopOrderItems,  int? totalPrice,  int? createdAt,  int? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShopOrder() when $default != null:
return $default(_that.shopOrderId,_that.userId,_that.status,_that.address,_that.phoneNumber,_that.comment,_that.shopOrderItems,_that.totalPrice,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopOrder implements ShopOrder {
  const _ShopOrder({this.shopOrderId, this.userId, this.status, this.address, this.phoneNumber, this.comment, final  List<ShopOrderItem>? shopOrderItems, this.totalPrice, this.createdAt, this.updatedAt}): _shopOrderItems = shopOrderItems;
  factory _ShopOrder.fromJson(Map<String, dynamic> json) => _$ShopOrderFromJson(json);

@override final  int? shopOrderId;
@override final  int? userId;
@override final  int? status;
@override final  String? address;
@override final  String? phoneNumber;
@override final  String? comment;
 final  List<ShopOrderItem>? _shopOrderItems;
@override List<ShopOrderItem>? get shopOrderItems {
  final value = _shopOrderItems;
  if (value == null) return null;
  if (_shopOrderItems is EqualUnmodifiableListView) return _shopOrderItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? totalPrice;
@override final  int? createdAt;
@override final  int? updatedAt;

/// Create a copy of ShopOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopOrderCopyWith<_ShopOrder> get copyWith => __$ShopOrderCopyWithImpl<_ShopOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopOrder&&(identical(other.shopOrderId, shopOrderId) || other.shopOrderId == shopOrderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._shopOrderItems, _shopOrderItems)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopOrderId,userId,status,address,phoneNumber,comment,const DeepCollectionEquality().hash(_shopOrderItems),totalPrice,createdAt,updatedAt);

@override
String toString() {
  return 'ShopOrder(shopOrderId: $shopOrderId, userId: $userId, status: $status, address: $address, phoneNumber: $phoneNumber, comment: $comment, shopOrderItems: $shopOrderItems, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShopOrderCopyWith<$Res> implements $ShopOrderCopyWith<$Res> {
  factory _$ShopOrderCopyWith(_ShopOrder value, $Res Function(_ShopOrder) _then) = __$ShopOrderCopyWithImpl;
@override @useResult
$Res call({
 int? shopOrderId, int? userId, int? status, String? address, String? phoneNumber, String? comment, List<ShopOrderItem>? shopOrderItems, int? totalPrice, int? createdAt, int? updatedAt
});




}
/// @nodoc
class __$ShopOrderCopyWithImpl<$Res>
    implements _$ShopOrderCopyWith<$Res> {
  __$ShopOrderCopyWithImpl(this._self, this._then);

  final _ShopOrder _self;
  final $Res Function(_ShopOrder) _then;

/// Create a copy of ShopOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopOrderId = freezed,Object? userId = freezed,Object? status = freezed,Object? address = freezed,Object? phoneNumber = freezed,Object? comment = freezed,Object? shopOrderItems = freezed,Object? totalPrice = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ShopOrder(
shopOrderId: freezed == shopOrderId ? _self.shopOrderId : shopOrderId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,shopOrderItems: freezed == shopOrderItems ? _self._shopOrderItems : shopOrderItems // ignore: cast_nullable_to_non_nullable
as List<ShopOrderItem>?,totalPrice: freezed == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
