// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPreview _$OrderPreviewFromJson(Map<String, dynamic> json) => OrderPreview(
  id: json['id'] as String,
  status: $enumDecode(
    _$OrderStatusEnumMap,
    json['status'],
    unknownValue: OrderStatus.unknown,
  ),
  totalPrice: (json['total_price'] as num).toDouble(),
  createdAt: DateTime.parse(json['created_at'] as String),
  city: json['city'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$OrderPreviewToJson(OrderPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'address': instance.address,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.unknown: 'unknown',
};
