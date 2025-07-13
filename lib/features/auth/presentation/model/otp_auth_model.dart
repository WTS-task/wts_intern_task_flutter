import 'package:flutter/material.dart';
import 'package:wts_task/core/models/app_user.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/auth/data/repositories/auth_repository.dart';

class OtpAuthModel extends BaseModel {
  OtpAuthModel({required this.phone, required this.appUser});

  final AppUser appUser;

  final String phone;

  final AuthRepository authRepository = AuthRepository();
  final AuthLocalDataSource localDataSource = AuthLocalDataSource();

  late final TextEditingController otpController = TextEditingController();

  Future<bool> authByPhone() async {
    final response = await authRepository.login(
      phone: phone,
      code: otpController.text,
    );
    if (response.isError) {
      addError(response.error);
      return false;
    }
    await appUser.saveToken(response.result!.accessToken!);
    final result = await appUser.loadProfile();
    if (result == null) {
      addError('Не удалось загрузить профиль');
      return false;
    }
    return true;
  }

  String? validateCode(String? value) {
    if (value == null || value.length < 4) {
      return 'Введите полный код';
    }
    return null;
  }
}
