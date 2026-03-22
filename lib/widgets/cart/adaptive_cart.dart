import 'package:dorimol/models/product.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/widgets/cart/add_product_to_cart.dart';
import 'package:dorimol/widgets/cart/change_product_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdaptiveCart extends StatelessWidget {
  const AdaptiveCart({
    super.key, 
    required this.product,
    required this.cartHeight
  });

  final Product product;
  final double cartHeight;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartBloc, CartState, double>(
      selector: (state) => state.quantityOf(product.id),
      builder: (context, quantity){
        if(quantity == 0) {
          return AddProductToCart(
            cartHeight: cartHeight, 
            product: product,
          );
        }
        return ChangeProductInCart(
          cartHeight: cartHeight,  
          quantity: quantity,
          product: product,
        );
      }
    );
  }
}