import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class PriceWidget extends StatelessWidget {
  final double amount;
  final String currencySymbol;
  final TextStyle? style;
  final bool compact;

  const PriceWidget({
    super.key,
    required this.amount,
    this.currencySymbol = '₽',
    this.style,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final formattedAmount = compact
        ? amount.toStringAsFixed(0)
        : _formatAmount(amount);

    return Text.rich(
      TextSpan(
        text: formattedAmount,
        style: style ?? AppTextStyles.productPrice,
        children: [
          TextSpan(
            text: ' $currencySymbol',
            style: (style ?? AppTextStyles.productPrice).copyWith(
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }

  String _formatAmount(double value) {
    return value
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        );
  }
}
