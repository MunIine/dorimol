import 'package:json_annotation/json_annotation.dart';

part 'firebase_auth_anwer.g.dart';

@JsonSerializable()
class FirebaseAuthAnwer {
  const FirebaseAuthAnwer({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;

  factory FirebaseAuthAnwer.fromJson(Map<String, dynamic> json) => _$FirebaseAuthAnwerFromJson(json);
  Map<String, dynamic> toJson() => _$FirebaseAuthAnwerToJson(this);
}