import 'package:wts_task/core/model/base_model.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/repositories/order_history_repository.dart';

class OrderHistoryViewModel extends BaseModel {
  final OrderHistoryRepository _repository = OrderHistoryRepository();

  List<OrderDetail> _orders = [];
  bool _isLoading = false;

  List<OrderDetail> get orders => _orders;
  bool get isLoading => _isLoading;

  Future<void> loadOrders() async {
    _isLoading = true;
    notifyModelListeners();

    try {
      _orders = await _repository.fetchOrderHistory();
    } catch (e) {
      addError('Не удалось загрузить заказы');
    }

    _isLoading = false;
    notifyModelListeners();
  }
}