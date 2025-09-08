import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';

part 'order_item_model.freezed.dart';

part 'order_item_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required int productId,
    required int count,
  }) = _OrderItemModel;

  const OrderItemModel._();

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  factory OrderItemModel.fromCartProduct(CartProductModel cartProduct) {
    final orderItem = OrderItemModel(productId: cartProduct.product?.productId ?? 1, count: cartProduct.count);
    return orderItem;
  }
}
