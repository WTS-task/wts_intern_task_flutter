// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CatalogResponse _$CatalogResponseFromJson(Map<String, dynamic> json) {
  return _CatalogResponse.fromJson(json);
}

/// @nodoc
mixin _$CatalogResponse {
  CatalogData get data => throw _privateConstructorUsedError;

  /// Serializes this CatalogResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CatalogResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogResponseCopyWith<CatalogResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogResponseCopyWith<$Res> {
  factory $CatalogResponseCopyWith(
    CatalogResponse value,
    $Res Function(CatalogResponse) then,
  ) = _$CatalogResponseCopyWithImpl<$Res, CatalogResponse>;
  @useResult
  $Res call({CatalogData data});

  $CatalogDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CatalogResponseCopyWithImpl<$Res, $Val extends CatalogResponse>
    implements $CatalogResponseCopyWith<$Res> {
  _$CatalogResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as CatalogData,
          )
          as $Val,
    );
  }

  /// Create a copy of CatalogResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CatalogDataCopyWith<$Res> get data {
    return $CatalogDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CatalogResponseImplCopyWith<$Res>
    implements $CatalogResponseCopyWith<$Res> {
  factory _$$CatalogResponseImplCopyWith(
    _$CatalogResponseImpl value,
    $Res Function(_$CatalogResponseImpl) then,
  ) = __$$CatalogResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CatalogData data});

  @override
  $CatalogDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CatalogResponseImplCopyWithImpl<$Res>
    extends _$CatalogResponseCopyWithImpl<$Res, _$CatalogResponseImpl>
    implements _$$CatalogResponseImplCopyWith<$Res> {
  __$$CatalogResponseImplCopyWithImpl(
    _$CatalogResponseImpl _value,
    $Res Function(_$CatalogResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CatalogResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$CatalogResponseImpl(
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as CatalogData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogResponseImpl implements _CatalogResponse {
  const _$CatalogResponseImpl({required this.data});

  factory _$CatalogResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogResponseImplFromJson(json);

  @override
  final CatalogData data;

  @override
  String toString() {
    return 'CatalogResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CatalogResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogResponseImplCopyWith<_$CatalogResponseImpl> get copyWith =>
      __$$CatalogResponseImplCopyWithImpl<_$CatalogResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogResponseImplToJson(this);
  }
}

abstract class _CatalogResponse implements CatalogResponse {
  const factory _CatalogResponse({required final CatalogData data}) =
      _$CatalogResponseImpl;

  factory _CatalogResponse.fromJson(Map<String, dynamic> json) =
      _$CatalogResponseImpl.fromJson;

  @override
  CatalogData get data;

  /// Create a copy of CatalogResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogResponseImplCopyWith<_$CatalogResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CatalogData _$CatalogDataFromJson(Map<String, dynamic> json) {
  return _CatalogData.fromJson(json);
}

/// @nodoc
mixin _$CatalogData {
  List<CatalogModel> get categories => throw _privateConstructorUsedError;

  /// Serializes this CatalogData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CatalogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogDataCopyWith<CatalogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogDataCopyWith<$Res> {
  factory $CatalogDataCopyWith(
    CatalogData value,
    $Res Function(CatalogData) then,
  ) = _$CatalogDataCopyWithImpl<$Res, CatalogData>;
  @useResult
  $Res call({List<CatalogModel> categories});
}

/// @nodoc
class _$CatalogDataCopyWithImpl<$Res, $Val extends CatalogData>
    implements $CatalogDataCopyWith<$Res> {
  _$CatalogDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _value.copyWith(
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CatalogModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CatalogDataImplCopyWith<$Res>
    implements $CatalogDataCopyWith<$Res> {
  factory _$$CatalogDataImplCopyWith(
    _$CatalogDataImpl value,
    $Res Function(_$CatalogDataImpl) then,
  ) = __$$CatalogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatalogModel> categories});
}

/// @nodoc
class __$$CatalogDataImplCopyWithImpl<$Res>
    extends _$CatalogDataCopyWithImpl<$Res, _$CatalogDataImpl>
    implements _$$CatalogDataImplCopyWith<$Res> {
  __$$CatalogDataImplCopyWithImpl(
    _$CatalogDataImpl _value,
    $Res Function(_$CatalogDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CatalogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _$CatalogDataImpl(
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CatalogModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogDataImpl implements _CatalogData {
  const _$CatalogDataImpl({required final List<CatalogModel> categories})
    : _categories = categories;

  factory _$CatalogDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogDataImplFromJson(json);

  final List<CatalogModel> _categories;
  @override
  List<CatalogModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CatalogData(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogDataImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of CatalogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogDataImplCopyWith<_$CatalogDataImpl> get copyWith =>
      __$$CatalogDataImplCopyWithImpl<_$CatalogDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogDataImplToJson(this);
  }
}

abstract class _CatalogData implements CatalogData {
  const factory _CatalogData({required final List<CatalogModel> categories}) =
      _$CatalogDataImpl;

  factory _CatalogData.fromJson(Map<String, dynamic> json) =
      _$CatalogDataImpl.fromJson;

  @override
  List<CatalogModel> get categories;

  /// Create a copy of CatalogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogDataImplCopyWith<_$CatalogDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
