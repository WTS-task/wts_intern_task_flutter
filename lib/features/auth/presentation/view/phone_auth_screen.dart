import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wts_task/core/constants/app_text_styles.dart';
import 'package:wts_task/core/constants/assets_catalog.dart';
import 'package:wts_task/core/page/base_form_page_state.dart';
import 'package:wts_task/core/page/base_page.dart';
import 'package:wts_task/features/auth/presentation/model/phone_auth_model.dart';

class PhoneAuthScreen extends BasePage {
  const PhoneAuthScreen({super.key, super.title = 'Авторизация'});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState
    extends BaseFormPageState<PhoneAuthScreen, PhoneAuthModel> {
  @override
  PhoneAuthModel createModel() => PhoneAuthModel();

  @override
  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Image.asset(AssetsCatalog.logo, fit: BoxFit.contain),
          const SizedBox(height: 32),
          const Text('Введите номер телефона', style: AppTextStyles.bodyLarge),
          const SizedBox(height: 24),
          PhoneInputField(
            controller: vm.phoneController,
            formatter: vm.phoneFormatter,
            validator: vm.validatePhone,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
              trySubmitForm(context);
            },
            child: const Text('Продолжить', style: AppTextStyles.button),
          ),
          const Spacer(),
          const PrivacyPolicyText(),
        ],
      ),
    );
  }

  @override
  Future<void> submitForm() async {
    final result = await vm.authByPhone();
    if (result) {
      await context.push('/auth/otp', extra: vm.phoneController.text);
    }
  }
}

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    required this.controller,
    required this.formatter,
    required this.validator,
    super.key,
  });

  final TextEditingController controller;
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [formatter],
      keyboardType: TextInputType.phone,
      validator: validator,
      decoration: InputDecoration(
        labelText: 'Номер телефона',
        hintText: '+7 (___) ___-__-__',
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
