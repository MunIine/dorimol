// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_in_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInCart _$ProductInCartFromJson(Map<String, dynamic> json) =>
    ProductInCart(
      productId: json['product_id'] as String,
      itemPrice: (json['item_price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductInCartToJson(ProductInCart instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'product_id': instance.productId,
      'item_price': instance.itemPrice,
    };
