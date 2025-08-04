import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/constants.dart';
import 'package:wts_task/features/product/data/models/product/product.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    required this.item, required this.theme, super.key,
  });

  final Product item;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.1,
      color: AppColors.background,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _openProductDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(height: 8),
              _buildTitle(),
              const SizedBox(height: 8),
              _buildCartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        child: CachedNetworkImage(
          width: 64,
          height: 64,
          imageUrl: item.imageUrl ?? Constants.placeholderImageUrl,
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator.adaptive(
                  value: progress.progress,
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Icon(Icons.error, color: theme.colorScheme.error);
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      item.name ?? "Нет названия",
      style: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: Icon(
          Icons.shopping_basket_outlined,
          color: theme.iconTheme.color,
        ),
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
