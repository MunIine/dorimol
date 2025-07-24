import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class NoItemsInCart extends StatelessWidget {
  const NoItemsInCart({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Корзина пуста", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
        SizedBox(height: 25),
        Center(
          child: SizedBox(
            width: 120,
            child: Image(image: AssetImage("lib/assets/errors/no_items.png"))
          ),
        ),
      ],
    );
  }
}
