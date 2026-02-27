import 'dart:convert';
import 'package:dorimol/data/exceptions.dart';
import 'package:dorimol/data/services/storage_service.dart';
import 'package:dorimol/models/access_token_payload.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TokenService {
  TokenService({required this.storageService, required this.talker});
  final StorageService storageService;
  final Talker talker;
  
  String? _accessToken;

  AccessTokenPayload parseAccessToken() {
    if (_accessToken == null) {
      throw const TokenException("Access token is null");
    }
    final payload = _accessToken!.split('.')[1];

    final normalized = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));

    final Map<String, dynamic> json = jsonDecode(decoded);

    return AccessTokenPayload.fromJson(json);
  }

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    _accessToken = accessToken;
    await storageService.saveTokens(accessToken, refreshToken);
    talker.info("Tokens saved successfully");
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    await storageService.clear();
    talker.info("Tokens cleared successfully");
  }

  Future<void> init() async {
    _accessToken = await storageService.getAccess();
  }

  String? get accessToken => _accessToken;
  Future<String?> get refreshToken async => await storageService.getRefresh();
}