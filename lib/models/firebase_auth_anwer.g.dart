// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_anwer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseAuthAnwer _$FirebaseAuthAnwerFromJson(Map<String, dynamic> json) =>
    FirebaseAuthAnwer(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$FirebaseAuthAnwerToJson(FirebaseAuthAnwer instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
