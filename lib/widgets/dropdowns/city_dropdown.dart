import 'package:dorimol/theme/export.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CityDropdown extends StatelessWidget {
  const CityDropdown({
    super.key, 
    required this.colorTheme, 
    required this.cities, 
    required this.cityNotifier, 
    this.dropdownStyleData,
    this.iconStyleData,
    this.buttonStyleData,
    this.hint,
    this.disabledHint,
    this.enabled = true,
  });

  final AppColors colorTheme;
  final List<String> cities;
  final ValueNotifier<String?> cityNotifier;
  final DropdownStyleData? dropdownStyleData;
  final IconStyleData? iconStyleData;
  final ButtonStyleData? buttonStyleData;
  final Widget? hint;
  final Widget? disabledHint;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cityNotifier,
      builder: (_, selectedCity, _) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            items: cities.map((city) => DropdownMenuItem<String>(
              value: city,
              child: Row(
                children: [
                  Icon(
                    selectedCity == city ? SvgIcons.radioButtonOn : SvgIcons.radioButtonOff, 
                    color: selectedCity == city ? colorTheme.seedColor : colorTheme.tips
                  ),
                  const SizedBox(width: 8),
                  Text(city, style: AppText.t3.copyWith(color: colorTheme.tips)),
                ],
              ),
            )).toList(),
            selectedItemBuilder: (context) {
              return cities.map((city) => Align(alignment: AlignmentGeometry.centerLeft, child: Text(city, style: AppText.t5.copyWith(color: colorTheme.textBlack)))).toList();
            },
            value: selectedCity,
            onChanged: enabled ? (value){
              if (selectedCity == value) {
                cityNotifier.value = null;
                return;
              }
              cityNotifier.value = value;
            } : null,
            hint: hint ?? Text("Выберите город", style: AppText.t3.copyWith(color: colorTheme.tips)),
            disabledHint: disabledHint ?? Text("Не указан", style: AppText.t5.copyWith(color: colorTheme.textBlack)),
            dropdownStyleData: dropdownStyleData ?? DropdownStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              maxHeight: 250,
              elevation: 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
            ),
            iconStyleData: iconStyleData ?? IconStyleData(
              icon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Transform.rotate(
                  angle: 1.5708,
                  child: Icon(SvgIcons.back, color: colorTheme.iconGray, size: 16),
                ),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.zero
            ),
            buttonStyleData: buttonStyleData ?? ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorTheme.formInput,
              ),
            ),
          ),
        );
      }
    );
  }
}