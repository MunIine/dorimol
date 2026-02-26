import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await Future.wait([
      saveAccess(accessToken),
      saveRefresh(refreshToken),
    ]);
  }

  Future<void> saveAccess(String token) => _storage.write(key: "access_token", value: token);
  Future<void> saveRefresh(String token) => _storage.write(key: "refresh_token", value: token);
  
  Future<String?> getAccess() => _storage.read(key: "access_token");
  Future<String?> getRefresh() =>  _storage.read(key: "refresh_token");

  Future<void> clear() => _storage.deleteAll();
}