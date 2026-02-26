import 'package:json_annotation/json_annotation.dart';

part 'access_token_payload.g.dart';

@JsonSerializable()
class AccessTokenPayload {
  AccessTokenPayload({
    required this.uid,
    required this.role,
    required this.onboardingCompleted,
    required this.iat,
    required this.exp,
  });

  factory AccessTokenPayload.fromJson(Map<String, dynamic> json) => _$AccessTokenPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenPayloadToJson(this);

  final String uid;
  final String role;
  final int iat;
  final int exp;

  @JsonKey(name: 'onboarding_completed')
  final bool onboardingCompleted;
}