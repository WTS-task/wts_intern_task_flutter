import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop1/core/data/app_database.dart';
import 'package:shop1/features/products/models/local/product_dao.dart';
import 'package:shop1/features/products/models/local/product_model_extension.dart';
import 'package:shop1/features/products/models/remote/product_model.dart';
import 'package:shop1/core/services/product_api_service.dart';

class ProductRepo {
  final ProductApiService apiService;
  final ProductDao dao;

  ProductRepo(this.apiService, this.dao);

  Future<List<ProductModel>> getProductItems(
    String accesToken,
    int? categoryId,
    String? searchText,
  ) async {
    try {
      final response = await apiService.getRemoteProductItems(
        accesToken,
        categoryId,
        searchText,
      );
      final products = response.data.data.products;
      await dao.insertProducts(
        products.map((model) => model.toDrift()).toList(),
      );
      return products;
    } on DioException catch (e) {
      log(e.toString());
      List<ProductTableData> cached = [];
      if (searchText != null && categoryId != null) {
        cached = await dao.searchProductByName(
          categoryId: categoryId,
          searchText: searchText,
        );
      } else if (categoryId != null) {
        cached = await dao.getProductByCategoryId(categoryId);
      } else if (searchText != null) {
        cached = await dao.searchProductByName(searchText: searchText);
      } else {
        cached = await dao.getAllProducts();
      }
      if (cached.isEmpty) {
        rethrow;
      }
      return cached.map((drift) => ProductModelExt.fromDrift(drift)).toList();
    }
  }
}
