import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/features/cart/widgets/cart_products.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/errors/no_items_in_cart.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsCommentBlock extends StatelessWidget {
  const CartProductsCommentBlock({super.key, required this.colorTheme, required this.controller});

  final AppColors colorTheme;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CartContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CartBloc, CartState>(
            bloc: BlocProvider.of<CartBloc>(context),
            builder: (context, state) {
              if (state is CartUpdated) {
                final List<String> keys = state.products.keys.toList();
                if (keys.isNotEmpty) {
                  return CartProducts(colorTheme: colorTheme, keys: keys, products: state.products, productsInCart: state.productsInCart);
                }
                return NoItemsInCart(colorTheme: colorTheme);
              }
              if (state is CartInitial) return NoItemsInCart(colorTheme: colorTheme);
              return const Center(child: Text("Товаров нет"));
            },
          ),
          const SizedBox(height: 40),
          Text("Комментарий сборщику", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          const SizedBox(height: 10),
          BlockTextField(
            controller: controller,
            colorTheme: colorTheme,
            form: true,
            hint: "Напишите, что важно учесть при сборке",
            onSubmitted: (value) {},
          ),
        ],
      ),
    );
  }
}
