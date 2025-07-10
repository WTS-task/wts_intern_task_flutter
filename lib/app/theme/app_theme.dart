import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class ThemeBuilder {
  static ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: 'PublicSans',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.onBackgroundText,
          minimumSize: const Size.fromHeight(50),
          backgroundColor: AppColors.buttonBgPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconSize: WidgetStateProperty.all(22),
          foregroundColor: WidgetStateProperty.all(AppColors.buttonBgPrimary),
        ),
      ),
      inputDecorationTheme: _inputDecorationThemeData(),
    );
  }

  static InputDecorationTheme _inputDecorationThemeData() {
    return InputDecorationTheme(
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.secondaryText,
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.secondaryText,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.dividerBorder),
      ),
      filled: true,
      fillColor: AppColors.background,
    );
  }
}
