import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static final SecureStorage _instance = SecureStorage._();

  static SecureStorage get instance => _instance;
  final storage = FlutterSecureStorage();

  Future<String?> getValue(String key) async {
    return await storage.read(key: key);
  }

  Future<void> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteValue(String key) async {
    await storage.delete(key: key);
  }
}
