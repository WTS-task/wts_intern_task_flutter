import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/app/routes.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/constants/assets_catalog.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/auth/presentation/model/otp_auth_model.dart';

class OtpScreen extends BasePage {
  const OtpScreen({
    required this.phoneNumber,
    super.key,
    super.title = 'Подтверждение',
  });

  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends BaseFormPageState<OtpScreen, OtpAuthModel> {
  @override
  OtpAuthModel createModel() =>
      OtpAuthModel(phone: widget.phoneNumber, appUser: context.read());

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

  @override
  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(AssetsCatalog.logo, fit: BoxFit.contain),
          const SizedBox(height: 15),
          const Text('Введите код', style: AppTextStyles.bodyLarge),
          const SizedBox(height: 16),
          Text(
            'Мы отправили код подтверждения на номер\n${PhoneNumberFormatter.format(widget.phoneNumber)}',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.secondaryText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          OtpPinField(
            controller: vm.otpController,
            onCompleted: (_) => submit(),
            validator: vm.validateCode,
          ),
          const SizedBox(height: 24),
          Center(
            child: ResendCodeButton(
              isResendEnabled: _isResendEnabled,
              resendTimer: _resendTimer,
              onResendPressed: _startResendTimer,
            ),
          ),

          const Spacer(),
          ContinueButton(onPressed: submit),
        ],
      ),
    );
  }

  void submit() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
    trySubmitForm(context);
  }

  @override
  Future<void> submitForm() async {
    final result = await vm.authByPhone();
    if (result) {
      await context.clearStackAndNavigate('/catalog');
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    required this.isResendEnabled,
    required this.resendTimer,
    required this.onResendPressed,
    super.key,
  });

  final bool isResendEnabled;
  final int resendTimer;
  final VoidCallback onResendPressed;

  @override
  Widget build(BuildContext context) {
    return isResendEnabled
        ? TextButton(
            onPressed: onResendPressed,
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: AppColors.buttonBgSecondary,
            ),
            child: const Text(
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
  const OtpPinField({
    required this.controller,
    super.key,
    this.validator,
    this.onCompleted,
  });

  final TextEditingController controller;

  final ValueChanged<String>? onCompleted;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 231,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        autoFocus: true,
        controller: controller,
        keyboardType: TextInputType.number,
        textStyle: AppTextStyles.bodyLarge,
        validator: validator,
        errorTextMargin: const EdgeInsets.only(left: 231 / 4),
        errorTextSpace: 25,
        separatorBuilder: (context, index) => const SizedBox(width: 13),
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
        animationDuration: Duration.zero,
        enableActiveFill: true,
        animationType: AnimationType.none,
        cursorColor: AppColors.primaryText,
        onCompleted: onCompleted,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColors.buttonBgPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Продолжить', style: AppTextStyles.button),
      ),
    );
  }
}
