import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class ProductVendors extends StatelessWidget {
  const ProductVendors({
    super.key,
    required this.colorTheme,
    required this.vendors, 
    required this.padding,
  });

  final AppColors colorTheme;
  final EdgeInsets padding;
  final List<String> vendors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text("Производитель", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: padding,
          child: Row(
          children: List.generate(vendors.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: index == vendors.length - 1 ? 0 : 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorTheme.block,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  vendors[index],
                  style: AppText.t2.copyWith(color: colorTheme.textGray, height: 1),
                ),
              ),
            );
          }),
        ),
        )
      ],
    );
  }
}