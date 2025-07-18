import 'package:dorimol/screens/product/widgets/export.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:dorimol/theme/app_text.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16);
    final List<String> vendors = ["Все", "АгроТрейд", "Фермерские продукты", "Зеленая долина", "Овощи от бабушки"];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ProductImage(rating: 4.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: padding.copyWith(top: 10, bottom: 18),
                child: ProductNamePrice(colorTheme: colorTheme),
              ),
              Padding(
                padding: padding,
                child: ChangeProductInCart(
                  cartHeight: 50, 
                  iconSize: 24, 
                  equalWidth: true,
                  weightTextStyle: AppText.h2,
                  priceTextStyle: AppText.t3,
                ),
              ),
              Divider(height: 30),
              Padding(
                padding: padding,
                child: ProductDescription(colorTheme: colorTheme),
              ),
              Divider(height: 30),
              ProductVendors(colorTheme: colorTheme, padding: padding, vendors: vendors),
              Divider(height: 30),
              ProductFeedback(colorTheme: colorTheme, padding: padding),
              Divider(height: 30),
              ProductSimilar(colorTheme: colorTheme, padding: padding),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}