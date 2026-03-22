import 'package:dorimol/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_in_cart.g.dart';

@JsonSerializable()
class ProductInCart {
  ProductInCart({required this.product, required this.quantity});

  factory ProductInCart.fromJson(Map<String, dynamic> json) => _$ProductInCartFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInCartToJson(this);

  final Product product;
  final double quantity;

  ProductInCart copyWith({double? quantity}) => ProductInCart(
    product: product,
    quantity: quantity ?? this.quantity,
  );
}