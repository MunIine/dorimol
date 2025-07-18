import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/cart/adaptive_cart.dart';
import 'package:dorimol/widgets/helpers/rating_block.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.inCart, this.atr});
  final bool inCart;
  final String? atr;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    const double height = 285;
    const double cartHeight = 36;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/product"),
      child: Container(
        height: height,
        width: 185,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorTheme.background
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height*0.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/images/items/item.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Positioned(
                  top: height*0.44-15,
                  left: 8,
                  child: RatingBlock(
                    padding: EdgeInsets.only(top: 2).copyWith(right: 8, left: 4),
                    style: AppText.t09, 
                    iconSize: 10,
                    borderRadius: 3,
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("В наличии 5шт", style: AppText.t0.copyWith(color: colorTheme.seedColor)),
                      Text("арт. 86000106", style: AppText.t09.copyWith(color: colorTheme.iconGray)),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text("Томат розовый", style: AppText.t3.copyWith(color: colorTheme.textBlack, height: 1)),
                  Text("100г", style: AppText.t2.copyWith(color: colorTheme.tips)),
                ]
              )
            ),
            PriceBlock(atr: atr),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
              child: AdaptiveCart(inCart: inCart, cartHeight: cartHeight),
            )
          ],
        ),
      ),
    );
  }
}

class PriceBlock extends StatelessWidget {
  const PriceBlock({super.key, required this.atr});

  final String? atr;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    Color textColor;
    Color blockColor;
    String? text;

    if (atr == "new"){
      textColor = colorTheme.background;
      blockColor = colorTheme.blue;
      text = "Новинка";
    }
    else if(atr == "sale"){
      textColor = colorTheme.textGray;
      blockColor = colorTheme.yellow;
      text = "Скидка";
    }
    else{
      textColor = colorTheme.textGray;
      blockColor = Color(0xFFF2F2F2);
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8).copyWith(top: 2, bottom: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: blockColor
            ),
            child: Text("150Р/шт", style: AppText.b4.copyWith(color: textColor),),
          ),
        ),
        if (text != null) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: AppText.t0.copyWith(color: blockColor)),
        )
      ]
    );
  }
}