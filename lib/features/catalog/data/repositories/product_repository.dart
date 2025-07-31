import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/base_api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/catalog/data/services/product_cache_service.dart';
import 'package:wts_task/features/product/data/models/product.dart';

class ProductRepository extends PrivateApi {
  ProductRepository(super.authRepository);
  final ProductCacheService _cacheService = ProductCacheService();

  Future<ApiResponse<List<Product>>> getProductList({
    required String categoryId,
    int? offset,
    String? text,
  }) async {
    if (text == null || text.isEmpty) {
      final cached = await _cacheService.getCachedProducts(categoryId);
      if (cached.isNotEmpty) {
        final base = BaseApiResponse(meta: const Meta(success: true));
        return ApiResponse<List<Product>>(
          baseApiResponse: base,
          result: cached,
        );
      }
    }
    final products = await fetchProductsFromServer(
      offset: offset,
      categoryId: categoryId,
      text: text,
    );

    if (text == null || text.isEmpty) {
      await _cacheService.cacheProducts(categoryId, products.result ?? []);
    }

    return products;
  }

  Future<ApiResponse<List<Product>>> fetchProductsFromServer({
    String? categoryId,
    String? text,
    int? offset,
  }) async {
    final response = await get(
      '/shop/product/list',
      queryParameters: {
        if (categoryId != '0') "categoryId": categoryId,
        "offset": offset,
        "text": text,
      },
    );

    return ApiResponseParser.parseListFromResponse(
      response,
      fromJson: Product.fromJson,
      emptyError: 'Объекты не найдены',
      key: 'products',
    );
  }

  Future<void> clearProductCache() async {
    await _cacheService.clearCache();
  }
}
