import 'package:dorimol/models/order_statuses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_preview.g.dart';

@JsonSerializable()
class OrderPreview {
  OrderPreview({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    this.city,
    this.address,
  });

  factory OrderPreview.fromJson(Map<String, dynamic> json) => _$OrderPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$OrderPreviewToJson(this);

  final String id;
  final String? city;
  final String? address;

  @JsonKey(unknownEnumValue: OrderStatus.unknown)
  final OrderStatus status;

  @JsonKey(name: "total_price")
  final double totalPrice;
  
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  
  @override
  String toString() => 'Order($id)';
}