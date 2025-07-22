import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';
import 'package:wts_task/features/catalog/data/models/product.dart';

class CatalogRepository {

  CatalogRepository(this._api);
  final PrivateApi _api;

  Future<List<Category>> getCategories() async {
    final response = await _api.get('category/list/');
    return ApiResponseParser.parseListFromResponse(
      response,
      key: 'categories',
      fromJson: Category.fromJson,
    ).result ?? [];
  }

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response = await _api.get(
        'shop/product/list/',
        queryParameters: {'categoryId': categoryId}
    );
    return ApiResponseParser.parseListFromResponse(
      response,
      key: 'products',
      fromJson: Product.fromJson,
    ).result ?? [];
  }
}