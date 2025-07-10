import 'package:dorimol/screens/order_form/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderAppBar(colorTheme: colorTheme),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  OrderNameNumberBlock(colorTheme: colorTheme),
                  SizedBox(height: 16),
                  OrderDeliveryBlock(colorTheme: colorTheme),
                  SizedBox(height: 16),
                  OrderItemsCommentBlock(colorTheme: colorTheme),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: OrderButton(colorTheme: colorTheme),
    );
  }
}