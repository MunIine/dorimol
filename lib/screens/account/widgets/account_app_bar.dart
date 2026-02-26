import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.grey[300]),
          ),
          Text("Алексей Груменко", style: AppText.h1.copyWith(color: colorTheme.textGray)),
          Text("Оформлено заказов: 0", style: AppText.b1.copyWith(color: colorTheme.tips)),
        ],
      ),
    );
  }
}
