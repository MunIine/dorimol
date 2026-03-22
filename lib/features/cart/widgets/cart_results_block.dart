import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class CartResultsBlock extends StatelessWidget {
  const CartResultsBlock({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return CartContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Итого", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFFBFBFB)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Без учета скидки", style: AppText.b3.copyWith(color: colorTheme.iconGray)),
                    const Spacer(),
                    Text("12234 Руб", style: AppText.b3.copyWith(color: colorTheme.iconGray)),
                  ],
                ),
                const Divider(
                  color: Color(0xFFF2F2F2),
                ),
                Row(
                  children: [
                    Text("С учетом скидки", style: AppText.b3.copyWith(color: colorTheme.seedColor)),
                    const Spacer(),
                    Text("9234 Руб", style: AppText.b3.copyWith(color: colorTheme.seedColor)),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}