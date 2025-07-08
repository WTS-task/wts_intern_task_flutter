import 'package:wts_task/features/catalog/data/models/product/product_model.dart';
import 'package:wts_task/features/catalog/data/models/review/review_model.dart';
import 'package:wts_task/features/catalog/data/repositories/product_repository.dart';
import 'package:wts_task/features/catalog/data/view_models/base_view_model.dart';

class ProductDetailViewModel extends BaseViewModel {
  final ProductRepository repository;
  final String productId;

  Product? product;
  List<Review> reviews = [];

  ProductDetailViewModel(this.repository, this.productId);

  Future<void> loadProduct() async {
    try {
      setLoading(true);
      product = await repository.getProductById(productId);
      reviews = await repository.getProductReviews(productId, limit: 3);
      setError(null);
    } catch (e) {
      setError('Ошибка загрузки товара');
    } finally {
      setLoading(false);
    }
  }

  Future<void> addToCart() async {
    if (product == null) return;
    try {
      setLoading(true);
      await repository.addToCart(product!);
      setError(null);
    } catch (e) {
      setError('Ошибка добавления в корзину');
    } finally {
      setLoading(false);
    }
  }
}
