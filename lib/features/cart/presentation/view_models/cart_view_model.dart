import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/features/cart/data/fake_cart_items.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model_state.dart';

class CartViewModel extends ChangeNotifier {
  var _state = CartViewModelState(
    totalPrice: 0,
    loadState: LoadState.loading,
    products: [],
  );
  CartViewModelState get state => _state;

  CartRepository cartRepository = CartRepository();

  bool get hasSelectedProducts {
    return _state.products.any((product) => product.isSelected);
  }

  List<CartProductModel> getSelectedProducts() {
    return _state.products.where((product) => product.isSelected).toList();
  }

  Future<void> getCartProducts() async {
    _state = _state.copyWith(loadState: LoadState.loading);
    notifyListeners();

    try {
      final cartProducts = await cartRepository.getAllCartProducts();
      if (cartProducts.isEmpty) {
        _state = _state.copyWith(loadState: LoadState.empty);
      } else {
        _state = _state.copyWith(
          products: cartProducts,
          loadState: LoadState.loaded,
        );
      }
    } catch (e) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: e is AppException ? e.errorMessage : e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> onIncrementButtonPressed(int index) async {
    try {
      final oldProduct = _state.products[index];
      final newProduct = oldProduct.copyWith(count: oldProduct.count + 1);
      final newProducts = List<CartProductModel>.from(_state.products)
        ..[index] = newProduct;
      final newTotalPrice = calculateTotalPrice(products: newProducts);
      _state = _state.copyWith(
        products: newProducts,
        totalPrice: newTotalPrice,
      );
      notifyListeners();

      await cartRepository.saveAllCartProducts(newProducts);
    } catch (e) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: e is AppException ? e.errorMessage : e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> onDecrementButtonPressed(int index) async {
    try {
      final oldCount = _state.products[index].count;
      final oldProduct = _state.products[index];
      if (oldCount > 1) {
        final newProduct = oldProduct.copyWith(count: oldProduct.count - 1);
        final newProducts = List<CartProductModel>.from(_state.products)
          ..[index] = newProduct;
        final newTotalPrice = calculateTotalPrice(products: newProducts);
        _state = _state.copyWith(
          products: newProducts,
          totalPrice: newTotalPrice,
        );
        notifyListeners();

        await cartRepository.saveAllCartProducts(newProducts);
      }
    } catch (e) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: e is AppException ? e.errorMessage : e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> onCheckboxPressed(int index) async {
    try {
      final oldProduct = _state.products[index];
      final newProduct = oldProduct.copyWith(
        isSelected: !oldProduct.isSelected,
      );
      final newProducts = List<CartProductModel>.from(_state.products)
        ..[index] = newProduct;
      _state = _state.copyWith(products: newProducts);
      notifyListeners();

      await cartRepository.saveAllCartProducts(newProducts);
    } catch (e) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: e is AppException ? e.errorMessage : e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> removeProductAt(int index) async {
    try {
      final newList = List<CartProductModel>.from(_state.products)
        ..removeAt(index);
      final total = calculateTotalPrice(products: newList);
      final newState = newList.isEmpty ? LoadState.empty : LoadState.loaded;

      _state = _state.copyWith(
        products: newList,
        totalPrice: total,
        loadState: newState,
      );
      notifyListeners();

      await cartRepository.saveAllCartProducts(newList);
    } catch (e) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: e is AppException ? e.errorMessage : e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> removeAllProducts() async {
    try {
      await cartRepository.clearCart();
      _state = _state.copyWith(
        loadState: LoadState.empty,
        products: [],
        totalPrice: 0,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        loadState: LoadState.error,
        errorMessage: e is AppException ? e.errorMessage : e.toString(),
      );
      notifyListeners();
    }
  }

  double calculateTotalPrice({List<CartProductModel>? products}) {
    final prods = products ?? _state.products;
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
    await cartRepository.clearCart();
    await cartRepository.saveAllCartProducts(fakeCartItems);
    notifyListeners();
  }
}
