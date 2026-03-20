import 'package:dorimol/models/product_in_cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  Order({
    required this.fullName, 
    required this.phoneNumber, 
    required this.deliveryAddress, 
    required this.comment, 
    required this.items
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  final String? comment;
  final List<ProductInCart> items;

  @JsonKey(name: 'full_name')
  final String fullName;
  
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  
  @JsonKey(name: 'delivery_address')
  final String? deliveryAddress;
}