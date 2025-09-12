import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({required this.totalPrice, super.key});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Итого', style: AppTextStyles.priceSmall),
        Text(
          '\$${totalPrice}',
          style: AppTextStyles.priceSmall,
        ),
      ],
    );
  }
}