import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.colorTheme, 
    required this.onTap,
    required this.price, 
  });

  final AppColors colorTheme;
  final VoidCallback onTap;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorTheme.seedColor
          ),
          child: Row(
            children: [
              Spacer(),
              Text("$priceруб.", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
              SizedBox(width: 16),
              Text("|", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
              SizedBox(width: 16),
              Text("Заказать", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
              Spacer()
            ],
          )
        ),
      ),
    );
  }
}