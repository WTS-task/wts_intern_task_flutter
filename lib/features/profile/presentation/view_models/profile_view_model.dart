import 'package:flutter/foundation.dart';
import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/features/profile/data/repositories/profile_repository.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';

/// Загружает и хранит `User` из API.
class ProfileViewModel extends ItemModel<User> {
  final ProfileRepository _repo;

  /// [authRepo] приходит из Provider<AuthLocalDataSource>
  ProfileViewModel(AuthLocalDataSource authRepo)
      : _repo = ProfileRepository(authRepo),
        super(item: null);

  @override
  @protected
  Future<void> loadItemData() async {
    final resp = await _repo.profile();
    // если пришла реальная ошибка — брошу её
    if (resp.error?.isNotEmpty == true) {
      throw resp.error!;
    }
    // иначе считаем, что данные есть
    await onItemLoaded(resp.result!);
  }
}
