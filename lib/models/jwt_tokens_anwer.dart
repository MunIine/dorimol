import 'package:json_annotation/json_annotation.dart';

part 'jwt_tokens_anwer.g.dart';

@JsonSerializable()
class JwtTokensAnwer {
  const JwtTokensAnwer({required this.accessToken, required this.refreshToken});

  factory JwtTokensAnwer.fromJson(Map<String, dynamic> json) => _$JwtTokensAnwerFromJson(json);
  Map<String, dynamic> toJson() => _$JwtTokensAnwerToJson(this);

  @JsonKey(name: 'access_token')
  final String accessToken;
  
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
}