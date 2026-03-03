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
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'uid': instance.uid,
  'role': instance.role,
  'name': instance.name,
  'city': instance.city,
  'address': instance.address,
  'onboarding_completed': instance.onboardingCompleted,
  'phone_number': instance.phone,
  'orders_amount': instance.orders_amount,
  'image_url': instance.image_url,
};
