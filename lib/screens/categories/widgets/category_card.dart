import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.id, required this.child, this.image});

  final int id;
  final Widget child;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/catalog", arguments: id),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: image == null ? colorTheme.block : null,
          image: image == null ? null : DecorationImage(
            image: NetworkImage(Uri.parse(AppConfig.apiUrl).resolve(image!).toString()),
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