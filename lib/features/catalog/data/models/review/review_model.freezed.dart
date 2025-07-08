// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String? get authorAvatarUrl => throw _privateConstructorUsedError;
  String get targetId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call({
    String id,
    String authorId,
    String authorName,
    String? authorAvatarUrl,
    String targetId,
    String text,
    int rating,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatarUrl = freezed,
    Object? targetId = null,
    Object? text = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            authorAvatarUrl: freezed == authorAvatarUrl
                ? _value.authorAvatarUrl
                : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            targetId: null == targetId
                ? _value.targetId
                : targetId // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
    _$ReviewImpl value,
    $Res Function(_$ReviewImpl) then,
  ) = __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authorId,
    String authorName,
    String? authorAvatarUrl,
    String targetId,
    String text,
    int rating,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
    _$ReviewImpl _value,
    $Res Function(_$ReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatarUrl = freezed,
    Object? targetId = null,
    Object? text = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ReviewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        authorAvatarUrl: freezed == authorAvatarUrl
            ? _value.authorAvatarUrl
            : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetId: null == targetId
            ? _value.targetId
            : targetId // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl({
    required this.id,
    required this.authorId,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.targetId,
    required this.text,
    required this.rating,
    required this.createdAt,
    this.updatedAt,
  });

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String id;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final String? authorAvatarUrl;
  @override
  final String targetId;
  @override
  final String text;
  @override
  final int rating;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Review(id: $id, authorId: $authorId, authorName: $authorName, authorAvatarUrl: $authorAvatarUrl, targetId: $targetId, text: $text, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorAvatarUrl, authorAvatarUrl) ||
                other.authorAvatarUrl == authorAvatarUrl) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    authorId,
    authorName,
    authorAvatarUrl,
    targetId,
    text,
    rating,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(this);
  }
}

abstract class _Review implements Review {
  const factory _Review({
    required final String id,
    required final String authorId,
    required final String authorName,
    required final String? authorAvatarUrl,
    required final String targetId,
    required final String text,
    required final int rating,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  String? get authorAvatarUrl;
  @override
  String get targetId;
  @override
  String get text;
  @override
  int get rating;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateReviewRequest _$CreateReviewRequestFromJson(Map<String, dynamic> json) {
  return _CreateReviewRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateReviewRequest {
  String get targetId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  /// Serializes this CreateReviewRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReviewRequestCopyWith<CreateReviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewRequestCopyWith<$Res> {
  factory $CreateReviewRequestCopyWith(
    CreateReviewRequest value,
    $Res Function(CreateReviewRequest) then,
  ) = _$CreateReviewRequestCopyWithImpl<$Res, CreateReviewRequest>;
  @useResult
  $Res call({String targetId, String text, int rating});
}

/// @nodoc
class _$CreateReviewRequestCopyWithImpl<$Res, $Val extends CreateReviewRequest>
    implements $CreateReviewRequestCopyWith<$Res> {
  _$CreateReviewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetId = null,
    Object? text = null,
    Object? rating = null,
  }) {
    return _then(
      _value.copyWith(
            targetId: null == targetId
                ? _value.targetId
                : targetId // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateReviewRequestImplCopyWith<$Res>
    implements $CreateReviewRequestCopyWith<$Res> {
  factory _$$CreateReviewRequestImplCopyWith(
    _$CreateReviewRequestImpl value,
    $Res Function(_$CreateReviewRequestImpl) then,
  ) = __$$CreateReviewRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String targetId, String text, int rating});
}

/// @nodoc
class __$$CreateReviewRequestImplCopyWithImpl<$Res>
    extends _$CreateReviewRequestCopyWithImpl<$Res, _$CreateReviewRequestImpl>
    implements _$$CreateReviewRequestImplCopyWith<$Res> {
  __$$CreateReviewRequestImplCopyWithImpl(
    _$CreateReviewRequestImpl _value,
    $Res Function(_$CreateReviewRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetId = null,
    Object? text = null,
    Object? rating = null,
  }) {
    return _then(
      _$CreateReviewRequestImpl(
        targetId: null == targetId
            ? _value.targetId
            : targetId // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReviewRequestImpl implements _CreateReviewRequest {
  const _$CreateReviewRequestImpl({
    required this.targetId,
    required this.text,
    required this.rating,
  });

  factory _$CreateReviewRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReviewRequestImplFromJson(json);

  @override
  final String targetId;
  @override
  final String text;
  @override
  final int rating;

  @override
  String toString() {
    return 'CreateReviewRequest(targetId: $targetId, text: $text, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReviewRequestImpl &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, targetId, text, rating);

  /// Create a copy of CreateReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReviewRequestImplCopyWith<_$CreateReviewRequestImpl> get copyWith =>
      __$$CreateReviewRequestImplCopyWithImpl<_$CreateReviewRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReviewRequestImplToJson(this);
  }
}

abstract class _CreateReviewRequest implements CreateReviewRequest {
  const factory _CreateReviewRequest({
    required final String targetId,
    required final String text,
    required final int rating,
  }) = _$CreateReviewRequestImpl;

  factory _CreateReviewRequest.fromJson(Map<String, dynamic> json) =
      _$CreateReviewRequestImpl.fromJson;

  @override
  String get targetId;
  @override
  String get text;
  @override
  int get rating;

  /// Create a copy of CreateReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReviewRequestImplCopyWith<_$CreateReviewRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
