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
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text("Кол-во: ${productsInCart.length}", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
            const Spacer(),
            GestureDetector(
              onTap: () => BlocProvider.of<CartBloc>(context).add(ClearCart()),
              child: Container(
                color: Colors.transparent,
                child: Text("Очистить", style: AppText.t3.copyWith(color: colorTheme.iconGray)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.separated(
            shrinkWrap: true, //TODO: FIX SCROLL BUG
            padding: EdgeInsets.zero,
            itemCount: productsInCart.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) => CartProductCard(
              colorTheme: colorTheme,
              product: products[keys[index]]!,
              quantity: productsInCart[keys[index]]!.quantity,
            ),
          ),
        ),
      ],
    );
  }
}
