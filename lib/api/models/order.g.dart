// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  fullName: json['full_name'] as String,
  phoneNumber: json['phone_number'] as String,
  deliveryAddress: json['delivery_address'] as String?,
  comment: json['comment'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => ProductInCart.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'comment': instance.comment,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'full_name': instance.fullName,
  'phone_number': instance.phoneNumber,
  'delivery_address': instance.deliveryAddress,
};
