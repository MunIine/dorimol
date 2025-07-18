import 'dart:math';

import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductSimilar extends StatelessWidget {
  const ProductSimilar({
    super.key,
    required this.colorTheme, 
    required this.padding,
  });

  final AppColors colorTheme;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Row(
            children: [
              Text("Похожие товары", style: AppText.h2.copyWith(color: colorTheme.textBlack)),
              Spacer(),
              IconButton(
                onPressed: (){},
                icon: Icon(SvgIcons.back),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 285,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: padding,
            separatorBuilder: (context, index) => SizedBox(width: 10), 
            itemBuilder: (context, index) => SizedBox(width: 175.4, child: ProductCard(inCart: [false, true][Random().nextInt(2)], product: Product(
              id: "10193131",
              categoryId: 1,
              name: "Товар ${index + 1}",
              imageUrl: "https://via.placeholder.com/150",
              price: Random().nextDouble() * 100,
              unit: "шт",
              stock: Random().nextInt(20),
              rating: Random().nextDouble() * 5,
              orderCount: 1,
              status: "new"
            ),))
          ), 
        ),
      ],
    );
  }
}