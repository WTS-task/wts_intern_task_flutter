import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/product/data/models/product.dart';

class ProductRepository extends PrivateApi {
  ProductRepository(super.authRepository);

  Future<ApiResponse<List<Product>>> getProductList({
    required String categoryId,
    int? offset,
    String? text,
  }) async {
    return await fetchProductsFromServer(
      offset: offset,
      categoryId: categoryId,
      text: text,
    );
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
}