import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_item_details_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/catalog/data/models/product.dart';
import 'package:wts_task/features/catalog/presentation/model/product_detail_model.dart';

class ProductDetailScreen extends BasePage {
  const ProductDetailScreen({
    required this.product, required String productId, super.key,
  }) : super(title: 'Детали товара');

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends BaseItemDetailsPageState<ProductDetailScreen, ProductDetailViewModel> {
  @override
  ProductDetailViewModel createModel() => ProductDetailViewModel(product: widget.product);

  @override
  Widget buildItemDetails(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name ?? 'Детали товара')),
      body: Center(
        child: Text('ID товара: ${widget.product.productId}'),
      ),
    );
  }
}