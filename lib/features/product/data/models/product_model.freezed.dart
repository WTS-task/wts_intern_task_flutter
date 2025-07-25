// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

@HiveField(0) int? get productId;@HiveField(1) String? get name;@HiveField(2) String? get productDescription;@HiveField(3) double? get price;@HiveField(4) int? get userId;@HiveField(5) int? get categoryId;@HiveField(6) int? get rating;@HiveField(7) int? get popularity;@HiveField(8) String? get imageUrl;@HiveField(9) List<String>? get images;@HiveField(10) int? get createdAt;@HiveField(11) int? get updatedAt;@HiveField(12) int? get isFavorite;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&(identical(other.price, price) || other.price == price)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,name,productDescription,price,userId,categoryId,rating,popularity,imageUrl,const DeepCollectionEquality().hash(images),createdAt,updatedAt,isFavorite);

@override
String toString() {
  return 'ProductModel(productId: $productId, name: $name, productDescription: $productDescription, price: $price, userId: $userId, categoryId: $categoryId, rating: $rating, popularity: $popularity, imageUrl: $imageUrl, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? productId,@HiveField(1) String? name,@HiveField(2) String? productDescription,@HiveField(3) double? price,@HiveField(4) int? userId,@HiveField(5) int? categoryId,@HiveField(6) int? rating,@HiveField(7) int? popularity,@HiveField(8) String? imageUrl,@HiveField(9) List<String>? images,@HiveField(10) int? createdAt,@HiveField(11) int? updatedAt,@HiveField(12) int? isFavorite
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = freezed,Object? name = freezed,Object? productDescription = freezed,Object? price = freezed,Object? userId = freezed,Object? categoryId = freezed,Object? rating = freezed,Object? popularity = freezed,Object? imageUrl = freezed,Object? images = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isFavorite = freezed,}) {
  return _then(_self.copyWith(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,productDescription: freezed == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int? productId, @HiveField(1)  String? name, @HiveField(2)  String? productDescription, @HiveField(3)  double? price, @HiveField(4)  int? userId, @HiveField(5)  int? categoryId, @HiveField(6)  int? rating, @HiveField(7)  int? popularity, @HiveField(8)  String? imageUrl, @HiveField(9)  List<String>? images, @HiveField(10)  int? createdAt, @HiveField(11)  int? updatedAt, @HiveField(12)  int? isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.productId,_that.name,_that.productDescription,_that.price,_that.userId,_that.categoryId,_that.rating,_that.popularity,_that.imageUrl,_that.images,_that.createdAt,_that.updatedAt,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int? productId, @HiveField(1)  String? name, @HiveField(2)  String? productDescription, @HiveField(3)  double? price, @HiveField(4)  int? userId, @HiveField(5)  int? categoryId, @HiveField(6)  int? rating, @HiveField(7)  int? popularity, @HiveField(8)  String? imageUrl, @HiveField(9)  List<String>? images, @HiveField(10)  int? createdAt, @HiveField(11)  int? updatedAt, @HiveField(12)  int? isFavorite)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.productId,_that.name,_that.productDescription,_that.price,_that.userId,_that.categoryId,_that.rating,_that.popularity,_that.imageUrl,_that.images,_that.createdAt,_that.updatedAt,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int? productId, @HiveField(1)  String? name, @HiveField(2)  String? productDescription, @HiveField(3)  double? price, @HiveField(4)  int? userId, @HiveField(5)  int? categoryId, @HiveField(6)  int? rating, @HiveField(7)  int? popularity, @HiveField(8)  String? imageUrl, @HiveField(9)  List<String>? images, @HiveField(10)  int? createdAt, @HiveField(11)  int? updatedAt, @HiveField(12)  int? isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.productId,_that.name,_that.productDescription,_that.price,_that.userId,_that.categoryId,_that.rating,_that.popularity,_that.imageUrl,_that.images,_that.createdAt,_that.updatedAt,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({@HiveField(0) this.productId, @HiveField(1) this.name, @HiveField(2) this.productDescription, @HiveField(3) this.price, @HiveField(4) this.userId, @HiveField(5) this.categoryId, @HiveField(6) this.rating, @HiveField(7) this.popularity, @HiveField(8) this.imageUrl, @HiveField(9) final  List<String>? images, @HiveField(10) this.createdAt, @HiveField(11) this.updatedAt, @HiveField(12) this.isFavorite}): _images = images;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override@HiveField(0) final  int? productId;
@override@HiveField(1) final  String? name;
@override@HiveField(2) final  String? productDescription;
@override@HiveField(3) final  double? price;
@override@HiveField(4) final  int? userId;
@override@HiveField(5) final  int? categoryId;
@override@HiveField(6) final  int? rating;
@override@HiveField(7) final  int? popularity;
@override@HiveField(8) final  String? imageUrl;
 final  List<String>? _images;
@override@HiveField(9) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(10) final  int? createdAt;
@override@HiveField(11) final  int? updatedAt;
@override@HiveField(12) final  int? isFavorite;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.productDescription, productDescription) || other.productDescription == productDescription)&&(identical(other.price, price) || other.price == price)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,name,productDescription,price,userId,categoryId,rating,popularity,imageUrl,const DeepCollectionEquality().hash(_images),createdAt,updatedAt,isFavorite);

@override
String toString() {
  return 'ProductModel(productId: $productId, name: $name, productDescription: $productDescription, price: $price, userId: $userId, categoryId: $categoryId, rating: $rating, popularity: $popularity, imageUrl: $imageUrl, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? productId,@HiveField(1) String? name,@HiveField(2) String? productDescription,@HiveField(3) double? price,@HiveField(4) int? userId,@HiveField(5) int? categoryId,@HiveField(6) int? rating,@HiveField(7) int? popularity,@HiveField(8) String? imageUrl,@HiveField(9) List<String>? images,@HiveField(10) int? createdAt,@HiveField(11) int? updatedAt,@HiveField(12) int? isFavorite
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = freezed,Object? name = freezed,Object? productDescription = freezed,Object? price = freezed,Object? userId = freezed,Object? categoryId = freezed,Object? rating = freezed,Object? popularity = freezed,Object? imageUrl = freezed,Object? images = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isFavorite = freezed,}) {
  return _then(_ProductModel(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,productDescription: freezed == productDescription ? _self.productDescription : productDescription // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
