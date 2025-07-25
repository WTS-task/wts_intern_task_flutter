// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogResponse {

 int get categoryId; int? get parentCategoryId; String get title; String get fullName; String get description; int get isPublic; int get hasSubcategories; String get icon; int get createdAt; int get updatedAt;
/// Create a copy of CatalogResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogResponseCopyWith<CatalogResponse> get copyWith => _$CatalogResponseCopyWithImpl<CatalogResponse>(this as CatalogResponse, _$identity);

  /// Serializes this CatalogResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogResponse&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.hasSubcategories, hasSubcategories) || other.hasSubcategories == hasSubcategories)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,parentCategoryId,title,fullName,description,isPublic,hasSubcategories,icon,createdAt,updatedAt);

@override
String toString() {
  return 'CatalogResponse(categoryId: $categoryId, parentCategoryId: $parentCategoryId, title: $title, fullName: $fullName, description: $description, isPublic: $isPublic, hasSubcategories: $hasSubcategories, icon: $icon, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CatalogResponseCopyWith<$Res>  {
  factory $CatalogResponseCopyWith(CatalogResponse value, $Res Function(CatalogResponse) _then) = _$CatalogResponseCopyWithImpl;
@useResult
$Res call({
 int categoryId, int? parentCategoryId, String title, String fullName, String description, int isPublic, int hasSubcategories, String icon, int createdAt, int updatedAt
});




}
/// @nodoc
class _$CatalogResponseCopyWithImpl<$Res>
    implements $CatalogResponseCopyWith<$Res> {
  _$CatalogResponseCopyWithImpl(this._self, this._then);

  final CatalogResponse _self;
  final $Res Function(CatalogResponse) _then;

/// Create a copy of CatalogResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? parentCategoryId = freezed,Object? title = null,Object? fullName = null,Object? description = null,Object? isPublic = null,Object? hasSubcategories = null,Object? icon = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,parentCategoryId: freezed == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as int,hasSubcategories: null == hasSubcategories ? _self.hasSubcategories : hasSubcategories // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogResponse].
extension CatalogResponsePatterns on CatalogResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogResponse value)  $default,){
final _that = this;
switch (_that) {
case _CatalogResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryId,  int? parentCategoryId,  String title,  String fullName,  String description,  int isPublic,  int hasSubcategories,  String icon,  int createdAt,  int updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogResponse() when $default != null:
return $default(_that.categoryId,_that.parentCategoryId,_that.title,_that.fullName,_that.description,_that.isPublic,_that.hasSubcategories,_that.icon,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryId,  int? parentCategoryId,  String title,  String fullName,  String description,  int isPublic,  int hasSubcategories,  String icon,  int createdAt,  int updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CatalogResponse():
return $default(_that.categoryId,_that.parentCategoryId,_that.title,_that.fullName,_that.description,_that.isPublic,_that.hasSubcategories,_that.icon,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryId,  int? parentCategoryId,  String title,  String fullName,  String description,  int isPublic,  int hasSubcategories,  String icon,  int createdAt,  int updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CatalogResponse() when $default != null:
return $default(_that.categoryId,_that.parentCategoryId,_that.title,_that.fullName,_that.description,_that.isPublic,_that.hasSubcategories,_that.icon,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogResponse implements CatalogResponse {
  const _CatalogResponse({required this.categoryId, required this.parentCategoryId, required this.title, required this.fullName, required this.description, required this.isPublic, required this.hasSubcategories, required this.icon, required this.createdAt, required this.updatedAt});
  factory _CatalogResponse.fromJson(Map<String, dynamic> json) => _$CatalogResponseFromJson(json);

@override final  int categoryId;
@override final  int? parentCategoryId;
@override final  String title;
@override final  String fullName;
@override final  String description;
@override final  int isPublic;
@override final  int hasSubcategories;
@override final  String icon;
@override final  int createdAt;
@override final  int updatedAt;

/// Create a copy of CatalogResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogResponseCopyWith<_CatalogResponse> get copyWith => __$CatalogResponseCopyWithImpl<_CatalogResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogResponse&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId)&&(identical(other.title, title) || other.title == title)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.hasSubcategories, hasSubcategories) || other.hasSubcategories == hasSubcategories)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,parentCategoryId,title,fullName,description,isPublic,hasSubcategories,icon,createdAt,updatedAt);

@override
String toString() {
  return 'CatalogResponse(categoryId: $categoryId, parentCategoryId: $parentCategoryId, title: $title, fullName: $fullName, description: $description, isPublic: $isPublic, hasSubcategories: $hasSubcategories, icon: $icon, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CatalogResponseCopyWith<$Res> implements $CatalogResponseCopyWith<$Res> {
  factory _$CatalogResponseCopyWith(_CatalogResponse value, $Res Function(_CatalogResponse) _then) = __$CatalogResponseCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, int? parentCategoryId, String title, String fullName, String description, int isPublic, int hasSubcategories, String icon, int createdAt, int updatedAt
});




}
/// @nodoc
class __$CatalogResponseCopyWithImpl<$Res>
    implements _$CatalogResponseCopyWith<$Res> {
  __$CatalogResponseCopyWithImpl(this._self, this._then);

  final _CatalogResponse _self;
  final $Res Function(_CatalogResponse) _then;

/// Create a copy of CatalogResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? parentCategoryId = freezed,Object? title = null,Object? fullName = null,Object? description = null,Object? isPublic = null,Object? hasSubcategories = null,Object? icon = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CatalogResponse(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,parentCategoryId: freezed == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as int,hasSubcategories: null == hasSubcategories ? _self.hasSubcategories : hasSubcategories // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
