import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("арт. 12345678", style: AppText.t0.copyWith(color: colorTheme.tips)),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Text("Томат розовый", style: AppText.h1.copyWith(color: colorTheme.textBlack)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(SvgIcons.package, size: 16, color: colorTheme.iconGray),
                    SizedBox(width: 6),
                    Text("Оптовая цена от 50 кг", style: AppText.t2.copyWith(color: colorTheme.iconGray))
                  ],
                )
              ],
            ),
            Spacer(),
            _DoublePriceBlock(atr: "new", width: 110, borderRadius: 8),
          ],
        ),
      ],
    );
  }
}

class _DoublePriceBlock extends StatelessWidget {
  const _DoublePriceBlock({
    required this.atr,
    required this.width, 
    required this.borderRadius, 
  });

  final String? atr;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    Color textColor;
    Color secondTextColor;
    Color blockColor;
    String? text;

    if (atr == "new"){
      textColor = colorTheme.background;
      secondTextColor = colorTheme.background;
      blockColor = colorTheme.blue;
      text = "Новинка";
    }
    else if(atr == "sale"){
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
              child: Center(child: Text("150Р/кг", style: AppText.h1.copyWith(color: textColor))),
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
              child: Center(child: Text("109Р/кг", style: AppText.t3.copyWith(color: secondTextColor))),
            ),
          ),
          if (text != null) Text(text, style: AppText.t0.copyWith(color: blockColor))
        ],
      ),
    );
  }
}