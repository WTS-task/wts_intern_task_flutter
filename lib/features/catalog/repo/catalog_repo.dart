import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shop1/core/data/app_database.dart';
import 'package:shop1/features/catalog/models/local/category_dao.dart';
import 'package:shop1/features/catalog/models/remote/catalog_model.dart';
import 'package:shop1/features/catalog/models/local/catalog_model_extension.dart';
import 'package:shop1/core/services/catalog_api_service.dart';

class CatalogRepo {
  final CatalogApiService apiService;
  final CategoryDao dao;

  CatalogRepo(this.apiService, this.dao);

  Future<List<CatalogModel>> getCatalogItems(
    String accessToken,
    int? parentId,
  ) async {
    try {
      final response = await apiService.getRemoteCatalogItems(
        accessToken,
        parentId,
      );
      final categories = response.data.data.categories;
      await dao.insertCategories(
        categories.map((model) => model.toDrift()).toList(),
      );
      return categories;
    } on DioException catch (e) {
      log(e.message.toString());
      List<CategoryTableData> cached = [];
      if (parentId != null) {
        cached = await dao.getSubcategories(parentId);
      } else {
        cached = await dao.getParentCategories();
      }
      if (cached.isEmpty) {
        rethrow;
      }
      return cached
          .map((drift) => CatalogModelDriftExt.fromDrift(drift))
          .toList();
    }
  }
}
