// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_add.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderAdd _$OrderAddFromJson(Map<String, dynamic> json) => OrderAdd(
  city: json['city'] as String?,
  address: json['address'] as String?,
  comment: json['comment'] as String?,
  deliveryType: $enumDecode(_$DeliveryTypeEnumMap, json['delivery_type']),
  expectedTotalPrice: (json['expected_total_price'] as num).toDouble(),
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemAdd.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderAddToJson(OrderAdd instance) => <String, dynamic>{
  'city': instance.city,
  'address': instance.address,
  'comment': instance.comment,
  'items': instance.items,
  'delivery_type': _$DeliveryTypeEnumMap[instance.deliveryType]!,
  'expected_total_price': instance.expectedTotalPrice,
};

const _$DeliveryTypeEnumMap = {
  DeliveryType.pickup: 'pickup',
  DeliveryType.courier: 'courier',
};
