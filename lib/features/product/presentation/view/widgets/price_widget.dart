import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    required this.amount,
    super.key,
    this.currencySymbol = '₽',
    this.style,
    this.compact = false,
  });

  final double amount;
  final String currencySymbol;
  final TextStyle? style;
  final bool compact;

  static final NumberFormat _formatter = NumberFormat.decimalPattern("ru_RU");

  @override
  Widget build(BuildContext context) {
    final formattedAmount = compact
        ? amount.toStringAsFixed(0)
        : _formatter.format(amount);

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
}
