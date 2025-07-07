import 'package:dorimol/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.child, this.image});

  final Widget child;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: image == null ? blockColor : null,
        image: image == null ? null : DecorationImage(
          image: AssetImage(image!),
          fit: BoxFit.cover
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}