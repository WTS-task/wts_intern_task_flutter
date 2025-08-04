// import 'package:wts_task/core/entities/api_response.dart';
// import 'package:wts_task/core/services/api/api_response_parser.dart';
// import 'package:wts_task/core/services/api/private_api.dart';
// import 'package:wts_task/features/product/data/models/product/product.dart';
//
// class ProductRepository extends PrivateApi {
//   ProductRepository(super.authRepository);
//
//   Future<ApiResponse<List<Product>>> getProductList({
//     required String categoryId,
//     int? offset,
//     String? searchString,
//   }) async {
//     final response = await get(
//       '/shop/product/list',
//       queryParameters: {
//         if (categoryId != '0') "categoryId": categoryId,
//         "offset": offset,
//         "text": searchString,
//       },
//     );
//
//     return ApiResponseParser.parseListFromResponse(
//       response,
//       fromJson: Product.fromJson,
//       emptyError: 'Объекты не найдены',
//       key: 'products',
//     );
//   }
// }
