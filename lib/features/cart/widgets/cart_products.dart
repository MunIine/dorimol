import 'package:dorimol/models/product.dart';
import 'package:dorimol/models/product_in_cart.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/features/cart/widgets/cart_product_card.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key, required this.colorTheme, required this.keys, required this.products, required this.productsInCart});

  final AppColors colorTheme;
  final List<String> keys;
  final Map<String, Product> products;
  final Map<String, ProductInCart> productsInCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Кол-во: ${productsInCart.length}", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
            const Spacer(),
            GestureDetector(
              onTap: () => BlocProvider.of<CartBloc>(context).add(ClearCart()),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text("Удалить", style: AppText.t3.copyWith(color: colorTheme.iconGray)),
                    const SizedBox(width: 8),
                    Icon(SvgIcons.trash, color: colorTheme.iconGray, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productsInCart.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) => CartProductCard(
            colorTheme: colorTheme,
            product: products[keys[index]]!,
            quantity: productsInCart[keys[index]]!.quantity,
          ),
        ),
      ],
    );
  }
}
