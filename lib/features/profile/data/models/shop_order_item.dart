import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_order_item.freezed.dart';
part 'shop_order_item.g.dart';

@freezed
abstract class ShopOrderItem with _$ShopOrderItem {
  const factory ShopOrderItem({
    int? productId,
    String? name,
    String? productDescription,
    String? imageUrl,
    int? price,
    int? count,
  }) = _ShopOrderItem;

  factory ShopOrderItem.fromJson(Map<String, dynamic> json) =>
      _$ShopOrderItemFromJson(json);
}
