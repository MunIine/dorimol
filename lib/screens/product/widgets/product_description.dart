import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Описание", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
        SizedBox(height: 10),
        Text(
          "Помидор (или томат) — это однолетнее травянистое растение из семейства паслёновых.", 
          style: AppText.t3.copyWith(color: colorTheme.iconGray)
        ),
      ],
    );
  }
}