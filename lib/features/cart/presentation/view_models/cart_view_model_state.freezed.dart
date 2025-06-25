// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartViewModelState {
  LoadState get loadState;
  double get totalPrice;
  List<CartProductModel> get products;
  String? get errorMessage;

  /// Create a copy of CartViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartViewModelStateCopyWith<CartViewModelState> get copyWith =>
      _$CartViewModelStateCopyWithImpl<CartViewModelState>(
          this as CartViewModelState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartViewModelState &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadState, totalPrice,
      const DeepCollectionEquality().hash(products), errorMessage);

  @override
  String toString() {
    return 'CartViewModelState(loadState: $loadState, totalPrice: $totalPrice, products: $products, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CartViewModelStateCopyWith<$Res> {
  factory $CartViewModelStateCopyWith(
          CartViewModelState value, $Res Function(CartViewModelState) _then) =
      _$CartViewModelStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadState loadState,
      double totalPrice,
      List<CartProductModel> products,
      String? errorMessage});
}

/// @nodoc
class _$CartViewModelStateCopyWithImpl<$Res>
    implements $CartViewModelStateCopyWith<$Res> {
  _$CartViewModelStateCopyWithImpl(this._self, this._then);

  final CartViewModelState _self;
  final $Res Function(CartViewModelState) _then;

  /// Create a copy of CartViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadState = null,
    Object? totalPrice = null,
    Object? products = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      loadState: null == loadState
          ? _self.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartProductModel>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _CartViewModelState implements CartViewModelState {
  const _CartViewModelState(
      {required this.loadState,
      required this.totalPrice,
      required final List<CartProductModel> products,
      this.errorMessage})
      : _products = products;

  @override
  final LoadState loadState;
  @override
  final double totalPrice;
  final List<CartProductModel> _products;
  @override
  List<CartProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String? errorMessage;

  /// Create a copy of CartViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartViewModelStateCopyWith<_CartViewModelState> get copyWith =>
      __$CartViewModelStateCopyWithImpl<_CartViewModelState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartViewModelState &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadState, totalPrice,
      const DeepCollectionEquality().hash(_products), errorMessage);

  @override
  String toString() {
    return 'CartViewModelState(loadState: $loadState, totalPrice: $totalPrice, products: $products, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CartViewModelStateCopyWith<$Res>
    implements $CartViewModelStateCopyWith<$Res> {
  factory _$CartViewModelStateCopyWith(
          _CartViewModelState value, $Res Function(_CartViewModelState) _then) =
      __$CartViewModelStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadState loadState,
      double totalPrice,
      List<CartProductModel> products,
      String? errorMessage});
}

/// @nodoc
class __$CartViewModelStateCopyWithImpl<$Res>
    implements _$CartViewModelStateCopyWith<$Res> {
  __$CartViewModelStateCopyWithImpl(this._self, this._then);

  final _CartViewModelState _self;
  final $Res Function(_CartViewModelState) _then;

  /// Create a copy of CartViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadState = null,
    Object? totalPrice = null,
    Object? products = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_CartViewModelState(
      loadState: null == loadState
          ? _self.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartProductModel>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
