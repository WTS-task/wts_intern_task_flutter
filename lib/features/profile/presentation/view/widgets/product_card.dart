import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';
import 'package:wts_task/features/profile/data/models/shop_order_item.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, required this.width, super.key});
  final ShopOrderItem product;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        // можно добавить переход на экран с деталями товара из каталога (по id)
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedImage(
            imageUrl: product.imageUrl ?? '',
            width: width,
            height: 180,
            borderRadius: BorderRadius.circular(16),
          ),
          const SizedBox(height: 5),
          Text(
            product.name ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
