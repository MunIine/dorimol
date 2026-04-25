// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrdersResponse _$UserOrdersResponseFromJson(Map<String, dynamic> json) =>
    UserOrdersResponse(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      nextOffset: (json['next_offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserOrdersResponseToJson(UserOrdersResponse instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'offset': instance.offset,
      'limit': instance.limit,
      'next_offset': instance.nextOffset,
    };
