import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.uid,
    required this.role,
    required this.name,
    required this.phone,
    required this.city,
    required this.address,
    required this.onboardingCompleted,
    required this.image_url,
    required this.orders_amount,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String uid;
  final String role;
  final String name;
  final String? city;
  final String? address;

  @JsonKey(name: 'onboarding_completed')
  final bool onboardingCompleted;
  
  @JsonKey(name: 'phone_number')
  final String phone;

  @JsonKey(name: 'orders_amount')
  final int orders_amount;

  @JsonKey(name: 'image_url')
  final String? image_url;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}