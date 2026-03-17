import 'package:dorimol/data/utils.dart';
import 'package:dorimol/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class CurrentBlock extends StatelessWidget {
  const CurrentBlock({super.key, required this.colorTheme, required this.user});

  final AppColors colorTheme;
  final User user;

  @override
  Widget build(BuildContext context) {
    final discountTiers = user.discountTiers;
    final currentDiscount = user.current_discount;
    final currentIndex = discountTiers.indexWhere((tier) => tier.percent == currentDiscount);
    final nextDiscount = currentIndex != discountTiers.length-1 ? discountTiers[currentIndex+1] : null;
    final discountColor = colorTheme.colorForDiscountTier(nextDiscount != null ? currentIndex+1 : currentIndex);

    final amount = (nextDiscount?.ordersRequired ?? 0) - user.orders_amount;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Текущая скидка ${currentDiscount}%", style: AppText.b6.copyWith(color: colorTheme.textGray)),
        const SizedBox(height: 12),
        if (nextDiscount != null) Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Остал${pluralize(amount, 'ся', "ось", "ось")} ${amount} заказ${pluralize(amount, '', "а", "ов")}",
              style: AppText.t2.copyWith(color: colorTheme.textGray)
            ),
            Text("Скидка ${nextDiscount.percent}%", style: AppText.t2.copyWith(color: discountColor))
          ],
        ),
        if (nextDiscount == null) Center(
          child: Text(
            "Поздравляем! У вас максимальная скидка",
            style: AppText.t2.copyWith(color: discountColor)
          ),
        ),
        Stack(
          children: [
            SizedBox(
              height: 16,
              child: LinearProgressIndicator(
                value: nextDiscount != null ? user.orders_amount / nextDiscount.ordersRequired : 1,
                borderRadius: BorderRadius.circular(16),
                color: discountColor,
                backgroundColor: discountColor.withAlpha(38),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
