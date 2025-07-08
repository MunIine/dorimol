import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.inCart, this.atr});
  final bool inCart;
  final String? atr;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    const double height = 285;
    const double cartHeight = 36;

    return Container(
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
                child: Container(
                  padding: EdgeInsets.only(top: 2).copyWith(right: 8, left: 4),
                  decoration: BoxDecoration(
                    color: colorTheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3)
                    )
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star_rounded, color: colorTheme.yellow, size: 10,),
                      Text("4.5", style: AppText.t09,)
                    ],
                  ),
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 10),
            child: RichText(
              text: TextSpan(
                style: AppText.rostelecom,
                children: [
                  TextSpan(text: "В наличии 5шт\n", style: AppText.t0.copyWith(color: colorTheme.seedColor)),
                  TextSpan(text: "Томат розовый\n", style: AppText.t3.copyWith(color: colorTheme.textBlack)),
                  TextSpan(text: "100г", style: AppText.t2.copyWith(color: colorTheme.tips)),
                ]
              )
            ),
          ),
          ... getPriceBlock(colorTheme, atr),
          Spacer(),
          if (!inCart) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
            child: SizedBox(
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
            ),
          )
          else Padding(
            padding: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getPriceBlock(AppColors colorTheme, String? atr){
    if (atr == null){
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8).copyWith(top: 2, bottom: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFF2F2F2)
            ),
            child: Text("150Р/шт", style: AppText.b4.copyWith(color: colorTheme.textGray)),
          ),
        ),
      ];
    }
    final bool isNew = atr == "new";
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8).copyWith(top: 2, bottom: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isNew ? colorTheme.blue : colorTheme.yellow
          ),
          child: Text("150Р/шт", style: AppText.b4.copyWith(color: isNew ? colorTheme.background : colorTheme.textGray),),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text("Новинка", style: AppText.t0.copyWith(color: isNew ? colorTheme.blue : colorTheme.yellow)),
      )
    ];
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