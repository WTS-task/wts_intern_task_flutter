import 'package:wts_task/core/constants/constants.dart';
import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/base_api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/dio_network_service.dart';
import 'package:wts_task/features/product/data/models/product_model.dart';
import 'package:wts_task/features/product/data/services/product_cache_service.dart';

class ProductRepository extends DioNetworkService {
  ProductRepository();
  final ProductCacheService _cacheService = ProductCacheService();

  Future<ApiResponse<List<ProductModel>>> getProductList({
    required String categoryId,
    String? text,
  }) async {
    if (text == null || text.isEmpty) {
      final cached = await _cacheService.getCachedProducts(categoryId);
      if (cached.isNotEmpty) {
        final base = BaseApiResponse(meta: const Meta(success: true));
        return ApiResponse<List<ProductModel>>(
          baseApiResponse: base,
          result: cached,
        );
      }
    }
    final products = await fetchProductsFromServer(
      categoryId: categoryId,
      text: text,
    );

    if (text == null || text.isEmpty) {
      await _cacheService.cacheProducts(categoryId, products.result ?? []);
    }

    return products;
  }

  Future<ApiResponse<List<ProductModel>>> fetchProductsFromServer({
    String? categoryId,
    String? text,
  }) async {
    final response = await get(
      '/shop/product/list',
      queryParameters: {
        "accessToken": Constants.accsessToken,
        if (categoryId != '0') "categoryId": categoryId,
        "text": text,
      },
    );
    return ApiResponseParser.parseListFromResponse(
      response,
      fromJson: ProductModel.fromJson,
      emptyError: 'Объекты не найдены',
      key: 'products',
    );
  }

  Future<void> clearProductCache() async {
    await _cacheService.clearCache();
  }
}
