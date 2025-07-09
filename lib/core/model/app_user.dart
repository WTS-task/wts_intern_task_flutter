import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/features/profile/data/repositories/profile_repository.dart';

/// Класс для хранения данных текущего пользователя приложения.
/// * Профиль пользователя [User]
/// * accessToken - для доступа к авторизованным методам API
/// * pushToken - для push уведомлений
class AppUser extends ChangeNotifier {
  AppUser(this._repository, this._authRepository);

  bool isAuthenticated = false;

  User? user;
  final ProfileRepository _repository;
  final AuthLocalDataSource _authRepository;

  Future<User?> loadProfile() async {
    final apiResponse = await _repository.profile();
    if (!apiResponse.isError) {
      isAuthenticated = true;
      user = apiResponse.result;
    }
    notifyListeners();
    return user;
  }

  Future<String?> checkUserProfile() async {
    if (await _authRepository.isAuthenticated()) {
      isAuthenticated = true;
      final response = await _repository.profile();
      if (response.isError) {
        return response.error;
      }
    } else {
      isAuthenticated = false;
    }
    notifyListeners();
    return null;
  }

  Future<void> saveToken(String token) async {
    await _authRepository.saveAccessToken(accessToken: token);
    isAuthenticated = true;
  }
}
