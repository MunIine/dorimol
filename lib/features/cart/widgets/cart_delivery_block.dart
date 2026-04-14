import 'package:dorimol/data/services/config_service.dart';
import 'package:dorimol/features/cart/widgets/cart_content_block.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/dropdowns/city_dropdown.dart';
import 'package:dorimol/widgets/helpers/block_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartDeliveryBlock extends StatefulWidget {
  const CartDeliveryBlock({
    super.key, 
    required this.colorTheme, 
    required this.addressController, 
    required this.cityNotifier, 
    required this.deliveryNotifier
  });

  final AppColors colorTheme;
  final TextEditingController addressController;
  final ValueNotifier<String?> cityNotifier;
  final ValueNotifier<bool> deliveryNotifier;

  @override
  State<CartDeliveryBlock> createState() => _CartDeliveryBlockState();
}

class _CartDeliveryBlockState extends State<CartDeliveryBlock> {
  final List<String> cities = GetIt.I<ConfigService>().serverConfig.deliveryCities;

  @override
  Widget build(BuildContext context) {
    final delivery = widget.deliveryNotifier.value;

    return CartContentBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Доставка", style: AppText.b3.copyWith(color: widget.colorTheme.textBlack)),
          const SizedBox(height: 10),
          DeliverySelect(
            colorTheme: widget.colorTheme,
            deliveryMethod: 'Самовывоз',
            price: 'Бесплатно',
            selected: !delivery,
            onTap: () => widget.deliveryNotifier.value = false,
          ),
          const SizedBox(height: 8),
          DeliverySelect(
            colorTheme: widget.colorTheme,
            deliveryMethod: 'Курьером',
            price: 'от 30руб',
            selected: delivery,
            onTap: () => widget.deliveryNotifier.value = true,
          ),
          const SizedBox(height: 8),
          if (delivery) CityDropdown(
            colorTheme: widget.colorTheme, 
            cities: cities, 
            cityNotifier: widget.cityNotifier,
            dropdownStyleData: DropdownStyleData(
              padding: EdgeInsets.zero,
              maxHeight: 150,
              elevation: 0,
              decoration: BoxDecoration(
                color: widget.colorTheme.background,
                borderRadius: BorderRadius.circular(16)
              ),
            ),
            iconStyleData: const IconStyleData(icon: SizedBox()),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: widget.colorTheme.formInput
              ),
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            ),
          ),
          if (delivery) const SizedBox(height: 8),
          if (delivery) BlockTextField(
            controller: widget.addressController,
            colorTheme: widget.colorTheme,
            form: true,
            hint: "Введите адрес",
            // useIcon: true,
            onSubmitted: (value) {},
          ),
        ],
      ),
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
    required this.onTap
  });

  final AppColors colorTheme;
  final String deliveryMethod;
  final String price;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: colorTheme.formInput),
        child: Row(
          children: [
            selected
                ? Icon(SvgIcons.radioButtonOn, color: colorTheme.seedColor)
                : Icon(SvgIcons.radioButtonOff, color: colorTheme.block),
            const SizedBox(width: 16),
            Text(deliveryMethod, style: AppText.t3.copyWith(color: colorTheme.iconGray)),
            const Spacer(),
            Text(price, style: AppText.t3.copyWith(color: colorTheme.tips)),
          ],
        ),
      ),
    );
  }
}