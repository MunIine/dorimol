import 'package:dorimol/screens/cart/bloc/cart_bloc.dart';
import 'package:dorimol/screens/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDeliveryBlock extends StatefulWidget {
  const CartDeliveryBlock({super.key, required this.colorTheme, required this.controller});

  final AppColors colorTheme;
  final TextEditingController controller;

  @override
  State<CartDeliveryBlock> createState() => _CartDeliveryBlockState();
}

class _CartDeliveryBlockState extends State<CartDeliveryBlock> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartBloc, CartState, bool>(
      selector: (state) {
        if (state is CartUpdated) return state.delivery;
        if (state is CartInitial) return state.delivery;
        return false;
      },
      builder: (context, delivery) {
        return CartContentBlock(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Доставка", style: AppText.b3.copyWith(color: widget.colorTheme.textBlack)),
              SizedBox(height: 10),
              DeliverySelect(
                colorTheme: widget.colorTheme,
                deliveryMethod: 'Самовывоз',
                price: 'Бесплатно',
                selected: !delivery,
              ),
              SizedBox(height: 8),
              DeliverySelect(
                colorTheme: widget.colorTheme,
                deliveryMethod: 'Курьером',
                price: 'от 30руб',
                selected: delivery,
              ),
              SizedBox(height: 8),
              if (delivery)
                BlockTextField(
                  controller: widget.controller,
                  colorTheme: widget.colorTheme,
                  form: true,
                  hint: "ГОРОД-УЛИЦА-ДОМ",
                  useIcon: true,
                  onSubmitted: (value) {},
                ),
            ],
          ),
        );
      },
    );
  }
}

class DeliverySelect extends StatelessWidget {
  const DeliverySelect({
    super.key,
    required this.colorTheme,
    required this.deliveryMethod,
    required this.price,
    required this.selected,
  });

  final AppColors colorTheme;
  final String deliveryMethod;
  final String price;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<CartBloc>(context).add(ChangeDelivery()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: colorTheme.formInput),
        child: Row(
          children: [
            selected
                ? Icon(SvgIcons.radioButtonOn, color: colorTheme.seedColor)
                : Icon(SvgIcons.radioButtonOff, color: colorTheme.block),
            SizedBox(width: 16),
            Text(deliveryMethod, style: AppText.t3.copyWith(color: colorTheme.iconGray)),
            Spacer(),
            Text(price, style: AppText.t3.copyWith(color: colorTheme.tips)),
          ],
        ),
      ),
    );
  }
}
