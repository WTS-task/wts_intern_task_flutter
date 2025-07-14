import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_item_details_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/catalog/presentation/model/product_model.dart';

class ProductDetailScreen extends BasePage {
  const ProductDetailScreen({super.key, super.title = 'Детали'});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends BaseItemDetailsPageState<ProductDetailScreen, ProductModel> {
  @override
  ProductModel? createModel() => ProductModel();

  @override
  Widget buildItemDetails(BuildContext context) {
    // TODO: implement buildItemDetails
    throw UnimplementedError();
  }
}
