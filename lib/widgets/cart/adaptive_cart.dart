import 'package:dorimol/models/product.dart';
import 'package:dorimol/screens/cart/bloc/cart_bloc.dart';
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
    return BlocSelector(
      bloc: BlocProvider.of<CartBloc>(context),
      selector: (state) {
        if (state is CartUpdated && state.productsInCart.containsKey(product.id)) {
          return state.productsInCart[product.id]!.quantity;
        }
        return 0.0;
      },
      builder: (context, quantity){
        if(quantity == 0) {
          return AddProductToCart(
            cartHeight: cartHeight, 
            quantity: quantity,
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