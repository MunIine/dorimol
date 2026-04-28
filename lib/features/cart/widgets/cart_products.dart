import 'package:dorimol/models/cart_item.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/features/cart/widgets/cart_product_card.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key, required this.colorTheme, required this.cartItems});

  final AppColors colorTheme;
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text("Кол-во: ${cartItems.length}", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) => CartProductCard(
              colorTheme: colorTheme,
              product: cartItems[index].product,
              quantity: cartItems[index].quantity,
            ),
          ),
        ),
      ],
    );
  }
}
