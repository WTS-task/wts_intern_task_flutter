import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/auth/data/repositories/auth_repository.dart';

class PhoneAuthModel extends BaseModel {
  PhoneAuthModel();

  final AuthRepository authRepository = AuthRepository();

  late final TextEditingController phoneController = TextEditingController();
  late final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  Future<bool> authByPhone() async {
    final response = await authRepository.sendSmsCode(
      phone: phoneController.text,
    );
    if (response.isError) {
      addError(response.error);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  String? validatePhone(String? value) {
    if (value == null || value.length < 18) {
      return 'Необходимо заполнить номер телефона';
    }
    return null;
  }
}
