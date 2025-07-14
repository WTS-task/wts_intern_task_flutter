import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class ProductCountWidget extends StatelessWidget {
  const ProductCountWidget({
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.dividerBorder),
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
          ),
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
