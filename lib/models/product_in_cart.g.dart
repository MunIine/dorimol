// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_in_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInCart _$ProductInCartFromJson(Map<String, dynamic> json) =>
    ProductInCart(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductInCartToJson(ProductInCart instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
