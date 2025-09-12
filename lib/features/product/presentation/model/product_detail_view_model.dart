import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductDetailViewModel extends ItemModel<Product> {
  ProductDetailViewModel(
    this._repository,
    this._productId,
    this._cartViewModel,
  );

  final ProductRepository _repository;

  final CartViewModel _cartViewModel;
  final String _productId;

  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  @override
  Future<void> loadItemData() async {
    final productResponse = await _repository.getProductDetails(_productId);

    if (productResponse.isError || productResponse.result == null) {
      return onLoadingError(productResponse.error ?? 'Ошибка загрузки товара');
    }

    final reviewsResponse = await _repository.getProductReviews(
      productId: _productId,
      limit: 5,
    );

    _reviews = reviewsResponse.result ?? [];
    await onItemLoaded(productResponse.result!);
  }

  Future<void> addToCart() async {
    _cartViewModel.addProduct(product: item!);
  }
}
