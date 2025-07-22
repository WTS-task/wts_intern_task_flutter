import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';
import 'package:wts_task/core/widgets/show_toast.dart';
import 'package:wts_task/features/cart/data/models/cart_product_model.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wts_task/features/cart/presentation/view/widgets/product_count_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.product, required this.index, super.key});
  final CartProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CartViewModel>();
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(product.product?.productId),
      background: ItemCardDismissBackground(),
      onDismissed: (direction) {
        vm.removeProductAt(index);
        showToast(message: 'Товар "${product.product?.name}" удалён');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0.4,
        color: Colors.white,
        child: Row(
          children: [
            _CartItemImage(
              imageUrl: product.product?.imageUrl ?? '',
              isSelected: product.isSelected,
              onCheckboxPressed: () => vm.onCheckboxPressed(index),
            ),
            SizedBox(width: 20),
            Expanded(
              child: _CartItemDetails(
                name: product.product?.name ?? 'empty',
                price: product.product?.price ?? 0,
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

class ItemCardDismissBackground extends StatelessWidget {
  const ItemCardDismissBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}

class _CartItemImage extends StatelessWidget {
  const _CartItemImage({
    required this.imageUrl,
    required this.isSelected,
    required this.onCheckboxPressed,
  });

  final String imageUrl;
  final bool isSelected;
  final VoidCallback onCheckboxPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CustomCachedImage(
          imageUrl: imageUrl,
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
            value: isSelected,
            onChanged: (_) => onCheckboxPressed(),
          ),
        ),
      ],
    );
  }
}

class _CartItemDetails extends StatelessWidget {
  const _CartItemDetails({required this.name, required this.price});

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: AppTextStyles.bodyMedium, maxLines: 1),
        SizedBox(height: 3),
        Text(
          '${price.toString()} \$',
          style: AppTextStyles.bodySmall,
          maxLines: 1,
        ),
      ],
    );
  }
}
