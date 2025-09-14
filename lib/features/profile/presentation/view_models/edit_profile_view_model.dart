import 'package:flutter/foundation.dart';
import 'package:wts_task/core/models/item_model.dart';
import 'package:wts_task/core/entities/user.dart';
import 'package:wts_task/features/profile/data/repositories/profile_repository.dart';
import 'package:wts_task/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:wts_task/core/entities/api_response.dart';

class EditProfileViewModel extends ItemModel<User> {
  EditProfileViewModel(
      AuthLocalDataSource authRepo,
      User initialUser,
      )   : _repo = ProfileRepository(authRepo),
        super(item: initialUser) {
    _initFromUser(initialUser);
  }

  final ProfileRepository _repo;

  User? get user => item;

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

  String? name;
  String? lastname;
  String? email;
  String? countryId;
  String? cityId;
  String? avatar;
  String? newAvatarPath;
  DateTime? dateOfBirth;

  void _initFromUser(User u) {
    name = u.name ?? '';
    lastname = u.lastname ?? '';
    email = u.email ?? '';
    countryId = u.countryId ?? '';
    cityId = u.cityId ?? '';
    dateOfBirth = u.dateOfBirth;
    avatar = u.avatar;
  }

  void setAvatar(String path) {
    newAvatarPath = path;
    notifyListeners();
  }

  void setDateOfBirth(DateTime? newDate) {
    dateOfBirth = newDate;
    notifyListeners();
  }

  @override
  Future<void> loadItemData() async {
    if (item != null) {
      await onItemLoaded(item!);
    } else {
      isLoading = false;
    }
  }

  @protected
  Future<User> submitData() async {
    final request = {
      'name': name,
      'lastname': lastname,
      'email': email,
      'dateOfBirth': dateOfBirth != null
          ? dateOfBirth!.millisecondsSinceEpoch ~/ 1000
          : 0,
      'image': newAvatarPath,
    };

    final ApiResponse<User> resp = await _repo.updateProfile(request);

    if (resp.error?.isNotEmpty == true) {
      throw Exception(resp.error!);
    }

    if (resp.result != null) {
      avatar = resp.result!.avatar ?? avatar;
      updateItem(resp.result!);
      notifyListeners();
      return resp.result!;
    }

    final built = User(
      userId: user?.userId ?? 0,
      name: name,
      lastname: lastname,
      email: email,
      avatar: newAvatarPath ?? avatar,
      countryId: countryId,
      cityId: cityId,
      dateOfBirth: dateOfBirth,
    );

    avatar = built.avatar;
    updateItem(built);
    notifyListeners();
    return built;
  }

  Future<User> saveProfile() async {
    return await submitData();
  }
}