import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/features/cart/data/fake_cart_items.dart';

class CartViewModel extends ListModel<CartProductModel> {
  CartViewModel() : super(items: []);

  final CartRepository _cartRepository = CartRepository();

  bool get hasSelectedProducts {
    return items.any((product) => product.isSelected);
  }

  List<CartProductModel> getSelectedProducts() {
    return items.where((product) => product.isSelected).toList();
  }

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    try {
      final allProducts = await _cartRepository.getAllCartProducts();
      replaceItems(allProducts);
      isAllLoaded = true;
      isLoading = false;
      notifyModelListeners();
    } catch (e) {
      onLoadingError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> onChangeCountPressed(int index, int delta) async {
    try {
      final oldProduct = items[index];
      final newProduct = oldProduct.copyWith(count: oldProduct.count + delta);
      replaceItemAtIndex(newProduct, index);
      await _cartRepository.saveAllCartProducts(items);
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> onCheckboxPressed(int index) async {
    try {
      final oldProduct = items[index];
      final newProduct = oldProduct.copyWith(
        isSelected: !oldProduct.isSelected,
      );
      replaceItemAtIndex(newProduct, index);
      await _cartRepository.saveAllCartProducts(items);
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> removeProductAt(int index) async {
    try {
      final item = items[index];
      final isDeleted = await deleteItem(item);
      if (isDeleted) {
        await _cartRepository.saveAllCartProducts(items);
      }
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  Future<void> removeAllProducts() async {
    try {
      replaceItems([]);
      await _cartRepository.clearCart();
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  double get totalPrice {
    double total = 0.0;
    for (final item in items) {
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
    replaceItems(fakeCartItems);
    await _cartRepository.clearCart();
    await _cartRepository.saveAllCartProducts(fakeCartItems);
  }
}
