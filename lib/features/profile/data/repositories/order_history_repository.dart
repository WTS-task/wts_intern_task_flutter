import 'package:wts_task/features/profile/data/fake_orders.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';

class OrderHistoryRepository {
  Future<List<OrderDetail>> fetchOrderHistory() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // вместо fakeOrders получить из api_client'а список заказов
    return fakeOrders;
  }
}
