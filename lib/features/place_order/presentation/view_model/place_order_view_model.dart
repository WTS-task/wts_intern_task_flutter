import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/models/list_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/data/repositories/cart_repository.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';
import 'package:wts_task/features/place_order/data/repositories/place_order_repository.dart';

class PlaceOrderViewModel extends ListModel<CartProductModel> {
  PlaceOrderViewModel(this.cartViewModel);

  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final CartRepository _cartRepository = CartRepository();
  final PlaceOrderRepository _placeOrderRepository = PlaceOrderRepository(
    AuthLocalDataSource(),
  );
  final CatalogRepository _catalogRepository = CatalogRepository(
    AuthLocalDataSource(),
  );

  final CartViewModel cartViewModel;

  List<CartProductModel> _items = [];

  @override
  List<CartProductModel> get items => _items;

  final List<Category> _categories = [];

  @override
  Future<void> loadNextItems(String? loadingUuid) async {
    notifyModelListeners();
  }

  @override
  Future<void> loadData() async {
    isLoading = true;
    notifyModelListeners();

    final allCartItems = await _cartRepository.getAllCartProducts();
    _items = getOrderItems(allCartItems);

    await _loadCategories();

    isLoading = false;
    isAllLoaded = true;
    notifyModelListeners();
  }

  List<CartProductModel> getOrderItems(List<CartProductModel> allCartItems) {
    return allCartItems.where((item) => item.isSelected).toList();
  }

  double get totalPrice {
    double total = 0.0;
    for (final item in _items) {
      if (item.isSelected) total += (item.product?.price ?? 0.0) * item.count;
    }
    return total;
  }

  String? _simpleValidate(String? value, String warningMsg) {
    if (value == null || value.isEmpty) {
      return warningMsg;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.length < 18) {
      return 'Необходимо заполнить номер телефона';
    }
    return null;
  }

  String? validateName(String? value) {
    return _simpleValidate(value, 'Укажите ваше имя');
  }

  String? validateCity(String? value) {
    return _simpleValidate(value, 'Укажите город');
  }

  String? validateStreet(String? value) {
    return _simpleValidate(value, 'Укажите улицу');
  }

  String? validateHouse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Укажите дом';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Введите число!';
    }
    return null;
  }

  void buildAddress() {
    addressController.text =
        'г.${cityController.text} ул.${streetController.text} д.${houseController.text}';
  }

  Future<bool> placeOrder() async {
    buildAddress();
    final response = await _placeOrderRepository.placeOrder(
      address: addressController.text,
      phoneNumber: phoneController.text,
      comment: commentController.text.isNotEmpty
          ? commentController.text
          : null,
      customerName: nameController.text,
      items: items,
    );

    if (response.isError) {
      addError(response.error);
      return false;
    }

    // удаляем из корзины заказанные товары
    for (final item in _items) {
      await cartViewModel.removeProduct(product: item.product!, all: true);
    }

    return true;
  }

  Future<void> _loadCategories() async {
    _categories.clear();
    await _fetchCategoriesRecursively(null);
  }

  Future<void> _fetchCategoriesRecursively(String? parentId) async {
    final response = await _catalogRepository.getCatalogList(
      categoryId: parentId,
    );
    if (!response.isError) {
      final categories = response.result ?? [];
      _categories.addAll(categories);

      for (final category in categories) {
        if (category.hasSubcategories) {
          await _fetchCategoriesRecursively(category.categoryId.toString());
        }
      }
    } else {
      addError(response.error);
    }
  }

  String? getCategoryTitleById(String? id) {
    if (id == null) return null;
    final category = _categories.firstWhereOrNull(
      (c) => c.categoryId == int.parse(id),
    );
    return category?.title;
  }

  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    streetController.dispose();
    houseController.dispose();
    phoneController.dispose();
    nameController.dispose();
    commentController.dispose();
    super.dispose();
  }
}
