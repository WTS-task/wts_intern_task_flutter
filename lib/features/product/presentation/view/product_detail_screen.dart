import 'package:flutter/material.dart';
import 'package:wts_task/core/page/base_item_details_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/product/data/models/product_model.dart';
import 'package:wts_task/features/product/presentation/view_model/product_detail_view_model.dart';

class ProductDetailScreen extends BasePage {
  const ProductDetailScreen({
    super.key,
    required this.product,
  }) : super(title: 'Детали товара');

  final ProductModel product;

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