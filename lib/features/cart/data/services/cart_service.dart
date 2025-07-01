import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';

import 'package:wts_task/core/exceptions/cache_exception.dart';

class CartService {
  CartService._();

  static const String _boxName = 'cartBox';
  static const String _key = 'cartList';
  static final CartService instance = CartService._();

  static Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      await Hive.openBox<String>(_boxName);
    } on Exception catch (e) {
      throw CacheInitException(errorMsg: e.toString());
    }
  }

  // сохраняет список товаров корзины в хранилище как json строку
  Future<void> saveProducts(List<CartProductModel> cartList) async {
    try {
      final box = Hive.box<String>(_boxName);
      final jsonString = cartList.map((e) => e.toJson()).toList();
      await box.put(_key, jsonEncode(jsonString));
    } on Exception catch (e) {
      throw CacheWriteException(errorMsg: e.toString());
    }
  }

  // читает сохраненную json строку, парсит ее в массив CartProductModel
  Future<List<CartProductModel>> readProducts() async {
    try {
      final box = Hive.box<String>(_boxName);
      final jsonString = box.get(_key);
      if (jsonString == null) return [];
      final decodedString = jsonDecode(jsonString) as List;
      return decodedString
          .map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      throw CacheReadException(errorMsg: e.toString());
    }
  }

  // добавляет один товар в корзину, пригодится для того, кто будет делать карточку товара
  // если товар с таким айдишником уже есть в корзине, то просто увеличит его количество в корзине на столько, сколько было выбрано в карточке товара
  Future<void> addProduct(CartProductModel newProduct) async {
    try {
      final products = await readProducts();
      final existingIndex = products.indexWhere(
        (e) => e.product?.productId == newProduct.product?.productId,
      );
      if (existingIndex != -1) {
        final existing = products[existingIndex];
        products[existingIndex] = existing.copyWith(
          count: existing.count + newProduct.count,
        );
      } else {
        products.add(newProduct);
      }
      await saveProducts(products);
    } on AppException {
      rethrow;
    } catch (e) {
      throw CacheWriteException(errorMsg: e.toString());
    }
  }

  Future<void> clearCart() async {
    try {
      // final box = Hive.box<String>(_boxName);
      // await box.delete(_key);
      await saveProducts(<CartProductModel>[]);
    } catch (e) {
      throw CacheWriteException(errorMsg: e.toString());
    }
  }
}
