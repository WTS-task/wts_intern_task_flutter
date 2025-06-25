import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class ProductCountWidget extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCountWidget({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.dividerBorder),
            iconSize: WidgetStateProperty.all(22),
          ),
          onPressed: onDecrement,
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        Text('$count', style: AppTextStyles.bodyMedium),
        const SizedBox(width: 10),
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.dividerBorder),
            iconSize: WidgetStateProperty.all(22),
          ),
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
