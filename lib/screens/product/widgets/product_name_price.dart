import 'package:dorimol/api/models/product_details.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({
    super.key,
    required this.colorTheme, 
    required this.product,
  });

  final AppColors colorTheme;
  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("арт. ${product.id}", style: AppText.t0.copyWith(color: colorTheme.tips)),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Text(product.name, style: AppText.h1.copyWith(color: colorTheme.textBlack)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(SvgIcons.package, size: 16, color: colorTheme.iconGray),
                    SizedBox(width: 6),
                    Text("Оптовая цена от ${product.wholesaleStartQuantity} ${product.unit}", style: AppText.t2.copyWith(color: colorTheme.iconGray))
                  ],
                )
              ],
            ),
            Spacer(),
            _DoublePriceBlock(
              status: product.status, 
              price: product.price, 
              wholesalePrice: product.wholesalePrice, 
              unit: product.unit,
              width: 110, 
              borderRadius: 8, 
            ),
          ],
        ),
      ],
    );
  }
}

class _DoublePriceBlock extends StatelessWidget {
  const _DoublePriceBlock({
    required this.status,
    required this.width, 
    required this.borderRadius, 
    required this.price, 
    required this.wholesalePrice, 
    required this.unit, 
  });

  final String? status;
  final double price;
  final double wholesalePrice;
  final String unit;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    Color textColor;
    Color secondTextColor;
    Color blockColor;
    String? text;

    if (status == "new"){
      textColor = colorTheme.background;
      secondTextColor = colorTheme.background;
      blockColor = colorTheme.blue;
      text = "Новинка";
    }
    else if(status == "sale"){
      textColor = colorTheme.background;
      secondTextColor = colorTheme.background;
      blockColor = colorTheme.yellow;
      text = "Скидка";
    }
    else{
      textColor = colorTheme.textGray;
      secondTextColor = colorTheme.iconGray;
      blockColor = colorTheme.block;
    }

    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)),
              color: blockColor
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Center(child: Text("$priceР/$unit", style: AppText.h1.copyWith(color: textColor))),
            ),
          ),
          SizedBox(height: 1),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius)),
              color: blockColor
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Center(child: Text("$wholesalePriceР/$unit", style: AppText.t3.copyWith(color: secondTextColor))),
            ),
          ),
          if (text != null) Text(text, style: AppText.t0.copyWith(color: blockColor))
        ],
      ),
    );
  }
}