import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/models/shop_order.dart';

class OrderHistoryRepository extends PrivateApi {
  OrderHistoryRepository(super.authRepository);

  Future<ApiResponse<List<OrderDetail>>> fetchOrderHistory({
    required int offset,
    required int limit,
  }) async {
    final params = { 'offset': offset, 'limit': limit };
    final response = await get('/shop/shop-order/list', queryParameters: params);

    return ApiResponseParser.parseListFromResponse(
      response,
      key: 'shopOrders',
      fromJson: (json) => OrderDetail(shopOrder: ShopOrder.fromJson(json)),
      emptyError: 'Заказы не найдены',
    );
  }
}
