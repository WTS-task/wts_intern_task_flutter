import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/features/profile/data/repositories/profile_repository.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';

class ProfileViewModel extends ItemModel<User> {
  ProfileViewModel(AuthLocalDataSource authRepo)
      : _repo = ProfileRepository(authRepo),
        super(item: null);

  final ProfileRepository _repo;
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) super.notifyListeners();
  }

  @override
  Future<void> loadItemData() async {
    final resp = await _repo.profile();
    if (_disposed) {
      return;
    }
    if (resp.error?.isNotEmpty == true) {
      throw Exception(resp.error!);
    }
    await onItemLoaded(resp.result!);
  }

  void clearItem() {
    data = null;
    notifyListeners();
  }
}