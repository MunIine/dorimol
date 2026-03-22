import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/features/cart/widgets/cart_products.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/errors/no_items_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (context, state) {
        if (state is CartUpdated) {
          final List<String> keys = state.products.keys.toList();
          if (keys.isNotEmpty) {
            return Column(
              children: [
                Text("Корзина", style: AppText.h1.copyWith(color: colorTheme.textBlack)),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topCenter,
                  child: CartContentBlock(
                    child: CartProducts(
                      colorTheme: colorTheme,
                      keys: keys,
                      products: state.products,
                      productsInCart: state.productsInCart
                    ),
                  ),
                ),
              ],
            );
          }
          return NoItemsInCart(colorTheme: colorTheme);
        }
        if (state is CartInitial) return NoItemsInCart(colorTheme: colorTheme);
        return const Center(child: Text("Товаров нет"));
      },
    );
  }
}