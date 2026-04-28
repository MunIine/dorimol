// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_add.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemAdd _$OrderItemAddFromJson(Map<String, dynamic> json) => OrderItemAdd(
  productId: json['product_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
);

Map<String, dynamic> _$OrderItemAddToJson(OrderItemAdd instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };
