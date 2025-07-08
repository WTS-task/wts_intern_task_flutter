import 'package:wts_task/features/catalog/data/models/review/review_model.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/data/view_models/base_view_model.dart';

class ProductReviewsViewModel extends BaseViewModel {
  final ProductRepository repository;
  final String productId;
  final int skipReviews;
  List<Review> reviews = [];
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  ProductReviewsViewModel(
    this.repository,
    this.productId, {
    this.skipReviews = 0,
  });

  bool get isLoadingMore => _isLoadingMore;

  bool get hasMore => _hasMore;

  Future<void> loadReviews() async {
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
      setError('Ошибка загрузки отзывов');
    } finally {
      setLoading(false);
    }
  }

  Future<void> loadMoreReviews() async {
    if (!_hasMore || _isLoadingMore) return;

    _isLoadingMore = true;
    notifyListeners();

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
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}
