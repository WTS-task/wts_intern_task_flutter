import 'package:wts_task/core/model/base_model.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/features/cart/data/fake_cart_items.dart';

class CartViewModel extends BaseModel {
  bool _isLoading = false;
  List<CartProductModel> _products = [];
  double _totalPrice = 0;

  bool get isLoading => _isLoading;
  List<CartProductModel> get products => _products;
  double get totalPrice => _totalPrice;

  final CartRepository _cartRepository = CartRepository();

  bool get hasSelectedProducts {
    return _products.any((product) => product.isSelected);
  }

  List<CartProductModel> getSelectedProducts() {
    return _products.where((product) => product.isSelected).toList();
  }

  Future<void> getCartProducts() async {
    _isLoading = true;
    notifyModelListeners();

    try {
      _products = await _cartRepository.getAllCartProducts();
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }

    _isLoading = false;
    notifyModelListeners();
  }

  Future<void> onIncrementButtonPressed(int index) async {
    try {
      final oldProduct = _products[index];
      final newProduct = oldProduct.copyWith(count: oldProduct.count + 1);
      final newProducts = List<CartProductModel>.from(_products)
        ..[index] = newProduct;
      _totalPrice = calculateTotalPrice(products: newProducts);
      _products = newProducts;
      notifyModelListeners();

      await _cartRepository.saveAllCartProducts(newProducts);
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> onDecrementButtonPressed(int index) async {
    try {
      final oldCount = _products[index].count;
      final oldProduct = _products[index];
      if (oldCount > 1) {
        final newProduct = oldProduct.copyWith(count: oldProduct.count - 1);
        final newProducts = List<CartProductModel>.from(_products)
          ..[index] = newProduct;
        _totalPrice = calculateTotalPrice(products: newProducts);
        _products = newProducts;
        notifyModelListeners();

        await _cartRepository.saveAllCartProducts(newProducts);
      }
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> onCheckboxPressed(int index) async {
    try {
      final oldProduct = _products[index];
      final newProduct = oldProduct.copyWith(
        isSelected: !oldProduct.isSelected,
      );
      final newProducts = List<CartProductModel>.from(_products)
        ..[index] = newProduct;
      _products = newProducts;
      notifyModelListeners();

      await _cartRepository.saveAllCartProducts(newProducts);
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> removeProductAt(int index) async {
    try {
      final newList = List<CartProductModel>.from(_products)..removeAt(index);
      final total = calculateTotalPrice(products: newList);

      _products = newList;
      _totalPrice = total;

      notifyModelListeners();

      await _cartRepository.saveAllCartProducts(newList);
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> removeAllProducts() async {
    try {
      await _cartRepository.clearCart();
      _products = [];
      _totalPrice = 0;
      notifyModelListeners();
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  double calculateTotalPrice({List<CartProductModel>? products}) {
    final prods = products ?? _products;
    double total = 0.0;
    for (final item in prods) {
      if (item.isSelected) total += (item.product?.price ?? 0.0) * item.count;
    }
    return total;
  }

  List<CartProductModel>? prepareOrder() {
    if (!hasSelectedProducts) {
      return null;
    }
    return getSelectedProducts();
  }

  // Очищает корзину и добавляет туда тестовые товары из подготовленного массива
  Future<void> addFakeCartItems() async {
    await _cartRepository.clearCart();
    await _cartRepository.saveAllCartProducts(fakeCartItems);
    notifyModelListeners();
  }
}
