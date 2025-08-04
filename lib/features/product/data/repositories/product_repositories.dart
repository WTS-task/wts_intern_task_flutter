import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/entities/api_response.dart';
import 'package:wts_task/core/entities/base_api_response.dart';
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
    try {
      final response = await get(
        '/shop/product/details',
        queryParameters: {'productId': productId},
      );

      debugPrint('Raw product details response: ${response.rawData}');

      if (response.dataJson == null) {
        return ApiResponse.error(
          error: 'Товар не найден',
          baseApiResponse: response,
        );
      }

      dynamic productData;
      if (response.dataJson?['product'] != null) {
        productData = response.dataJson?['product'];
      } else if (response.dataJson?['data']?['product'] != null) {
        productData = response.dataJson?['data']['product'];
      } else {
        return ApiResponse.error(
          error: 'Товар не найден в ответе сервера',
          baseApiResponse: response,
        );
      }

      return ApiResponseParser.parseObjectFromResponse(
        response,
        fromJson: (json) => Product.fromJson(productData),
        emptyError: 'Товар не найден',
      );
    } catch (e) {
      return ApiResponse.error(
        error: 'Ошибка загрузки товара: ${e.toString()}',
        baseApiResponse: BaseApiResponse(error: e.toString(), rawData: null),
      );
    }
  }

  Future<ApiResponse<List<Review>>> getProductReviews({
    required int productId,
    int offset = 0,
    int? limit,
  }) async {
    try {
      final params = {
        'relatedItemId': productId,
        'objectType': 1,
        'offset': offset,
        if (limit != null) 'limit': limit,
      };

      final response = await get('/review/list', queryParameters: params);

      dynamic reviewsData;
      String reviewsKey = 'reviews';
      if (response.dataJson?['data']?['reviews'] != null) {
        reviewsData = response.dataJson['data']['reviews'];
        reviewsKey = 'data.reviews';
      } else if (response.dataJson?['reviews'] != null) {
        reviewsData = response.dataJson['reviews'];
      } else {
        return ApiResponse(
          result: [],
          baseApiResponse: response,
        );
      }

      if (reviewsData is List) {
        if (reviewsData.isEmpty) {
          debugPrint('Reviews list is empty, returning empty list');
          return ApiResponse(
            result: [],
            baseApiResponse: response,
          );
        }

        if (reviewsData.every((item) => item is Map<String, dynamic>)) {
          return ApiResponseParser.parseListFromResponse(
            response,
            key: reviewsKey,
            fromJson: (json) => Review.fromJson(json),
            emptyError: null,
          );
        } else {
          return ApiResponse(
            result: [],
            baseApiResponse: response,
          );
        }
      }

      return ApiResponse(
        result: [],
        baseApiResponse: response,
      );
    } catch (e, s) {
      return ApiResponse.error(
        error: 'Ошибка загрузки отзывов: ${e.toString()}',
        baseApiResponse: BaseApiResponse(error: e.toString(), rawData: null),
      );
    }
  }

  Future<void> addToCart(Product product) async {
    await post('/cart/add', data: {'productId': product.productId});
  }

  Future<ApiResponse<void>> submitReview(CreateReviewRequest review) async {
    try {
      final response = await post('/review/create', data: review.toJson());

      if (response.isError) {
        return ApiResponse.error(
          error: response.error ?? 'Ошибка при отправке отзыва',
          baseApiResponse: response,
        );
      }

      return ApiResponse(result: null, baseApiResponse: response);
    } catch (e) {
      return ApiResponse.error(
        error: 'Не удалось отправить отзыв: ${e.toString()}',
        baseApiResponse: BaseApiResponse(error: e.toString(), rawData: null),
      );
    }
  }
}
