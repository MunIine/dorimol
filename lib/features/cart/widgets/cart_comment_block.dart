import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';

class CartCommentBlock extends StatelessWidget {
  const CartCommentBlock({super.key, required this.colorTheme, required this.controller});

  final AppColors colorTheme;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CartContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Комментарий сборщику", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          const SizedBox(height: 10),
          BlockTextField(
            controller: controller,
            colorTheme: colorTheme,
            form: true,
            hint: "Напишите, что важно учесть при сборке",
            onSubmitted: (value) {},
          ),
        ],
      ),
    );
  }
}
