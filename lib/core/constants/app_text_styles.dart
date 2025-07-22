import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';

class AppTextStyles {
  // Основной текст
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
    height: 1.5,
  );

  static const TextStyle appBarText = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  // Кнопки
  static const TextStyle button = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.onBackgroundText,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  // Цены
  static const TextStyle price = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static const TextStyle priceSmall = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );

  static const TextStyle smallLinkBlue = TextStyle(
    fontFamily: 'Public Sans',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.onBackgroundText,
  );
}
