import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class ThemeBuilder {
  static ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: 'PublicSans',

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _outlinedButtonStyle(),
      ),

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

  static ButtonStyle _outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      minimumSize: const Size(123, 40),
      side: const BorderSide(
        width: 1,
        color: AppColors.buttonBgPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      foregroundColor: AppColors.buttonBgPrimary,
      textStyle: AppTextStyles.bodyMedium.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.buttonBgSecondary.withOpacity(0.1);
        }
        return Colors.transparent;
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColors.buttonBgSecondary.withOpacity(0.05);
        }
        return Colors.transparent;
      }),
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
        borderSide: const BorderSide(color: AppColors.dividerBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.dividerBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.buttonBgPrimary,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: AppColors.background,
    );
  }
}
