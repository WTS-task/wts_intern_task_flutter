import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

void showToast({required String message}) {
  BotToast.showCustomText(
    toastBuilder: (_) => Material(
      elevation: 18,
      borderRadius: BorderRadius.circular(8),
      color: AppColors.buttonBgPrimary,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonBgPrimary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 12)],
          border: Border.all(color: Colors.white70, width: 1.5),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(message, style: AppTextStyles.button),
      ),
    ),
    duration: const Duration(seconds: 2),
  );
}