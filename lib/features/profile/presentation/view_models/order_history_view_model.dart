import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/repositories/order_history_repository.dart';

class OrderHistoryViewModel extends ListModel<OrderDetail> {
  OrderHistoryViewModel() : super(items: []);

  final OrderHistoryRepository _repository = OrderHistoryRepository();

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    try {
      final allOrders = await _repository.fetchOrderHistory();
      await onNextItemsLoaded(allOrders, loadingUuid);
    } catch (e) {
      onLoadingError(e is AppException ? e.errorMessage : e.toString());
    }
  }
}