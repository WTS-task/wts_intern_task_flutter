import '../fake_orders.dart';
import '../models/order_detail.dart';

class OrderHistoryRepository {
  Future<List<OrderDetail>> fetchOrderHistory() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // вместо fakeOrders получить из api_client'а список заказов
    return fakeOrders;
  }
}
