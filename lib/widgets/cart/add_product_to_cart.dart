import 'package:dorimol/models/product.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductToCart extends StatelessWidget {
  const AddProductToCart({
    super.key,
    required this.product, 
    required this.cartHeight, 
  });

  final Product product;
  final double cartHeight;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      width: double.infinity,
      height: cartHeight,
      child: TextButton(
        onPressed: () {
          if (product.step <= product.stock) {
            BlocProvider.of<CartBloc>(context).add(UpdateCartItems(
              product: product,
              step: product.step
            ));
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: colorTheme.seedColor,
          padding: const EdgeInsets.symmetric(vertical: 9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 7,
          children: [
            const Icon(SvgIcons.shoppingCart, size: 14),
            Text("В корзину", style: AppText.t2.copyWith(color: colorTheme.background)),
          ],
        ),
      ),
    );
  }
}