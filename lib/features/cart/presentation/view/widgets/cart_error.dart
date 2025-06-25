import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

Widget cartError(String? message) {
  return Center(
    child: Text(
      message ?? 'Ошибка при обработке товаров в корзине!',
      style: TextStyle(fontSize: 18, color: AppColors.error),
    ),
  );
}