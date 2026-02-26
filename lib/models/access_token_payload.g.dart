// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenPayload _$AccessTokenPayloadFromJson(Map<String, dynamic> json) =>
    AccessTokenPayload(
      uid: json['uid'] as String,
      role: json['role'] as String,
      onboardingComplete: json['onboarding_completed'] as bool,
      iat: (json['iat'] as num).toInt(),
      exp: (json['exp'] as num).toInt(),
    );

Map<String, dynamic> _$AccessTokenPayloadToJson(AccessTokenPayload instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'role': instance.role,
      'iat': instance.iat,
      'exp': instance.exp,
      'onboarding_completed': instance.onboardingComplete,
    };
