// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 int? get productId; String? get name; String? get productDescription; String? get imageUrl; int? get price; int? get count;
/// Create a copy of ShopOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopOrderItemCopyWith<ShopOrderItem> get copyWith => _$ShopOrderItemCopyWithImpl<ShopOrderItem>(this as ShopOrderItem, _$identity);

  /// Serializes this ShopOrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopOrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,name,productDescription,imageUrl,price,count);

@override
String toString() {
  return 'ShopOrderItem(productId: $productId, name: $name, productDescription: $productDescription, imageUrl: $imageUrl, price: $price, count: $count)';
}


}

/// @nodoc
abstract mixin class $ShopOrderItemCopyWith<$Res>  {
  factory $ShopOrderItemCopyWith(ShopOrderItem value, $Res Function(ShopOrderItem) _then) = _$ShopOrderItemCopyWithImpl;
@useResult
$Res call({
 int? productId, String? name, String? productDescription, String? imageUrl, int? price, int? count
});




}
/// @nodoc
class _$ShopOrderItemCopyWithImpl<$Res>
    implements $ShopOrderItemCopyWith<$Res> {
  _$ShopOrderItemCopyWithImpl(this._self, this._then);

  final ShopOrderItem _self;
  final $Res Function(ShopOrderItem) _then;

/// Create a copy of ShopOrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = freezed,Object? name = freezed,Object? productDescription = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? count = freezed,}) {
  return _then(_self.copyWith(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,productDescription: freezed == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopOrderItem].
extension ShopOrderItemPatterns on ShopOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopOrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopOrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopOrderItem value)  $default,){
final _that = this;
switch (_that) {
case _ShopOrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopOrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _ShopOrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? productId,  String? name,  String? productDescription,  String? imageUrl,  int? price,  int? count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopOrderItem() when $default != null:
return $default(_that.productId,_that.name,_that.productDescription,_that.imageUrl,_that.price,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? productId,  String? name,  String? productDescription,  String? imageUrl,  int? price,  int? count)  $default,) {final _that = this;
switch (_that) {
case _ShopOrderItem():
return $default(_that.productId,_that.name,_that.productDescription,_that.imageUrl,_that.price,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? productId,  String? name,  String? productDescription,  String? imageUrl,  int? price,  int? count)?  $default,) {final _that = this;
switch (_that) {
case _ShopOrderItem() when $default != null:
return $default(_that.productId,_that.name,_that.productDescription,_that.imageUrl,_that.price,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopOrderItem implements ShopOrderItem {
  const _ShopOrderItem({this.productId, this.name, this.productDescription, this.imageUrl, this.price, this.count});
  factory _ShopOrderItem.fromJson(Map<String, dynamic> json) => _$ShopOrderItemFromJson(json);

@override final  int? productId;
@override final  String? name;
@override final  String? productDescription;
@override final  String? imageUrl;
@override final  int? price;
@override final  int? count;

/// Create a copy of ShopOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopOrderItemCopyWith<_ShopOrderItem> get copyWith => __$ShopOrderItemCopyWithImpl<_ShopOrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopOrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopOrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,name,productDescription,imageUrl,price,count);

@override
String toString() {
  return 'ShopOrderItem(productId: $productId, name: $name, productDescription: $productDescription, imageUrl: $imageUrl, price: $price, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ShopOrderItemCopyWith<$Res> implements $ShopOrderItemCopyWith<$Res> {
  factory _$ShopOrderItemCopyWith(_ShopOrderItem value, $Res Function(_ShopOrderItem) _then) = __$ShopOrderItemCopyWithImpl;
@override @useResult
$Res call({
 int? productId, String? name, String? productDescription, String? imageUrl, int? price, int? count
});




}
/// @nodoc
class __$ShopOrderItemCopyWithImpl<$Res>
    implements _$ShopOrderItemCopyWith<$Res> {
  __$ShopOrderItemCopyWithImpl(this._self, this._then);

  final _ShopOrderItem _self;
  final $Res Function(_ShopOrderItem) _then;

/// Create a copy of ShopOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = freezed,Object? name = freezed,Object? productDescription = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? count = freezed,}) {
  return _then(_ShopOrderItem(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,productDescription: freezed == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
