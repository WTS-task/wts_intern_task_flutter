import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/profile/data/models/order_detail.dart';
import 'package:wts_task/features/profile/data/repositories/order_history_repository.dart';

class OrderHistoryViewModel extends ListModel<OrderDetail> {
  OrderHistoryViewModel();

  final OrderHistoryRepository _repository = OrderHistoryRepository(
    AuthLocalDataSource(),
  );

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    try {
      final response = await _repository.fetchOrderHistory(
        offset: offset,
        limit: 10,
      );
      if (response.isError) {
        onLoadingError(response.error!);
        return;
      }
      await onNextItemsLoaded(response.result!, loadingUuid);
    } catch (e) {
      onLoadingError(e is AppException ? e.errorMessage : e.toString());
    }
  }
}
