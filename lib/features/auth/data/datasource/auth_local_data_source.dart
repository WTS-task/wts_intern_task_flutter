import 'package:wts_task/core/services/secure_storage.dart';

class AuthLocalDataSource {
  AuthLocalDataSource();

  static const String _accessTokenKey = "accessToken";

  SecureStorage get _storage => SecureStorage.instance;

  Future<bool> isAuthenticated() async =>
      (await getAccessToken())?.isNotEmpty ?? false;

  Future<void> deleteAccessToken() async {
    await _storage.deleteValue(_accessTokenKey);
  }

  Future<String?> getAccessToken() async {
    return await _storage.getValue(_accessTokenKey);
  }

  Future<void> saveAccessToken({required String accessToken}) async {
    await _storage.setValue(_accessTokenKey, accessToken);
  }
}
