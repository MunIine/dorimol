import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:dorimol/widgets/helpers/return_button.dart';
import 'package:flutter/material.dart';

class OrderFormScreen extends StatelessWidget {
  const OrderFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReturnButton(icon: SvgIcons.xCirleFilled, color: colorTheme.tips),
                Spacer(),
                Column(
                  children: [
                    Text("Оформление заказа", style: AppText.h1.copyWith(color: colorTheme.textBlack, height: 1.3)),
                    Text("Сохраняется, пока вы его не отмените", style: AppText.t2.copyWith(color: colorTheme.iconGray)),
                  ],
                ),
                Spacer(),
                SizedBox(width: 24)
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _ContentBlock(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ФИО", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
                        SizedBox(height: 10),
                        BlockTextField(
                          colorTheme: colorTheme,
                          form: true,
                          hint: "Укажите ваше ФИО",
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
                          hint: "Укажите ваш номер телефона"
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _ContentBlock(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Доставка", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
                        SizedBox(height: 10),
                        BlockTextField(colorTheme: colorTheme, form: true, enabled: false, hint: "СКОРО!!!"),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _ContentBlock(
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
                          itemBuilder: (context, index) => CartItemCard(colorTheme: colorTheme)
                        ),
                        SizedBox(height: 40),
                        Text("Комментарий сборщику", style: AppText.b3.copyWith(color: colorTheme.textBlack)),
                        SizedBox(height: 10),
                        BlockTextField(colorTheme: colorTheme, form: true, hint: "Напишите, что важно учесть при сборке"),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorTheme.seedColor
          ),
          child: Row(
            children: [
              Spacer(),
              Text("273руб.", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
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

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage("lib/assets/images/items/item2.png"),
              fit: BoxFit.cover,
            )
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Томат розовый", style: AppText.b4.copyWith(color: colorTheme.textBlack)),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: colorTheme.block
              ),
              child: Text("150Р/шт", style: AppText.b4.copyWith(color: colorTheme.textGray)),
            )
          ],
        ),
        Spacer(),
        SizedBox(
          width: 120, 
          child: ChangeItemInCart(
            cartHeight: 30,
            borderRadius: 10,
            dividers: false,
            priceTextStyle: AppText.t1.copyWith(color: colorTheme.textBlack, height: 1.1),
            weightTextStyle: AppText.t0.copyWith(color: colorTheme.textGray, height: 1.18),
            iconColor: colorTheme.textBlack,
            color: colorTheme.block,
          )
        )
      ],
    );
  }
}

class _ContentBlock extends StatelessWidget {
  const _ContentBlock({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFFFFFF)
      ),
      child: child
    );
  }
}