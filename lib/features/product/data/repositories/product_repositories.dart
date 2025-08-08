import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/services/api/api_response_parser.dart';
import 'package:wts_task/core/services/api/private_api.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';
import 'package:wts_task/features/product/data/models/review/review_model.dart';

class ProductRepository extends PrivateApi {
  ProductRepository(super.authRepository);

  Future<ApiResponse<List<Product>>> getProductList({
    required String categoryId,
    int? offset,
    String? searchString,
  }) async {
    final response = await get(
      '/shop/product/list',
      queryParameters: {
        if (categoryId != '0') "categoryId": categoryId,
        "offset": offset,
        "text": searchString,
      },
    );

    return ApiResponseParser.parseListFromResponse(
      response,
      fromJson: Product.fromJson,
      emptyError: 'Объекты не найдены',
      key: 'products',
    );
  }

  Future<ApiResponse<Product>> getProductDetails(int productId) async {
    final response = await get(
      '/shop/product/details',
      queryParameters: {'productId': productId},
    );

    return ApiResponseParser.parseObjectFromResponse(
      response,
      fromJson: Product.fromJson,
      emptyError: 'Товар не найден',
      key: 'product',
    );
  }

  Future<ApiResponse<List<Review>>> getProductReviews({
    required int productId,
    int offset = 0,
    int? limit,
  }) async {
    final response = await get(
      '/review/list',
      queryParameters: {
        'relatedItemId': productId,
        'objectType': 2,
        'offset': offset,
        if (limit != null) 'limit': limit,
      },
    );

    return ApiResponseParser.parseListFromResponse(
      response,
      fromJson: Review.fromJson,
      key: 'reviews',
    );
  }

  Future<ApiResponse<void>> submitReview({
    required int relatedItemId,
    required String objectType,
    required String text,
    required int rating,
    int? updatedAt,
  }) async {
    final response = await post(
      '/review/create',
      data: {
        'relatedItemId': relatedItemId,
        'objectType': 2,
        'text': text,
        'rating': rating,
        if (updatedAt != null) 'updatedAt': updatedAt,
      },
    );

    if (response.isError) {
      return ApiResponse.error(
        error: response.error ?? 'Ошибка при отправке отзыва',
        baseApiResponse: response,
      );
    }

    return ApiResponse(result: null, baseApiResponse: response);
  }
}
