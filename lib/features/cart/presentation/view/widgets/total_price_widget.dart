import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/features/cart/presentation/view_models/cart_view_model.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({required this.vm, super.key});

  final CartViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Итого', style: AppTextStyles.priceSmall),
        Text(
          '\$${vm.calculateTotalPrice()}',
          style: AppTextStyles.priceSmall,
        ),
      ],
    );
  }
}
