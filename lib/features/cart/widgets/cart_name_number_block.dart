import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';

class CartNameNumberBlock extends StatelessWidget {
  const CartNameNumberBlock({
    super.key,
    required this.colorTheme, 
    required this.fullNameController, 
    required this.phoneNumberController,
  });

  final AppColors colorTheme;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return CartContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ФИО", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          const SizedBox(height: 10),
          BlockTextField(
            controller: fullNameController,
            colorTheme: colorTheme,
            form: true,
            hint: "Укажите ваше ФИО",
            useIcon: true,
            onSubmitted: (value){},
          ),
          const SizedBox(height: 20),
          Text("Номер телефона", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          const SizedBox(height: 10),
          BlockTextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            colorTheme: colorTheme,
            form: true,
            hint: "Укажите ваш номер телефона",
            useIcon: true,
            onSubmitted: (value){},
          )
        ],
      ),
    );
  }
}