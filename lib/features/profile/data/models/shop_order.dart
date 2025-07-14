import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/features/profile/data/models/shop_order_item.dart';

part 'shop_order.freezed.dart';
part 'shop_order.g.dart';

@freezed
abstract class ShopOrder with _$ShopOrder {
  const factory ShopOrder({
    int? shopOrderId,
    int? userId,
    int? status,
    String? address,
    String? phoneNumber,
    String? comment,
    List<ShopOrderItem>? shopOrderItems,
    int? totalPrice,
    int? createdAt,
    int? updatedAt,
  }) = _ShopOrder;

  factory ShopOrder.fromJson(Map<String, dynamic> json) => _$ShopOrderFromJson(json);
}
