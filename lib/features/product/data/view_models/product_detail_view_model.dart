import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';
import 'package:wts_task/features/product/data/repositories/product_repositories.dart';

class ProductDetailViewModel extends ItemModel<Product> {
  ProductDetailViewModel(
    this._repository,
    this.productId,
    this._cartRepository,
    this._cartViewModel,
  ) : super();

  final ProductRepository _repository;
  final CartRepository _cartRepository;
  final CartViewModel _cartViewModel;
  final int productId;

  List<Review> _reviews = [];
  String? _error;

  List<Review> get reviews => _reviews;

  String? get error => _error;

  @override
  Future<void> loadItemData() async {
    try {
      _error = null;
      isLoading = true;
      notifyModelListeners();

      final productResponse = await _repository.getProductDetails(productId);
      if (productResponse.isError || productResponse.result == null) {
        throw Exception(productResponse.error ?? 'Ошибка загрузки товара');
      }
      await onItemLoaded(productResponse.result!);

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
      _error = e.toString();
      onLoadingError(_error!);
    } finally {
      isLoading = false;
      notifyModelListeners();
    }
  }

  Future<void> addToCart() async {
    if (item == null) {
      _error = 'Товар не загружен';
      notifyModelListeners();
      return;
    }

    try {
      final cartProduct = CartProductModel(
        count: 1,
        isSelected: false,
        product: item,
      );

      await _cartRepository.addProductToCart(cartProduct);
      await _cartViewModel.loadNextItems(null);

      notifyModelListeners();
    } catch (e) {
      _error = 'Ошибка при добавлении в корзину: $e';
      notifyModelListeners();
    }
  }
}
