import 'dart:convert';

import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
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

    final params = {
      'address': address,
      'phoneNumber': phoneNumber,
      if (comment != null) 'comment': comment,
      'customerName': customerName,
      'shopOrderItems': jsonEncode(
        items
            .map((e) => {"productId": e.product?.productId, "count": e.count})
            .toList(),
      ),
    };

    final response = await post('/shop/shop-order/send', data: params);
    return ApiResponseParser.parseObjectFromResponse(
      response,
      key: 'shopOrder',
      fromJson: (json) => OrderDetail.fromJson(json),
    );
  }
}
