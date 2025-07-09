
import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class ChangeItemInCart extends StatelessWidget {
  const ChangeItemInCart({
    super.key,
    required this.cartHeight,
  });

  final double cartHeight;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartButton(icon: SvgIcons.minus, cartHeight: cartHeight),
          SizedBox(width: 1),
          Expanded(
            child: Container(
              width: double.infinity,
              height: cartHeight,
              color: colorTheme.seedColor,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 4),
              child: RichText(
                text: TextSpan(
                  style: AppText.rostelecom,
                  children: [
                    TextSpan(text: "0.54 кг\n", style: AppText.t1.copyWith(color: colorTheme.background)),
                    TextSpan(text: "162.54Р", style: AppText.t0.copyWith(color: colorTheme.accint))
                  ]
                )
              ),
            ),
          ),
          SizedBox(width: 1),
          CartButton(icon: SvgIcons.plus, cartHeight: cartHeight),
        ],
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.icon,
    required this.cartHeight, 
  });

  final double cartHeight;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      height: cartHeight,
      child: IconButton(
        onPressed: (){},
        padding: EdgeInsets.symmetric(vertical: 7).copyWith(left: 9, right: 9),
        icon: Icon(
          icon,
          color: colorTheme.background,
          size: 16,
        ),
        style: IconButton.styleFrom(
          backgroundColor: colorTheme.seedColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero)
        ),
      ),
    );
  }
}