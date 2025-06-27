import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_colors.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../data/models/cart_product_model.dart';
import '../../view_models/cart_view_model.dart';
import 'product_count_widget.dart';

class CartItemWidget extends StatelessWidget {
  final CartProductModel product;
  final int index;

  const CartItemWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CartViewModel>();
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(product.product?.productId),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        vm.removeProductAt(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Товар "${product.product?.name}" удалён')),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0.4,
        color: Colors.white,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                CustomCachedImage(
                  imageUrl: product.product?.imageUrl ?? '',
                  width: 80,
                  height: 80,
                  borderRadius: BorderRadius.circular(16),
                ),
                Positioned(
                  top: -10,
                  left: -10,
                  child: Checkbox(
                    activeColor: AppColors.buttonBgPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    value: product.isSelected,
                    onChanged: (_) {
                      context.read<CartViewModel>().onCheckboxPressed(index);
                    },
                  ),
                ),
              ],
            ),

            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.product?.name ?? 'Name',
                    style: AppTextStyles.bodyMedium,
                    maxLines: 1,
                  ),
                  SizedBox(height: 3),
                  Text(
                    '${product.product?.price.toString()} \$',
                    style: AppTextStyles.bodySmall,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ProductCountWidget(
                count: product.count,
                onIncrement: () => vm.onIncrementButtonPressed(index),
                onDecrement: () => vm.onDecrementButtonPressed(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
