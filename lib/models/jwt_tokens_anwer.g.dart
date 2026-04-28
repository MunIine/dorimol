// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_tokens_anwer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtTokensAnwer _$JwtTokensAnwerFromJson(Map<String, dynamic> json) =>
    JwtTokensAnwer(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$JwtTokensAnwerToJson(JwtTokensAnwer instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
