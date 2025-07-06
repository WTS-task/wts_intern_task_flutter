import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shop1/core/constants/backend_urls.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/features/catalog/models/remote/catalog_response.dart';

part 'catalog_api_service.g.dart';

@RestApi()
abstract class CatalogApiService {
  factory CatalogApiService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _CatalogApiService;

  @GET(BackendUrls.catalog)
  Future<HttpResponse<CatalogResponse>> getRemoteCatalogItems(
    @Query(Constants.accessTokenKey) String accessToken,
    @Query(Constants.parentIdKey) int? parentId,
  );
}
