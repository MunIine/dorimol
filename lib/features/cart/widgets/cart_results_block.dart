import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartResultsBlock extends StatelessWidget {
  const CartResultsBlock({super.key, required this.colorTheme, required this.discount});

  final AppColors colorTheme;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return CartContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Итого", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFFFBFBFB)),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                late final double totalPrice;
                
                if (state is CartWithItems){
                  totalPrice = (state).totalPrice;
                } else {
                  totalPrice = 0.0;
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        Text("Без учета скидки", style: AppText.b3.copyWith(color: colorTheme.iconGray)),
                        const Spacer(),
                        Text("$totalPrice Руб", style: AppText.b3.copyWith(color: colorTheme.iconGray)),
                      ],
                    ),
                    const Divider(color: Color(0xFFF2F2F2)),
                    Row(
                      children: [
                        Text("С учетом скидки", style: AppText.b3.copyWith(color: colorTheme.seedColor)),
                        const Spacer(),
                        Text(
                          "${totalPrice * (1 - discount / 100)} Руб",
                          style: AppText.b3.copyWith(color: colorTheme.seedColor),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
