import 'package:dorimol/screens/order_form/widgets/content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';

class OrderNameNumberBlock extends StatelessWidget {
  const OrderNameNumberBlock({
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
          Text("ФИО", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          SizedBox(height: 10),
          BlockTextField(
            colorTheme: colorTheme,
            form: true,
            hint: "Укажите ваше ФИО",
            onSubmitted: (value){},
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.done_rounded, color: colorTheme.seedColor, size: 16),
            )
          ),
          SizedBox(height: 20),
          Text("Номер телефона", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          SizedBox(height: 10),
          BlockTextField(
            colorTheme: colorTheme,
            form: true,
            hint: "Укажите ваш номер телефона",
            onSubmitted: (value){},
          )
        ],
      ),
    );
  }
}