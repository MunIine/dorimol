// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  uid: json['uid'] as String,
  role: json['role'] as String,
  name: json['name'] as String,
  phone: json['phone_number'] as String,
  city: json['city'] as String?,
  address: json['address'] as String?,
  onboardingCompleted: json['onboarding_completed'] as bool,
  image_url: json['image_url'] as String?,
  orders_amount: (json['orders_amount'] as num).toInt(),
  current_discount: (json['current_discount'] as num).toInt(),
  discountTiers: (json['discount_tiers'] as List<dynamic>)
      .map((e) => DiscountTier.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'uid': instance.uid,
  'role': instance.role,
  'name': instance.name,
  'city': instance.city,
  'address': instance.address,
  'onboarding_completed': instance.onboardingCompleted,
  'image_url': instance.image_url,
  'phone_number': instance.phone,
  'orders_amount': instance.orders_amount,
  'current_discount': instance.current_discount,
  'discount_tiers': instance.discountTiers,
};

DiscountTier _$DiscountTierFromJson(Map<String, dynamic> json) => DiscountTier(
  percent: (json['percent'] as num).toInt(),
  ordersRequired: (json['orders_required'] as num).toInt(),
);

Map<String, dynamic> _$DiscountTierToJson(DiscountTier instance) =>
    <String, dynamic>{
      'percent': instance.percent,
      'orders_required': instance.ordersRequired,
    };
