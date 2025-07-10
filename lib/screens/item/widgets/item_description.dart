import 'package:flutter/material.dart';

import '../../../theme/export.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
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