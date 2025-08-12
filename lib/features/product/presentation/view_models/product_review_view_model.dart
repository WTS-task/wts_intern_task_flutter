import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductReviewsViewModel extends ListModel<Review> {
  ProductReviewsViewModel({required this.repository, required this.productId});

  final ProductRepository repository;
  final String productId;

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    final response = await repository.getProductReviews(
      productId: productId,
      offset: offset,
    );

    if (response.isError) {
      onLoadingError(response.error!);
      return;
    }

    await onNextItemsLoaded(response.result ?? [], loadingUuid);
  }

  @override
  bool checkAllLoaded(List<Review> nextItems) {
    return nextItems.isEmpty || nextItems.length < 10;
  }
}
