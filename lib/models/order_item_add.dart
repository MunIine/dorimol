import 'package:json_annotation/json_annotation.dart';

part 'order_item_add.g.dart';

@JsonSerializable()
class OrderItemAdd {
  OrderItemAdd({
    required this.productId,
    required this.quantity,
  });

  factory OrderItemAdd.fromJson(Map<String, dynamic> json) => _$OrderItemAddFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemAddToJson(this);

  @JsonKey(name: "product_id")
  final String productId;
  final double quantity;
}