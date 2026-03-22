import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class NoItemsInCart extends StatelessWidget {
  const NoItemsInCart({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text("Корзина пуста", style: AppText.h1.copyWith(color: colorTheme.textBlack)),
        const Spacer(),
        const Center(
          child: SizedBox(
            width: 300,
            child: Image(image: AssetImage("lib/assets/errors/no_items.png"))
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
