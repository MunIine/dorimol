import 'package:auto_route/auto_route.dart';
import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/cart/adaptive_cart.dart';
import 'package:dorimol/widgets/helpers/rating_block.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.inCart, required this.product});

  final Product product;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    const double height = 285;
    const double cartHeight = 36;

    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(ProductRoute(id: product.id)),
      child: Container(
        height: height,
        width: 185,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorTheme.background
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height*0.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(Uri.parse(AppConfig.apiUrl).resolve(product.imageUrl).toString()),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                if (product.rating != null) Positioned(
                  top: height*0.44-15,
                  left: 8,
                  child: RatingBlock(
                    rating: product.rating!,
                    padding: EdgeInsets.only(top: 2).copyWith(right: 8, left: 4),
                    style: AppText.t09, 
                    iconSize: 10,
                    borderRadius: 3,
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getStock(colorTheme, product.stock),
                      Text("арт. ${product.id}", style: AppText.t09.copyWith(color: colorTheme.iconGray)),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(product.name, style: AppText.t3.copyWith(color: colorTheme.textBlack, height: 1)),
                  SizedBox(height: 8),
                ]
              )
            ),
            PriceBlock(status: product.status, price: product.price, unit: product.unit),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
              child: AdaptiveCart(product: product, cartHeight: cartHeight),
            )
          ],
        ),
      ),
    );
  }

  Text getStock(AppColors colorTheme, int stock) {
    if (product.stock > 10) {
      return Text("В наличии", style: AppText.t0.copyWith(color: colorTheme.seedColor));
    }
    if (product.stock < 10 && product.stock > 0) {
      return Text("В наличии ${product.stock}${product.unit}", style: AppText.t0.copyWith(color: colorTheme.seedColor));
    }
    return Text("Нет в наличии", style: AppText.t1.copyWith(color: colorTheme.textGray));
  }
}

class PriceBlock extends StatelessWidget {
  const PriceBlock({super.key, required this.price, required this.unit, required this.status});

  final double price;
  final String unit;
  final String status;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    Color textColor;
    Color blockColor;
    String? text;

    if (status == "new"){
      textColor = colorTheme.background;
      blockColor = colorTheme.blue;
      text = "Новинка";
    }
    else if(status == "sale"){
      textColor = colorTheme.textGray;
      blockColor = colorTheme.yellow;
      text = "Скидка";
    }
    else{
      textColor = colorTheme.textGray;
      blockColor = Color(0xFFF2F2F2);
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8).copyWith(top: 2, bottom: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: blockColor
            ),
            child: Text("$priceР/$unit", style: AppText.b4.copyWith(color: textColor)),
          ),
        ),
        if (text != null) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: AppText.t0.copyWith(color: blockColor)),
        )
      ]
    );
  }
}