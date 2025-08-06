import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductReviewsViewModel extends ListModel<Review> {
  ProductReviewsViewModel({
    required this.repository,
    required this.productId,
    this.skipReviews = 0,
  });

  final ProductRepository repository;
  final int productId;
  final int skipReviews;
  int _currentPage = 0;

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    try {
      isLoading = true;
      notifyModelListeners();

      final response = await repository.getProductReviews(
        productId: productId,
        limit: 10,
        offset: skipReviews + (_currentPage * 10),
      );

      if (response.isError) {
        if (response.error?.contains('не найдены') ?? false) {
          await onNextItemsLoaded([], loadingUuid);
          return;
        }
        throw Exception(response.error ?? 'Ошибка загрузки отзывов');
      }

      await onNextItemsLoaded(response.result ?? [], loadingUuid);
      _currentPage++;
    } catch (e) {
      onLoadingError('Не удалось загрузить отзывы: ${e.toString()}');
    }
  }

  @override
  bool checkAllLoaded(List<Review> nextItems) {
    return nextItems.isEmpty || nextItems.length < 10;
  }

  void refreshReviews() {
    _currentPage = 0;
    reset();
    loadData();
  }
}
