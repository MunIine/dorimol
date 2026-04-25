import 'package:dorimol/models/order_preview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_orders_response.g.dart';

@JsonSerializable()
class UserOrdersResponse {
  UserOrdersResponse({required this.orders, required this.offset, required this.limit, required this.nextOffset});

  factory UserOrdersResponse.fromJson(Map<String, dynamic> json) => _$UserOrdersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserOrdersResponseToJson(this);

  final List<OrderPreview> orders;
  final int offset;
  final int limit;

  @JsonKey(name: "next_offset")
  final int? nextOffset;
}