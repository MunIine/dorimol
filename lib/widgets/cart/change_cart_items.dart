import 'package:dorimol/models/product.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCartItems extends StatelessWidget {
  const ChangeCartItems({
    super.key,
    required this.cartHeight, 
    required this.product, 
    required this.quantity, 

    this.equalWidth = false,
    this.dividers = true,
    this.iconSize = 16, 
    this.borderRadius = 12, 
    this.weightTextStyle, 
    this.priceTextStyle,
    this.iconColor,
    this.color,
  });

  final Product product;
  final double quantity;
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
                onTap: (){
                  if (quantity-product.step >= 0) {
                    BlocProvider.of<CartBloc>(context).add(UpdateCartItems(
                      product: product,
                      step: -product.step
                    ));
                  }
                }
              ),
              if (dividers) const SizedBox(width: 1),
              Expanded(
                child: Container(
                  height: cartHeight,
                  color: color ?? colorTheme.seedColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: RichText(
                    text: TextSpan(
                      style: AppText.rostelecom,
                      children: [
                        TextSpan(text: "$quantity ${product.unit}\n", style: priceTextStyle ?? AppText.t1.copyWith(color: colorTheme.background)),
                        TextSpan(text: "${product.currentPrice(quantity)*quantity}Р", style: weightTextStyle ?? AppText.t0.copyWith(color: colorTheme.accint))
                      ]
                    )
                  ),
                ),
              ),
              if (dividers) const SizedBox(width: 1),
              _CartButton(
                icon: SvgIcons.plus, 
                iconSize: iconSize, 
                cartHeight: cartHeight, 
                width: equalWidth ? width : null,
                colorTheme: colorTheme,
                iconColor: iconColor,
                color: color,
                onTap: () {
                  if (quantity + product.step <= product.stock) {
                    BlocProvider.of<CartBloc>(context).add(UpdateCartItems(
                      product: product,
                      step: product.step
                    ));
                  }
                }
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
    this.width, required this.onTap
  });

  final AppColors colorTheme;
  final double cartHeight;
  final double iconSize;
  final IconData icon;
  final Color? iconColor;
  final Color? color;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cartHeight,
      width: width,
      child: IconButton(
        onPressed: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 9),
        icon: Icon(
          icon,
          color: iconColor ?? colorTheme.background,
          size: iconSize,
        ),
        style: IconButton.styleFrom(
          backgroundColor: color ?? colorTheme.seedColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero)
        ),
      ),
    );
  }
}