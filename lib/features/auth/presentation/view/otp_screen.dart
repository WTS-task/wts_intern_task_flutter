import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:wts_task/core/services/auth_service.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isResendEnabled = false;
  int _resendTimer = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    setState(() {
      _isResendEnabled = false;
      _resendTimer = 30;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _resendTimer--;
      });

      if (_resendTimer <= 0) {
        timer.cancel();
        setState(() {
          _isResendEnabled = true;
        });
      }
    });
  }

  void _handleContinue() {
    if (_otpController.text.length == 4) {
      authService.login();
      context.go('/catalog');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Введите полный код',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.onBackgroundText,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Подтверждение',
          style: AppTextStyles.appBarText,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/auth/phone'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/the_shop_creative.jpg',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 15),
            Text(
              'Введите код',
              style: AppTextStyles.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Мы отправили код подтверждения на номер\n${PhoneNumberFormatter.format(widget.phoneNumber)}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            OtpPinField(controller: _otpController),
            const SizedBox(height: 24),

            Center(
              child: ResendCodeButton(
                isResendEnabled: _isResendEnabled,
                resendTimer: _resendTimer,
                onResendPressed: _startResendTimer,
              ),
            ),

            const Spacer(),

            ContinueButton(
              otpCode: _otpController.text,
              onPressed: _handleContinue,
            ),
          ],
        ),
      ),
    );
  }
}

class ResendCodeButton extends StatelessWidget {
  final bool isResendEnabled;
  final int resendTimer;
  final VoidCallback onResendPressed;

  const ResendCodeButton({
    super.key,
    required this.isResendEnabled,
    required this.resendTimer,
    required this.onResendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isResendEnabled
        ? TextButton(
      onPressed: onResendPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: AppColors.buttonBgSecondary,
      ),
      child: Text(
        'Повторно отправить код',
        style: AppTextStyles.button,
      ),
    )
        : Text(
      'Повторно отправить код через $resendTimer сек',
      style: AppTextStyles.bodySmall.copyWith(
        color: AppColors.secondaryText,
      ),
    );
  }
}

class PhoneNumberFormatter {
  static String format(String phone) {
    if (phone.length == 11) {
      return '+7 (${phone.substring(1, 4)}) ${phone.substring(4, 7)}-${phone.substring(7, 9)}-${phone.substring(9)}';
    }
    return phone;
  }
}

class OtpPinField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const OtpPinField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: controller,
      keyboardType: TextInputType.number,
      textStyle: AppTextStyles.bodyLarge,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 56,
        fieldWidth: 48,
        activeFillColor: AppColors.backgroundSecondary,
        activeColor: AppColors.primaryText,
        selectedColor: AppColors.primaryText,
        inactiveColor: AppColors.dividerBorder,
        selectedFillColor: AppColors.backgroundSecondary,
        inactiveFillColor: AppColors.backgroundSecondary,
      ),
      animationDuration: const Duration(milliseconds: 0),
      enableActiveFill: true,
      animationType: AnimationType.none,
      cursorColor: AppColors.primaryText,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged ?? (value) {},
    );
  }
}

class ContinueButton extends StatelessWidget {
  final String otpCode;
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.otpCode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColors.buttonBgPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Продолжить',
          style: AppTextStyles.button,
        ),
      ),
    );
  }
}