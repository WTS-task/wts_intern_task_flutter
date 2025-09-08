import 'dart:convert';

import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/place_order/data/models/order_item_model.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';

class PlaceOrderRepository extends PrivateApi {
  PlaceOrderRepository(super.authRepository);

  Future<ApiResponse<OrderDetail>> placeOrder({
    required String address,
    required String phoneNumber,
    required String customerName,
    required List<CartProductModel> items,
    String? comment,
  }) async {
    final orderItems = items
        .map((cartItem) => OrderItemModel.fromCartProduct(cartItem))
        .toList();
    final orderItemsJson = jsonEncode(
      orderItems.map((item) => item.toJson()).toList(),
    );

    final params = {
      'address': address,
      'phoneNumber': phoneNumber,
      if (comment != null) 'comment': comment,
      'customerName': customerName,
      'shopOrderItems': orderItemsJson,
    };

    final response = await post('/shop/shop-order/send', data: params);
    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'shopOrder',
      fromJson: (json) => OrderDetail.fromJson(json),
    );
  }
}
