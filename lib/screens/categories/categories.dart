import 'package:dorimol/data/constants/category_data.dart';
import 'package:dorimol/screens/categories/widgets/category_card.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(sliders: false),
            SizedBox(height: 16),
            Text("Категории", style: AppText.h1),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) => CategoryCard(
                  image: CATEGORIESIMG[index],
                  child: Text(CATEGORIES[index], style: AppText.h2)
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
                itemCount: CATEGORIES.length,
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}