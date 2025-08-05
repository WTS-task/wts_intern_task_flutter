import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/constants.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';
import 'package:wts_task/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:wts_task/features/catalog/presentation/view/product_detail_screen.dart';
import 'package:wts_task/features/product/data/models/product.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({required this.item, super.key});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.1,
      color: AppColors.background,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _openProductDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(flex: 2, child: _buildImage()),
              const SizedBox(height: 8),
              Flexible(child: _buildTitle()),
              const SizedBox(height: 8),
              _buildCartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CustomCachedImage(imageUrl: item.imageUrl);
  }

  Widget _buildTitle() {
    return Text(
      item.name ?? "Нет названия",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: const Icon(Icons.shopping_basket_outlined),
        onPressed: () => _openCartScreen(context),
      ),
    );
  }

  void _openProductDetail(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => const ProductDetailScreen(productId: ''), //???
    //   ),
    // );

    if (item.productId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ошибка: у товара отсутствует ID')),
      );
      return;
    }

    context.push('/catalog/category/products/${item.productId}');
  }

  void _openCartScreen(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => const CartScreen(),
    //   ),
    // );

    context.push('/cart');
  }
}
