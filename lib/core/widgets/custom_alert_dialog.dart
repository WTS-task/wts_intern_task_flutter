import 'package:flutter/material.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

import '../constants/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = "ОК",
    this.cancelText = "Отмена",
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: AppTextStyles.bodyLarge),
      content: Text(
        content,
        style: TextStyle(color: AppColors.secondaryText, fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (onCancel != null) {
              onCancel!();
            }
            Navigator.of(context).pop(false);
          },
          child: Text(
            cancelText,
            style: TextStyle(color: AppColors.buttonBgPrimary, fontSize: 16),
          ),
        ),
        TextButton(
          onPressed: () {
            if (onConfirm != null) {
              onConfirm!();
            }
            Navigator.of(context).pop(true);
          },
          child: Text(
            confirmText,
            style: TextStyle(color: AppColors.buttonBgPrimary, fontSize: 16),
          ),
        ),
      ],
    );
  }

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = "ОК",
    String cancelText = "Отмена",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}
