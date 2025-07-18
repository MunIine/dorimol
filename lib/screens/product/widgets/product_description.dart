import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.colorTheme, 
    required this.description,
  });

  final AppColors colorTheme;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Описание", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
        SizedBox(height: 10),
        Text(
          description, 
          style: AppText.t3.copyWith(color: colorTheme.iconGray)
        ),
      ],
    );
  }
}