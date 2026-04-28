import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class CartDiscountBlock extends StatelessWidget {
  const CartDiscountBlock({
    super.key,
    required this.colorTheme,
    required this.discount
  });

  final AppColors colorTheme;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return CartContentBlock(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorTheme.seedColor
        ),
        child: Center(child: Text("Скидка $discount%", style: AppText.b3.copyWith(color: Colors.white))),
      )
    );
  }
}