
import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class ChangeItemInCart extends StatelessWidget {
  const ChangeItemInCart({
    super.key,
    required this.cartHeight, 
    this.equalWidth = false,
    this.iconSize = 16, 
    this.weightTextStyle = AppText.t1, 
    this.priceTextStyle = AppText.t0, 
  });

  final double cartHeight;
  final double iconSize;
  final bool equalWidth;
  final TextStyle weightTextStyle;
  final TextStyle priceTextStyle;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth/3;
          
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CartButton(icon: SvgIcons.minus, iconSize: iconSize, cartHeight: cartHeight, width: equalWidth ? width : null,),
              SizedBox(width: 1),
              Expanded(
                child: Container(
                  height: cartHeight,
                  color: colorTheme.seedColor,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: RichText(
                    text: TextSpan(
                      style: AppText.rostelecom,
                      children: [
                        TextSpan(text: "0.54 кг\n", style: weightTextStyle.copyWith(color: colorTheme.background)),
                        TextSpan(text: "162.54Р", style: priceTextStyle.copyWith(color: colorTheme.accint))
                      ]
                    )
                  ),
                ),
              ),
              SizedBox(width: 1),
              CartButton(icon: SvgIcons.plus, iconSize: iconSize, cartHeight: cartHeight, width: equalWidth ? width : null),
            ],
          );
        }
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.icon,
    required this.iconSize, 
    required this.cartHeight, 
    this.width, 
  });

  final double cartHeight;
  final double iconSize;
  final double? width;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      height: cartHeight,
      width: width,
      child: IconButton(
        onPressed: (){},
        padding: EdgeInsets.symmetric(horizontal: 9),
        icon: Icon(
          icon,
          color: colorTheme.background,
          size: iconSize,
        ),
        style: IconButton.styleFrom(
          backgroundColor: colorTheme.seedColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero)
        ),
      ),
    );
  }
}