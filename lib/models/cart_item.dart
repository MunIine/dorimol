import 'package:dorimol/models/order_item_add.dart';
import 'package:dorimol/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  CartItem({required this.product, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  final Product product;
  final double quantity;

  CartItem copyWith({double? quantity}) => CartItem(
    product: product,
    quantity: quantity ?? this.quantity,
  );

  OrderItemAdd toOrderItemAdd() => OrderItemAdd(
    productId: product.id,
    quantity: quantity,
  );
}