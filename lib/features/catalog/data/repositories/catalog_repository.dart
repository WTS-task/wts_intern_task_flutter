import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/catalog/data/models/category.dart';

class CatalogRepository extends PrivateApi {
  CatalogRepository(super.authRepository);

  Future<ApiResponse<List<CatalogResponse>>> getCatalogList({
    String? categoryId,
    int? offset,
  }) async {
    final response = await get(
      '/category/list',
      queryParameters: {"offset": offset, "parentId": categoryId},
    );
    return ApiResponseParser.parseListFromResponse(
      response,
      fromJson: CatalogResponse.fromJson,
      emptyError: 'Объекты не найден',
      key: 'categories',
    );
  }
}
