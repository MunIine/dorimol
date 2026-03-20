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
    required this.imageUrl,
    required this.ordersAmount,
    required this.currentDiscount,
    required this.discountTiers
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String uid;
  final String role;
  final String name;
  final String? city;
  final String? address;

  @JsonKey(name: 'onboarding_completed')
  final bool onboardingCompleted;
  
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'phone_number')
  final String phone;

  @JsonKey(name: 'orders_amount')
  final int ordersAmount;

  @JsonKey(name: 'current_discount')
  final int currentDiscount;

  @JsonKey(name: 'discount_tiers')
  final List<DiscountTier> discountTiers;
  
  @override
  String toString() => 'User($name)';
}

@JsonSerializable()
class DiscountTier {
  const DiscountTier({
    required this.percent,
    required this.ordersRequired,
  });

  factory DiscountTier.fromJson(Map<String, dynamic> json) => _$DiscountTierFromJson(json);

  final int percent;

  @JsonKey(name: 'orders_required')
  final int ordersRequired;

  Map<String, dynamic> toJson() => _$DiscountTierToJson(this);
}