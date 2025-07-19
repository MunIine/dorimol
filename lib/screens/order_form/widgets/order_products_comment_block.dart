import 'package:dorimol/screens/order_form/widgets/cart_product_card.dart';
import 'package:dorimol/screens/order_form/widgets/content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';

class OrderProductsCommentBlock extends StatelessWidget {
  const OrderProductsCommentBlock({
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
          Row(
            children: [
              Text("Кол-во: 2", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text("Удалить", style: AppText.t3.copyWith(color: colorTheme.iconGray)),
                    SizedBox(width: 8),
                    Icon(SvgIcons.trash, color: colorTheme.iconGray, size: 16)
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 25),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) => CartProductCard(colorTheme: colorTheme)
          ),
          SizedBox(height: 40),
          Text("Комментарий сборщику", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
          SizedBox(height: 10),
          BlockTextField(colorTheme: colorTheme, form: true, hint: "Напишите, что важно учесть при сборке", onSubmitted: (value){},),
        ],
      ),
    );
  }
}