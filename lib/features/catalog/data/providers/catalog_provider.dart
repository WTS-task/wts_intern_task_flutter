import 'package:flutter/cupertino.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';
import 'package:wts_task/features/catalog/data/models/product.dart';
import 'package:wts_task/features/catalog/data/repositories/catalog_repository.dart';

class CatalogProvider with ChangeNotifier {

  CatalogProvider(this._repository);
  final CatalogRepository _repository;
  List<Category> _categories = [];
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _categories = await _repository.getCategories();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadProducts(int categoryId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _repository.getProductsByCategory(categoryId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}