import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';

part 'cart_view_model_state.freezed.dart';

enum LoadState { empty, loading, error, loaded }

@freezed
abstract class CartViewModelState with _$CartViewModelState {
  const factory CartViewModelState({
    required LoadState loadState,
    required double totalPrice,
    required List<CartProductModel> products,
    String? errorMessage,
  }) = _CartViewModelState;
}