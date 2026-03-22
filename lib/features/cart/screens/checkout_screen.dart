import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/cart/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.colorTheme});

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Оформление заказа", style: AppText.h1.copyWith(color: colorTheme.textBlack, height: 1.3)),
        const SizedBox(height: 16),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CartDeliveryBlock(colorTheme: colorTheme, controller: TextEditingController()),
                const SizedBox(height: 16),
                CartCommentBlock(colorTheme: colorTheme, controller: TextEditingController()),
                const SizedBox(height: 16),
                CartDiscountBlock(colorTheme: colorTheme),
                const SizedBox(height: 16),
                CartResultsBlock(colorTheme: colorTheme),
              ],
            ),
          ),
        )
      ],
    );
  }
}