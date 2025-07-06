// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CatalogModel _$CatalogModelFromJson(Map<String, dynamic> json) {
  return _CatalogModel.fromJson(json);
}

/// @nodoc
mixin _$CatalogModel {
  int get categoryId => throw _privateConstructorUsedError;
  int? get parentCategoryId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get isPublic => throw _privateConstructorUsedError;
  int get hasSubcategories => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CatalogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogModelCopyWith<CatalogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogModelCopyWith<$Res> {
  factory $CatalogModelCopyWith(
    CatalogModel value,
    $Res Function(CatalogModel) then,
  ) = _$CatalogModelCopyWithImpl<$Res, CatalogModel>;
  @useResult
  $Res call({
    int categoryId,
    int? parentCategoryId,
    String title,
    String fullName,
    String description,
    int isPublic,
    int hasSubcategories,
    String icon,
    int createdAt,
    int updatedAt,
  });
}

/// @nodoc
class _$CatalogModelCopyWithImpl<$Res, $Val extends CatalogModel>
    implements $CatalogModelCopyWith<$Res> {
  _$CatalogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? parentCategoryId = freezed,
    Object? title = null,
    Object? fullName = null,
    Object? description = null,
    Object? isPublic = null,
    Object? hasSubcategories = null,
    Object? icon = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int,
            parentCategoryId: freezed == parentCategoryId
                ? _value.parentCategoryId
                : parentCategoryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            isPublic: null == isPublic
                ? _value.isPublic
                : isPublic // ignore: cast_nullable_to_non_nullable
                      as int,
            hasSubcategories: null == hasSubcategories
                ? _value.hasSubcategories
                : hasSubcategories // ignore: cast_nullable_to_non_nullable
                      as int,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CatalogModelImplCopyWith<$Res>
    implements $CatalogModelCopyWith<$Res> {
  factory _$$CatalogModelImplCopyWith(
    _$CatalogModelImpl value,
    $Res Function(_$CatalogModelImpl) then,
  ) = __$$CatalogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int categoryId,
    int? parentCategoryId,
    String title,
    String fullName,
    String description,
    int isPublic,
    int hasSubcategories,
    String icon,
    int createdAt,
    int updatedAt,
  });
}

/// @nodoc
class __$$CatalogModelImplCopyWithImpl<$Res>
    extends _$CatalogModelCopyWithImpl<$Res, _$CatalogModelImpl>
    implements _$$CatalogModelImplCopyWith<$Res> {
  __$$CatalogModelImplCopyWithImpl(
    _$CatalogModelImpl _value,
    $Res Function(_$CatalogModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? parentCategoryId = freezed,
    Object? title = null,
    Object? fullName = null,
    Object? description = null,
    Object? isPublic = null,
    Object? hasSubcategories = null,
    Object? icon = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CatalogModelImpl(
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
        parentCategoryId: freezed == parentCategoryId
            ? _value.parentCategoryId
            : parentCategoryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        isPublic: null == isPublic
            ? _value.isPublic
            : isPublic // ignore: cast_nullable_to_non_nullable
                  as int,
        hasSubcategories: null == hasSubcategories
            ? _value.hasSubcategories
            : hasSubcategories // ignore: cast_nullable_to_non_nullable
                  as int,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogModelImpl implements _CatalogModel {
  const _$CatalogModelImpl({
    required this.categoryId,
    required this.parentCategoryId,
    required this.title,
    required this.fullName,
    required this.description,
    required this.isPublic,
    required this.hasSubcategories,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$CatalogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogModelImplFromJson(json);

  @override
  final int categoryId;
  @override
  final int? parentCategoryId;
  @override
  final String title;
  @override
  final String fullName;
  @override
  final String description;
  @override
  final int isPublic;
  @override
  final int hasSubcategories;
  @override
  final String icon;
  @override
  final int createdAt;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'CatalogModel(categoryId: $categoryId, parentCategoryId: $parentCategoryId, title: $title, fullName: $fullName, description: $description, isPublic: $isPublic, hasSubcategories: $hasSubcategories, icon: $icon, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.parentCategoryId, parentCategoryId) ||
                other.parentCategoryId == parentCategoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.hasSubcategories, hasSubcategories) ||
                other.hasSubcategories == hasSubcategories) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    parentCategoryId,
    title,
    fullName,
    description,
    isPublic,
    hasSubcategories,
    icon,
    createdAt,
    updatedAt,
  );

  /// Create a copy of CatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogModelImplCopyWith<_$CatalogModelImpl> get copyWith =>
      __$$CatalogModelImplCopyWithImpl<_$CatalogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogModelImplToJson(this);
  }
}

abstract class _CatalogModel implements CatalogModel {
  const factory _CatalogModel({
    required final int categoryId,
    required final int? parentCategoryId,
    required final String title,
    required final String fullName,
    required final String description,
    required final int isPublic,
    required final int hasSubcategories,
    required final String icon,
    required final int createdAt,
    required final int updatedAt,
  }) = _$CatalogModelImpl;

  factory _CatalogModel.fromJson(Map<String, dynamic> json) =
      _$CatalogModelImpl.fromJson;

  @override
  int get categoryId;
  @override
  int? get parentCategoryId;
  @override
  String get title;
  @override
  String get fullName;
  @override
  String get description;
  @override
  int get isPublic;
  @override
  int get hasSubcategories;
  @override
  String get icon;
  @override
  int get createdAt;
  @override
  int get updatedAt;

  /// Create a copy of CatalogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogModelImplCopyWith<_$CatalogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
