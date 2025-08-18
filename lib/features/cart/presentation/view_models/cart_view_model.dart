import 'dart:math';

import 'package:collection/collection.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';

class CartViewModel extends ListModel<CartProductModel> {
  CartViewModel();

  final CartRepository _cartRepository = CartRepository();

  @override
  bool get isAllLoaded => true;

  List<CartProductModel> _items = [];

  @override
  List<CartProductModel> get items => _items;

  bool get hasSelectedProducts {
    return items.any((product) => product.isSelected);
  }

  List<CartProductModel> getSelectedProducts() {
    return items.where((product) => product.isSelected).toList();
  }

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    notifyModelListeners();
  }

  @override
  Future<void> reloadData({bool soft = false}) async {
    _items = await _cartRepository.getAllCartProducts();
    notifyModelListeners();
  }

  @override
  Future<void> loadData() async {
    _items = await _cartRepository.getAllCartProducts();
    isLoading = false;
    notifyModelListeners();
  }

  Future<void> onCheckboxPressed(int index) async {
    final oldProduct = items[index];
    final newProduct = oldProduct.copyWith(isSelected: !oldProduct.isSelected);
    _items[index] = newProduct;
    await save();
  }

  Future<bool> removeProduct({
    required Product product,
    bool all = false,
  }) async {
    final item = getItemForProduct(product: product);
    if (item == null) {
      return true;
    }
    final newCount = all ? 0 : max(item.count - 1, 0);
    return await setProductCount(product: product, count: newCount);
  }

  Future<bool> setProductCount({
    required Product product,
    required int count,
    bool showMessage = false,
  }) async {
    final item = getItemForProduct(product: product);
    if (count == 0) {
      if (item == null) {
        return true;
      }

      _items.remove(item);
      await save();
      return true;
    }

    if (item == null) {
      final shoppingCartItem = CartProductModel.fromProduct(
        product,
        count: count,
      );
      _items.add(shoppingCartItem);
    } else {
      final newItem = item.copyWith(count: count);
      final index = _items.indexWhere(
        (e) => e.product?.productId == product.productId,
      );
      _items[index] = newItem;
    }
    await save();
    if (showMessage) {
      addMessage('Товар добавлен в корзину ${product.name}');
    }
    return true;
  }

  CartProductModel? getItemForProduct({
    required Product product,
    bool autoCreate = false,
  }) {
    var shoppingCartItem = _items.firstWhereOrNull(
      (item) => item.product?.productId == product.productId,
    );
    if ((shoppingCartItem == null) && autoCreate) {
      shoppingCartItem = CartProductModel.fromProduct(product);
      items.add(shoppingCartItem);
    }
    return shoppingCartItem;
  }

  Future<void> removeAllProducts() async {
    try {
      _items.clear();
      await _cartRepository.clearCart();
    } catch (e) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  double get totalPrice {
    double total = 0.0;
    for (final item in _items) {
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

  Future<bool> addProduct({
    required Product product,
    bool showMessage = false,
  }) async {
    final item = getItemForProduct(product: product, autoCreate: true);
    final newCount = (item?.count ?? 0) + 1;
    return await setProductCount(
      product: product,
      count: newCount,
      showMessage: showMessage,
    );
  }

  Future<void> save() async {
    try {
      await _cartRepository.saveAllCartProducts(items);
      notifyModelListeners();
    } catch (e, s) {
      addError(e is AppException ? e.errorMessage : e.toString());
    }
  }

  @override
  bool checkAllLoaded(List<CartProductModel> nextItems) => true;
}
