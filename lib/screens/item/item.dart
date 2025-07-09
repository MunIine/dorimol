import 'dart:math';

import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:dorimol/widgets/helpers/rating_block.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    final List<String> vendors = ["Все", "АгроТрейд", "Фермерские продукты", "Зеленая долина", "Овощи от бабушки"];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 50),
          Stack(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/items/item2.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                left: 20,
                top: 259,
                child: RatingBlock(
                  padding: EdgeInsets.only(left: 8).copyWith(right: 10).copyWith(top: 2),
                  useStarTextColor: true,
                  style: AppText.t5,
                  iconSize: 14, 
                  borderRadius: 8,
                )
              ),
              Positioned(
                left: 16,
                top: 4,
                child: ReturnButton()
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("арт. 12345678", style: AppText.t0.copyWith(color: colorTheme.tips)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Томат розовый", style: AppText.h1.copyWith(color: colorTheme.textBlack)),
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
                      DoublePriceBlock(atr: "new"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ChangeItemInCart(
                  cartHeight: 50, 
                  iconSize: 24, 
                  equalWidth: true,
                  weightTextStyle: AppText.h2,
                  priceTextStyle: AppText.t3,
                ),
                SizedBox(height: 15),
                Text("Производитель", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
                SizedBox(height: 15),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    itemCount: vendors.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorTheme.block,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          vendors[index],
                          style: AppText.t2.copyWith(color: colorTheme.textGray),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Отзывы", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(SvgIcons.back),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 65,
                  child: ListView.separated(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10), 
                    itemBuilder: (context, index) => SizedBox(height: 65,width: 275, child: FeedbackCard()), 
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 15),
                Text("Похожие товары", style: AppText.h2.copyWith(color: colorTheme.textBlack)),
                GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 185/285
                  ), 
                  itemBuilder: (context, index) => ItemCard(inCart: [false, true][Random().nextInt(2)], atr: [null, "new", "sale"][Random().nextInt(3)])
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        border: Border.all(color: Color(0xFFE9E9E9), width: 1),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) => Icon(Icons.star_rounded, size: 12, color: colorTheme.yellow)),
                    ),
                    Text("8 июля 2025", style: AppText.t0.copyWith(color: colorTheme.iconGray)),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Помидоры спелые, без повреждений, огурцы хрустящие, зелень пахнет, как с грядки.", 
                    style: AppText.t0.copyWith(color: colorTheme.textBlack, height: 1.1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DoublePriceBlock extends StatelessWidget {
  const DoublePriceBlock({
    super.key, 
    required this.atr,
    this.width = 110, 
    this.borderRadius = 8, 
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
              padding: const EdgeInsets.only(top: 7, bottom: 6),
              child: Center(child: Text("150Р/кг", style: AppText.h1.copyWith(color: textColor))),
            ),
          ),
          SizedBox(height: 2),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius)),
              color: blockColor
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Center(child: Text("109Р/кг", style: AppText.t3.copyWith(color: secondTextColor))),
            ),
          ),
          if (text != null) Text(text, style: AppText.t0.copyWith(color: blockColor))
        ],
      ),
    );
  }
}