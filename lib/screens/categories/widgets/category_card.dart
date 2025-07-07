import 'package:dorimol/screens/catalog/catalog.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.child, this.image});

  final Widget child;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CatalogScreen())),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: image == null ? colorTheme.block : null,
          image: image == null ? null : DecorationImage(
            image: AssetImage(image!),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15).copyWith(left: 20),
          child: child,
        ),
      ),
    );
  }
}