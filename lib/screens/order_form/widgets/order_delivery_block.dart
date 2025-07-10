import 'package:dorimol/screens/order_form/widgets/content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';

class OrderDeliveryBlock extends StatelessWidget {
  const OrderDeliveryBlock({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return OrderContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Доставка", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          SizedBox(height: 10),
          BlockTextField(colorTheme: colorTheme, form: true, enabled: false, hint: "СКОРО!!!"),
        ],
      ),
    );
  }
}