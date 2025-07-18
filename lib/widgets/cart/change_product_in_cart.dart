import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ChangeProductInCart extends StatelessWidget {
  const ChangeProductInCart({
    super.key,
    required this.cartHeight, 
    this.equalWidth = false,
    this.dividers = true,
    this.iconSize = 16, 
    this.borderRadius = 12, 
    this.weightTextStyle, 
    this.priceTextStyle,
    this.iconColor,
    this.color,
  });

  final double cartHeight;
  final double iconSize;
  final double borderRadius;
  final bool equalWidth;
  final bool dividers;
  final TextStyle? weightTextStyle;
  final TextStyle? priceTextStyle;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth/3;
          
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CartButton(
                icon: SvgIcons.minus, 
                iconSize: iconSize, 
                cartHeight: cartHeight, 
                width: equalWidth ? width : null, 
                colorTheme: colorTheme,
                iconColor: iconColor,
                color: color,
              ),
              if (dividers) SizedBox(width: 1),
              Expanded(
                child: Container(
                  height: cartHeight,
                  color: color ?? colorTheme.seedColor,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: RichText(
                    text: TextSpan(
                      style: AppText.rostelecom,
                      children: [
                        TextSpan(text: "0.54 кг\n", style: priceTextStyle ?? AppText.t1.copyWith(color: colorTheme.background)),
                        TextSpan(text: "162.54Р", style: weightTextStyle ?? AppText.t0.copyWith(color: colorTheme.accint))
                      ]
                    )
                  ),
                ),
              ),
              if (dividers) SizedBox(width: 1),
              _CartButton(
                icon: SvgIcons.plus, 
                iconSize: iconSize, 
                cartHeight: cartHeight, 
                width: equalWidth ? width : null,
                colorTheme: colorTheme,
                iconColor: iconColor,
                color: color,
              ),
            ],
          );
        }
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton({
    required this.colorTheme, 
    required this.icon,
    required this.iconSize, 
    required this.cartHeight, 
    this.iconColor,
    this.color,
    this.width
  });

  final AppColors colorTheme;
  final double cartHeight;
  final double iconSize;
  final IconData icon;
  final Color? iconColor;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cartHeight,
      width: width,
      child: IconButton(
        onPressed: (){},
        padding: EdgeInsets.symmetric(horizontal: 9),
        icon: Icon(
          icon,
          color: iconColor ?? colorTheme.background,
          size: iconSize,
        ),
        style: IconButton.styleFrom(
          backgroundColor: color ?? colorTheme.seedColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero)
        ),
      ),
    );
  }
}