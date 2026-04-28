import 'package:dorimol/data/constants.dart';
import 'package:dorimol/models/order_item_add.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_add.g.dart';

@JsonSerializable()
class OrderAdd {
  OrderAdd({
    this.city,
    this.address,
    this.comment,
    required this.deliveryType,
    required this.expectedTotalPrice,
    required this.items,
  });

  factory OrderAdd.fromJson(Map<String, dynamic> json) => _$OrderAddFromJson(json);
  Map<String, dynamic> toJson() => _$OrderAddToJson(this);

  final String? city;
  final String? address;
  final String? comment;

  final List<OrderItemAdd> items;

  @JsonKey(name: "delivery_type")
  final DeliveryType deliveryType;

  @JsonKey(name: "expected_total_price")
  final double expectedTotalPrice;
}

