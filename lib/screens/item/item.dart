import 'dart:math';

import 'package:dorimol/screens/catalog/catalog.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:dorimol/widgets/helpers/rating_block.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
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
          Stack(
            children: [
              Container(
                height: 280+50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/items/item2.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                left: 20,
                top: 259+50,
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
                top: 4+36,
                child: ReturnButton()
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
                child: Text("арт. 12345678", style: AppText.t0.copyWith(color: colorTheme.tips)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
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
                    DoublePriceBlock(atr: "new"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ChangeItemInCart(
                  cartHeight: 50, 
                  iconSize: 24, 
                  equalWidth: true,
                  weightTextStyle: AppText.h2,
                  priceTextStyle: AppText.t3,
                ),
              ),
              Divider(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Описание", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Помидор (или томат) — это однолетнее травянистое растение из семейства паслёновых.", 
                  style: AppText.t3.copyWith(color: colorTheme.iconGray)
                ),
              ),
              Divider(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Производитель", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 35,
                child: ListView.separated(
                  itemCount: vendors.length,
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
              Divider(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
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
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 65,
                child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) => SizedBox(width: 10), 
                  itemBuilder: (context, index) => SizedBox(height: 65,width: 275, child: FeedbackCard()), 
                ),
              ),
              Divider(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text("Похожие товары", style: AppText.h2.copyWith(color: colorTheme.textBlack)),
                    Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CatalogScreen())),
                      icon: Icon(SvgIcons.back),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 285,
                child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) => SizedBox(width: 10), 
                  itemBuilder: (context, index) => SizedBox(width: 175.4, child: ItemCard(inCart: [false, true][Random().nextInt(2)], atr: [null, "new", "sale"][Random().nextInt(3)]))), 
                ),
            ],
          ),
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
        color: colorTheme.background,
        border: Border.all(color: Color(0xFFDEDEDE), width: 0.5),
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