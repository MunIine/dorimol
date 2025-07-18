import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class AddProductToCart extends StatelessWidget {
  const AddProductToCart({
    super.key,
    required this.cartHeight,
  });

  final double cartHeight;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      width: double.infinity,
      height: cartHeight,
      child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
          backgroundColor: colorTheme.seedColor,
          padding: EdgeInsets.symmetric(vertical: 9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 7,
          children: [
            Icon(SvgIcons.shoppingCart, size: 14),
            Text("В корзину", style: AppText.t2.copyWith(color: colorTheme.background)),
          ],
        ),
      ),
    );
  }
}