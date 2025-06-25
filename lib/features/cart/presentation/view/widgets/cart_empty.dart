import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

Widget cartEmpty() {
  return const Center(
    child: Text(
      'Корзина пуста',
      style: TextStyle(fontSize: 18, color: AppColors.primaryText),
    ),
  );
}