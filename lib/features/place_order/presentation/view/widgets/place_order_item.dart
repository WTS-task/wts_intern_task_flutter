import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/place_order/presentation/view_model/place_order_view_model.dart';

class PlaceOrderItem extends StatelessWidget {
  const PlaceOrderItem({
    required this.vm,
    required this.product,
    required this.index,
    super.key,
  });

  final PlaceOrderViewModel vm;
  final CartProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final categoryTitle = vm.getCategoryTitleById(
      product.product?.categoryId.toString(),
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.4,
      color: Colors.white,
      child: Row(
        children: [
          CustomCachedImage(
            imageUrl: product.product?.imageUrl ?? '',
            width: 80,
            height: 80,
            borderRadius: BorderRadius.circular(16),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: OrderItemDetails(
              name: product.product?.name ?? 'empty',
              count: product.count,
              categoryTitle: categoryTitle,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItemDetails extends StatelessWidget {
  const OrderItemDetails({
    required this.name,
    required this.categoryTitle,
    required this.count,
    super.key,
  });

  final String name;
  final String? categoryTitle;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '($countшт.) $name ',
          style: AppTextStyles.bodyMedium,
          maxLines: 1,
        ),
        const SizedBox(height: 3),
        Text(categoryTitle ?? '', style: AppTextStyles.bodySmall, maxLines: 1),
      ],
    );
  }
}
