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
    required this.similars
  });

  final AppColors colorTheme;
  final EdgeInsets padding;
  final List<Product> similars;

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
              const Spacer(),
              IconButton(
                onPressed: (){},
                icon: const Icon(SvgIcons.back),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 285,
          child: ListView.separated(
            itemCount: similars.length,
            scrollDirection: Axis.horizontal,
            padding: padding,
            separatorBuilder: (context, index) => const SizedBox(width: 10), 
            itemBuilder: (context, index) => SizedBox(
              width: 175.4, 
              child: ProductCard(
                inCart: [false, true][Random().nextInt(2)], 
                product: similars[index]
              )
            )
          ), 
        ),
      ],
    );
  }
}