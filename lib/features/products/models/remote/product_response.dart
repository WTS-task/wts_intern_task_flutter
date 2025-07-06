import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop1/features/products/models/remote/product_model.dart';

part 'product_response.g.dart';

part 'product_response.freezed.dart';

@Freezed()
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({required ProductData data}) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@Freezed()
class ProductData with _$ProductData {
  const factory ProductData({required List<ProductModel> products}) =
      _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
