
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Оформление заказа", style: AppText.h1.copyWith(color: colorTheme.textBlack, height: 1.3)),
          Text("Сохраняется, пока вы его не отмените", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
        ],
      ),
    );
  }
}