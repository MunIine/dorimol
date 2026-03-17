import 'package:dorimol/data/utils.dart';
import 'package:dorimol/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class InfoBlock extends StatelessWidget {
  const InfoBlock({super.key, required this.colorTheme, required this.user});

  final AppColors colorTheme;
  final User user;

  @override
  Widget build(BuildContext context) {
    final discountTiers = user.discountTiers;

    return SizedBox(
      height: 68,
      child: ListView.separated(
        itemCount: discountTiers.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final color = colorTheme.colorForDiscountTier(index);
          final tier = discountTiers[index];
          final amount = tier.ordersRequired-user.orders_amount;
          final child = Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color.withAlpha(38),
            ),
            child: Center(child: Text("${tier.percent}%", style: AppText.b3.copyWith(color: color))),
          );

          return Row(
            children: user.orders_amount < tier.ordersRequired ? [
              child,
              const SizedBox(width: 10),
              Text("Остал${pluralize(amount, 'ся', "ось", "ось")} ${amount} заказ${pluralize(amount, '', "а", "ов")}", style: AppText.t3.copyWith(color: colorTheme.textGray))
            ] : [
              Expanded(child: child)
            ],
          );
        },
      ),
    );
  }
}
