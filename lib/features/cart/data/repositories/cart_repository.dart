import 'package:wts_task/features/cart/data/services/cart_service.dart';
import 'package:wts_task/core/exceptions/app_exception.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/core/exceptions/repo_exception.dart';

class CartRepository {
  CartService hiveService = CartService.instance;

  Future<List<CartProductModel>> getAllCartProducts() async {
    try {
      return hiveService.readProducts();
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> saveAllCartProducts(List<CartProductModel> products) async {
    try {
      await hiveService.saveProducts(products);
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> addProductToCart(CartProductModel newProduct) async {
    try {
      await hiveService.addProduct(newProduct);
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }

  Future<void> clearCart() async {
    try {
      await hiveService.clearCart();
    } on AppException catch (e) {
      throw RepositoryException(errorMsg: e.errorMessage);
    } catch (e) {
      throw RepositoryException(errorMsg: e.toString());
    }
  }
}
