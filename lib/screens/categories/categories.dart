import 'package:dorimol/data/constants/category_data.dart';
import 'package:dorimol/screens/categories/widgets/category_card.dart';
import 'package:dorimol/theme/theme.dart';
import 'package:dorimol/widgets/app_search_bar.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(sliders: true),
            SizedBox(height: 20),
            Text("Категории", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => CategoryCard(image: CATEGORIESIMG[index],child: Text(CATEGORIES[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
                itemCount: 4,
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Container(
          height: 50,
          width: double.infinity,
          color: seedColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8, bottom: 8),
            child: Row(
              children: [
                Icon(SvgIcons.shoppingCartFilled, color: backgroundColor, size: 20),
                SizedBox(width: 10),
                Text("1", style: TextStyle(color: backgroundColor, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontFamily: "Rostelecom", color: backgroundColor),
                    children: [
                      TextSpan(text: "Корзина 750Р\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      TextSpan(text: "Доставка - самовывоз")
                    ]
                  )
                ),
                Spacer(),
                Icon(SvgIcons.back, color: backgroundColor,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}