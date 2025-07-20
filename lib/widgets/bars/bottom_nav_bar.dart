import 'package:dorimol/bloc/cart_bloc/cart_bloc.dart';
import 'package:dorimol/screens/order_form/order_screen.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () =>
            showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => OrderScreen()),
        child: Container(
          height: 60,
          width: double.infinity,
          color: colorTheme.seedColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8, bottom: 8),
            child: BlocBuilder<CartBloc, CartState>(
              bloc: BlocProvider.of<CartBloc>(context),
              builder: (context, state) {
                int quantity = 0;
                double totalPrice = 0.0;
                if (state is CartUpdated){
                  quantity = state.productsInCart.length;
                  totalPrice = state.totalPrice;
                }
                return Row(
                  children: [
                    Icon(SvgIcons.shoppingCartFilled, color: colorTheme.background, size: 20),
                    SizedBox(width: 10),
                    Text(quantity.toString(), style: AppText.h2.copyWith(color: colorTheme.background)),
                    SizedBox(width: 20),
                    RichText(
                      text: TextSpan(
                        style: AppText.rostelecom.copyWith(color: colorTheme.background),
                        children: [
                          TextSpan(text: "Корзина ", style: AppText.h2),
                          TextSpan(text: "$totalPriceР\n", style: AppText.t5),
                          TextSpan(text: "Доставка - самовывоз", style: AppText.t2),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(SvgIcons.back, color: colorTheme.background),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
