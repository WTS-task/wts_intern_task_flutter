import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wts_task/core/constants/app_colors.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  late final TextEditingController _phoneController;
  late final MaskTextInputFormatter _phoneFormatter;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _phoneFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    final phone = _phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (phone.length == 11) {
      context.go('/auth/otp', extra: phone);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Введите корректный номер',
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AuthAppBar(title: 'Авторизация'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/the_shop_creative.jpg',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            const Text(
              'Введите номер телефона',
              style: AppTextStyles.bodyLarge,
            ),
            const SizedBox(height: 24),
            PhoneInputField(
              controller: _phoneController,
              formatter: _phoneFormatter,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _handleContinue,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColors.buttonBgPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Продолжить', style: AppTextStyles.button),
            ),
            const Spacer(),
            const PrivacyPolicyText(),
          ],
        ),
      ),
    );
  }
}

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const AuthAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title, style: AppTextStyles.appBarText),
      centerTitle: true,
      leading: onBackPressed != null
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackPressed,
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final MaskTextInputFormatter formatter;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [formatter],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Номер телефона',
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.secondaryText,
        ),
        hintText: '+7 (___) ___-__-__',
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.secondaryText,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.dividerBorder,
            width: 1.0,
          ),
        ),
        filled: true,
        fillColor: AppColors.background,
      ),
    );
  }
}

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text.rich(
        TextSpan(
          text: 'Продолжая, вы соглашаетесь с нашей ',
          style: AppTextStyles.bodySmall,
          children: [
            TextSpan(
              text: 'Политикой конфиденциальности',
              style: AppTextStyles.bodySmall.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            const TextSpan(text: ' и '),
            TextSpan(
              text: 'Условиями использования',
              style: AppTextStyles.bodySmall.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}