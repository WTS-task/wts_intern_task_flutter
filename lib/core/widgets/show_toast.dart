import 'package:bot_toast/bot_toast.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

void showToast({required String message}) {
  BotToast.showText(
    text: message,
    duration: Duration(seconds: 2),
    contentColor: AppColors.buttonBgPrimary,
    textStyle: AppTextStyles.button,
  );
}
