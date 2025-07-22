import 'package:flutter/cupertino.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/repositories/order_history_repository.dart';

class OrderHistoryViewModel extends ChangeNotifier {
  final OrderHistoryRepository _repository = OrderHistoryRepository();

  // можно вынести переменные в отдельный OrderHistoryViewModelState
  List<OrderDetail> _orders = [];
  bool _isLoading = false;
  String? _error;

  List<OrderDetail> get orders => _orders;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> loadOrders() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _orders = await _repository.fetchOrderHistory();
    } catch (e) {
      _error = 'Не удалось загрузить заказы';
    }

    _isLoading = false;
    notifyListeners();
  }
}
