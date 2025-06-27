import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/features/profile/data/models/shop_order.dart';

part 'order_detail.freezed.dart';
part 'order_detail.g.dart';

@freezed
abstract class OrderDetail with _$OrderDetail {
  const factory OrderDetail({ShopOrder? shopOrder}) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}
