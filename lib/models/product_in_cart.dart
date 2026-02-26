// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'product_in_cart.g.dart';

@JsonSerializable()
class ProductInCart {
  ProductInCart({required this.productId, required this.itemPrice, required this.quantity});

  final double quantity;

  @JsonKey(name: 'product_id')
  final String productId;

  @JsonKey(name: 'item_price')
  final double itemPrice;

  factory ProductInCart.fromJson(Map<String, dynamic> json) => _$ProductInCartFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInCartToJson(this);
}