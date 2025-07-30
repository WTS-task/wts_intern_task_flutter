import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductReviewsViewModel extends BaseModel {
  final ProductRepository repository;
  final String productId;
  final int skipReviews;
  List<Review> reviews = [];
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? get error => lastError;

  ProductReviewsViewModel(
    this.repository,
    this.productId, {
    this.skipReviews = 0,
  });

  bool get isLoadingMore => _isLoadingMore;

  bool get hasMore => _hasMore;

  Future<void> loadReviews() async {
    if (isDisposed) return;

    try {
      _isLoading = true;
      notifyModelListeners();

      final newReviews = await repository.getProductReviews(
        productId,
        limit: 10,
        offset: skipReviews + (_currentPage * 10),
      );

      reviews.addAll(newReviews);
      _hasMore = newReviews.length == 10;
      _currentPage++;

      clearError();
    } catch (e) {
      addError('Ошибка загрузки отзывов');
    } finally {
      _isLoading = false;
      notifyModelListeners();
    }
  }

  Future<void> loadMoreReviews() async {
    if (!_hasMore || _isLoadingMore) return;

    _isLoadingMore = true;
    notifyModelListeners();

    try {
      final newReviews = await repository.getProductReviews(
        productId,
        limit: 10,
        offset: skipReviews + (_currentPage * 10),
      );

      reviews.addAll(newReviews);
      _hasMore = newReviews.length == 10;
      _currentPage++;
    } catch (e) {
      addError('Ошибка загрузки дополнительных отзывов');
    } finally {
      _isLoadingMore = false;
      notifyModelListeners();
    }
  }

  @override
  void dispose() {
    reviews.clear();
    super.dispose();
  }
}
