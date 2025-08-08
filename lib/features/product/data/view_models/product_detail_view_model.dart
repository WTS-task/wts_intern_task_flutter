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
    this._productId,
    this._cartRepository,
    this._cartViewModel,
  );

  final ProductRepository _repository;
  final CartRepository _cartRepository;
  final CartViewModel _cartViewModel;
  final String _productId;

  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  @override
  Future<void> loadItemData() async {
    final productResponse = await _repository.getProductDetails(
      int.parse(_productId),
    );

    if (productResponse.isError || productResponse.result == null) {
      return onLoadingError(productResponse.error ?? 'Ошибка загрузки товара');
    }

    final reviewsResponse = await _repository.getProductReviews(
      productId: int.parse(_productId),
      limit: 5,
    );

    _reviews = reviewsResponse.result ?? [];
    await onItemLoaded(productResponse.result!);
  }

  Future<void> addToCart() async {
    final cartProduct = CartProductModel(
      count: 1,
      isSelected: false,
      product: item!,
    );

    await _cartRepository.addProductToCart(cartProduct);
    await _cartViewModel.loadNextItems(null);
    _cartViewModel.notifyModelListeners();
    notifyModelListeners();
  }
}
