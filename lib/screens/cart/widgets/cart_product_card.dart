import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/cart/change_product_in_cart.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.colorTheme, required this.product, required this.quantity});

  final AppColors colorTheme;
  final double quantity;
  final Product product;

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
              image: NetworkImage(Uri.parse(AppConfig.apiUrl).resolve(product.imageUrl).toString()), 
              fit: BoxFit.cover
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(product.name, style: AppText.b4.copyWith(color: colorTheme.textBlack)),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: colorTheme.block),
              child: Text("${product.currentPrice(quantity)}Р/${product.unit}", style: AppText.b4.copyWith(color: colorTheme.textGray)),
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          width: 120,
          child: ChangeProductInCart(
            cartHeight: 30,
            borderRadius: 10,
            dividers: false,
            priceTextStyle: AppText.t1.copyWith(color: colorTheme.textBlack, height: 1.1),
            weightTextStyle: AppText.t0.copyWith(color: colorTheme.textGray, height: 1.18),
            iconColor: colorTheme.textBlack,
            color: colorTheme.block,
            product: product,
            quantity: quantity,
          ),
        ),
      ],
    );
  }
}
