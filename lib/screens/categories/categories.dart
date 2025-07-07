import 'package:dorimol/data/constants/category_data.dart';
import 'package:dorimol/screens/categories/widgets/category_card.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/app_search_bar.dart';
import 'package:dorimol/widgets/svg_icons.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(sliders: false),
            SizedBox(height: 20),
            Text("Категории", style: AppText.h1),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => CategoryCard(
                  image: CATEGORIESIMG[index],
                  child: Text(CATEGORIES[index], style: AppText.h2)
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
                itemCount: CATEGORIES.length,
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
          color: colorTheme.seedColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8, bottom: 8),
            child: Row(
              children: [
                Icon(SvgIcons.shoppingCartFilled, color: colorTheme.background, size: 20),
                SizedBox(width: 10),
                Text("1", style: AppText.h2.copyWith(color: colorTheme.background)),
                SizedBox(width: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontFamily: "Rostelecom", color: colorTheme.background),
                    children: [
                      TextSpan(text: "Корзина ", style: AppText.h2),
                      TextSpan(text: "750Р\n", style: AppText.t5),
                      TextSpan(text: "Доставка - самовывоз", style: AppText.t2)
                    ]
                  )
                ),
                Spacer(),
                Icon(SvgIcons.back, color: colorTheme.background,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}