// lib/features/profile/presentation/view_models/edit_profile_view_model.dart

import 'package:flutter/foundation.dart';
import 'package:wts_task/core/models/base_model.dart';
import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/features/profile/data/repositories/profile_repository.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';

/// ViewModel для формы редактирования профиля.
class EditProfileViewModel extends BaseModel {
  final User user;
  final ProfileRepository _repo;

  String? name;
  String? lastname;
  String? email;
  String? countryId;
  String? cityId;
  // String? dateOfBirth;

  EditProfileViewModel(
      AuthLocalDataSource authRepo,
      this.user,
      )   : _repo = ProfileRepository(authRepo),
        name = user.name ?? '',
        lastname = user.lastname ?? '',
        email = user.email ?? '',
        countryId = user.countryId  ?? '',
        cityId = user.cityId ?? '',
        // dateOfBirth = user.dateOfBirth ?? '',
        super(); // конструктор BaseModel без параметров

  @protected
  Future<void> submitData() async {
    // вызываем именно updateProfile
    final resp = await _repo.updateProfile({
      'name': name,
      'lastname': lastname,
      'email': email,
      // добавьте countryId, cityId, если нужно
    });
    if (resp.error?.isNotEmpty == true) {
      throw resp.error!;
    }
  }
}
