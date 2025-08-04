import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductReviewsViewModel extends BaseModel {
  ProductReviewsViewModel({
    required this.repository,
    required this.productId,
    this.skipReviews = 0,
  });

  final ProductRepository repository;
  final int productId;
  final int skipReviews;

  List<Review> _reviews = [];
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool _isLoading = false;
  String? _error;

  List<Review> get reviews => _reviews;

  bool get isLoading => _isLoading;

  bool get isLoadingMore => _isLoadingMore;

  bool get hasMore => _hasMore;

  String? get error => _error;

  Future<void> loadReviews() async {
    try {
      _isLoading = true;
      _error = null;
      notifyModelListeners();

      final response = await repository.getProductReviews(
        productId: productId,
        limit: 10,
        offset: skipReviews,
      );

      if (response.isError) {
        if (response.error?.contains('не найдены') ?? false) {
          _reviews = [];
          _hasMore = false;
          return;
        }
        throw Exception(response.error ?? 'Ошибка загрузки отзывов');
      }

      _reviews = response.result ?? [];
      _hasMore = _reviews.length >= 10;
      _currentPage = 1;
    } catch (e) {
      _error = 'Не удалось загрузить отзывы: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyModelListeners();
    }
  }

  Future<void> loadMoreReviews() async {
    if (!_hasMore || _isLoadingMore) return;

    try {
      _isLoadingMore = true;
      notifyModelListeners();

      final response = await repository.getProductReviews(
        productId: productId,
        limit: 10,
        offset: skipReviews + (_currentPage * 10),
      );

      if (!response.isError) {
        _reviews.addAll(response.result ?? []);
        _hasMore = response.result?.length == 10;
        _currentPage++;
      }
    } finally {
      _isLoadingMore = false;
      notifyModelListeners();
    }
  }

  void refreshReviews() {
    _reviews.clear();
    _currentPage = 0;
    _hasMore = true;
    loadReviews();
  }

  @override
  void dispose() {
    _reviews.clear();
    super.dispose();
  }
}
