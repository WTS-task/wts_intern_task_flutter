import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductDetailViewModel extends BaseModel {
  ProductDetailViewModel(this._repository, this.productId);

  final ProductRepository _repository;
  final String productId;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Product? product;
  List<Review> reviews = [];

  Future<void> loadProduct() async {
    try {
      _isLoading = true;
      notifyModelListeners();

      product = await _repository.getProductById(productId);
      reviews = await _repository.getProductReviews(productId, limit: 3);

      clearError();
      _isLoading = false;
      notifyModelListeners();
    } catch (e) {
      addError('Ошибка загрузки товара');
      notifyModelListeners();
    }
  }

  Future<void> addToCart() async {
    if (product == null) return;
    try {
      _isLoading = true;
      notifyModelListeners();

      await _repository.addToCart(product!);
      clearError();
      _isLoading = false;
      notifyModelListeners();
    } catch (e) {
      _isLoading = false;
      addError('Ошибка добавления в корзину');
      notifyModelListeners();
    }
  }
}
