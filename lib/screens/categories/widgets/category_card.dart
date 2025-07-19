import 'package:auto_route/auto_route.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(CatalogRoute(category: category)),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(Uri.parse(AppConfig.apiUrl).resolve(category.imageUrl).toString()),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15).copyWith(left: 20),
          child: Text(category.name, style: AppText.h2),
        ),
      ),
    );
  }
}