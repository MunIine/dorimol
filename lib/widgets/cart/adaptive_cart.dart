import 'package:dorimol/widgets/cart/add_product_to_cart.dart';
import 'package:dorimol/widgets/cart/change_product_in_cart.dart';
import 'package:flutter/material.dart';

class AdaptiveCart extends StatelessWidget {
  const AdaptiveCart({super.key, required this.inCart, required this.cartHeight});

  final bool inCart;
  final double cartHeight;

  @override
  Widget build(BuildContext context) {
    if(inCart) return AddProductToCart(cartHeight: cartHeight);
    return ChangeProductInCart(cartHeight: cartHeight);
  }
}