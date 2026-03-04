import 'package:auto_route/auto_route.dart';
import 'package:dorimol/widgets/dropdowns/city_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class OnboardingSecondScreen extends StatefulWidget {
  const OnboardingSecondScreen({
    super.key,
    required this.colorTheme,
    required this.controller,
    required this.endOnboarding,
  });

  final AppColors colorTheme;
  final TextEditingController controller;
  final void Function(BuildContext, String?) endOnboarding;

  @override
  State<OnboardingSecondScreen> createState() => _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState extends State<OnboardingSecondScreen> {
  String? selectedCity;
  late final addressController;
  bool enabled = false;

  final List<String> cities = [
    "Тирасполь",
    "Бендеры",
    "Парканы",
    "Екатеринбург",
    "Казань",
    "Нижний Новгород",
    "Челябинск",
    "Самара",
    "Омск",
    "Ростов-на-Дону",
  ];

  @override
  void initState() {
    super.initState();
    addressController = widget.controller;
    addressController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final shouldEnable = addressController.text.trim().isNotEmpty && selectedCity != null;
    if (shouldEnable != enabled) {
      setState(() {
        enabled = shouldEnable;
      });
    }
  }

  @override
  void dispose() {
    addressController.removeListener(_onTextChanged);
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = widget.colorTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text("Укажите адрес", style: AppText.h1alt.copyWith(color: colorTheme.textBlack)),
          Text(
            "Укажите адрес доставки - это необязательно, но поможет быстрее оформлять будущие заказы. Вы всегда сможете изменить его в личном кабинете.",
            textAlign: TextAlign.center,
            style: AppText.t7.copyWith(color: colorTheme.textBlack)
          ),
          const SizedBox(height: 30),
          Align(alignment: Alignment.centerLeft, child: Text("Ваш город", style: AppText.b1.copyWith(color: colorTheme.iconGray))),
          const SizedBox(height: 4),
          CityDropdown(
            colorTheme: colorTheme, 
            cities: cities, 
            selectedCity: selectedCity, 
            onChanged: (value) {
              setState(() {
                if (selectedCity == value) {
                  selectedCity = null;
                  return;
                }
                selectedCity = value;
              });
              _onTextChanged();
            },
          ),
          const SizedBox(height: 32),
          Align(alignment: Alignment.centerLeft, child: Text("Ваш адрес", style: AppText.b1.copyWith(color: colorTheme.iconGray))),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colorTheme.formInput,
            ),
            child: TextField(
              controller: addressController,
              style: AppText.t5.copyWith(color: colorTheme.iconGray),
              decoration: const InputDecoration(
                hintText: "Улица, дом, кв",
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => widget.endOnboarding(context, selectedCity),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: colorTheme.seedColor, width: 1),
                  ),
                  child: Text("Пропустить", style: AppText.b7.copyWith(color: colorTheme.seedColor),)
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: enabled ? () => widget.endOnboarding(context, selectedCity) : null,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: colorTheme.seedColor,
                    disabledBackgroundColor: colorTheme.tips,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Далее", style: AppText.b7.copyWith(color: colorTheme.background),)
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppText.t1.copyWith(fontFamily: AppText.rostelecom.fontFamily),
              children: [
                TextSpan(text: "Завершая регистрацию, вы соглашаетесь на обработку ",style: TextStyle(color: colorTheme.textGray)),
                TextSpan(
                  text: "персональных данных", 
                  style: TextStyle(color: colorTheme.seedColor),
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse("https://ecobaza.github.io/EcoBaza_policy/"))
                ),
              ]
            )
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}