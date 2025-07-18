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
        SizedBox(height: 15),
        SizedBox(
          height: 35,
          child: ListView.separated(
            itemCount: vendors.length,
            padding: padding,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorTheme.block,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  vendors[index],
                  style: AppText.t2.copyWith(color: colorTheme.textGray),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}