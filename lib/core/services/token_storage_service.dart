import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  final FlutterSecureStorage _storage;
  const TokenStorageService(this._storage);

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> saveRole(String role) async {
    await _storage.write(key: 'user_role', value: role);
  }
  Future<String?> get role => _storage.read(key: 'user_role');

  Future<String?> get accessToken => _storage.read(key: 'access_token');
  Future<String?> get refreshToken => _storage.read(key: 'refresh_token');
  Future<bool> get hasSession async => (await accessToken) != null;
  Future<void> clear() => _storage.deleteAll();
}