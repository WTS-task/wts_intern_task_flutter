import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductDetailViewModel extends BaseModel {
  ProductDetailViewModel(
    this._repository,
    this.productId,
    this._cartRepository,
    this._cartViewModel,
  );

  final ProductRepository _repository;
  final CartRepository _cartRepository;
  final CartViewModel _cartViewModel;
  final int productId;

  Product? _product;
  List<Review> _reviews = [];
  bool _isLoading = false;
  String? _error;

  Product? get product => _product;

  List<Review> get reviews => _reviews;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> loadProduct() async {
    try {
      _isLoading = true;
      _error = null;
      notifyModelListeners();

      final productResponse = await _repository.getProductDetails(productId);
      if (productResponse.isError || productResponse.result == null) {
        throw Exception(productResponse.error ?? 'Ошибка загрузки товара');
      }
      _product = productResponse.result;

      try {
        final reviewsResponse = await _repository.getProductReviews(
          productId: productId,
          limit: 3,
        );
        _reviews = reviewsResponse.result ?? [];
      } catch (e) {
        _reviews = [];
      }
    } catch (e) {
      debugPrint('Error loading product: $e');
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyModelListeners();
    }
  }

  Future<void> addToCart() async {
    if (product == null) {
      _error = 'Товар не загружен';
      notifyListeners();
      return;
    }

    try {
      final cartProduct = CartProductModel(
        count: 1,
        isSelected: true,
        product: product!,
      );

      await _cartRepository.addProductToCart(cartProduct);

      await _repository.addToCart(product!);

      await _cartViewModel.loadNextItems(null);

      notifyListeners();
    } catch (e) {
      _error = 'Ошибка при добавлении в корзину: $e';
      notifyListeners();
    }
  }
}
