import 'dart:convert';
import 'package:dorimol/models/access_token_payload.dart';

class TokenService {
  AccessTokenPayload parseAccessToken(String jwt) {
    final payload = jwt.split('.')[1];

    final normalized = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));

    final Map<String, dynamic> json = jsonDecode(decoded);

    return AccessTokenPayload.fromJson(json);
  }
}