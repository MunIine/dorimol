import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/cart/change_item_in_cart.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage("lib/assets/images/items/item2.png"),
              fit: BoxFit.cover,
            )
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Томат розовый", style: AppText.b4.copyWith(color: colorTheme.textBlack)),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: colorTheme.block
              ),
              child: Text("150Р/шт", style: AppText.b4.copyWith(color: colorTheme.textGray)),
            )
          ],
        ),
        Spacer(),
        SizedBox(
          width: 120, 
          child: ChangeItemInCart(
            cartHeight: 30,
            borderRadius: 10,
            dividers: false,
            priceTextStyle: AppText.t1.copyWith(color: colorTheme.textBlack, height: 1.1),
            weightTextStyle: AppText.t0.copyWith(color: colorTheme.textGray, height: 1.18),
            iconColor: colorTheme.textBlack,
            color: colorTheme.block,
          )
        )
      ],
    );
  }
}