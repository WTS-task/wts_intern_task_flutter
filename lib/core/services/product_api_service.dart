import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop1/core/constants/backend_urls.dart';
import 'package:shop1/core/constants/constants.dart';
import 'package:shop1/features/products/models/remote/product_response.dart';

part 'product_api_service.g.dart';

@RestApi()
abstract class ProductApiService {
  factory ProductApiService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ProductApiService;

  @GET(BackendUrls.products)
  Future<HttpResponse<ProductResponse>> getRemoteProductItems(
    @Query(Constants.accessTokenKey) String accessToken,
    @Query(Constants.categoryIdKey) int? categoryId,
    @Query(Constants.searchTextKey) String? searchText,
  );
}
