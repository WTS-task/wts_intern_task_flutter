import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductReviewsViewModel extends ListModel<Review> {
  ProductReviewsViewModel({required this.repository, required this.productId});

  final ProductRepository repository;
  final String productId;

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    isLoading = true;
    notifyModelListeners();

    final productIdInt = int.tryParse(productId);
    if (productIdInt == null) {
      addError('Неверный ID продукта');
      return;
    }

    final response = await repository.getProductReviews(
      productId: productIdInt,
      limit: 10,
      offset: offset,
    );

    if (response.isError) {
      if (response.error?.contains('не найдены') ?? false) {
        await onNextItemsLoaded([], loadingUuid);
        return;
      }
      addError(response.error ?? 'Ошибка загрузки отзывов');
      return;
    }

    await onNextItemsLoaded(response.result ?? [], loadingUuid);
  }

  @override
  bool checkAllLoaded(List<Review> nextItems) {
    return nextItems.isEmpty || nextItems.length < 10;
  }
}
