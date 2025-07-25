import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wts_task/features/product/data/models/product_model.dart';

part 'cart_product_model.freezed.dart';
part 'cart_product_model.g.dart';

@freezed
abstract class CartProductModel with _$CartProductModel {
  const factory CartProductModel({
    required int count,
    required bool isSelected,
    required ProductModel? product,
  }) = _CartProductModel;

  const CartProductModel._();

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
}
