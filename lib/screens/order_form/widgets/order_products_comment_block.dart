import 'package:dorimol/bloc/cart_bloc/cart_bloc.dart';
import 'package:dorimol/screens/order_form/widgets/content_block.dart';
import 'package:dorimol/screens/order_form/widgets/order_products.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProductsCommentBlock extends StatelessWidget {
  const OrderProductsCommentBlock({super.key, required this.colorTheme, required this.controller});

  final AppColors colorTheme;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OrderContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CartBloc, CartState>(
            bloc: BlocProvider.of<CartBloc>(context),
            builder: (context, state) {
              if (state is CartUpdated) {
                final List<String> keys = state.products.keys.toList();
                if (keys.isNotEmpty) {
                  return OrderProducts(colorTheme: colorTheme, keys: keys, products: state.products, productsInCart: state.productsInCart);
                }
                return Center(child: Text("Товаров нет"));
              }
              return Center(child: Text("Товаров нет"));
            },
          ),
          SizedBox(height: 40),
          Text("Комментарий сборщику", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          SizedBox(height: 10),
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
