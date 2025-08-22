import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class OnboardingSecondScreen extends StatefulWidget {
  const OnboardingSecondScreen({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  State<OnboardingSecondScreen> createState() => _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState extends State<OnboardingSecondScreen> {
  String? selectedCity;
  final addressController = TextEditingController();
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
          SizedBox(height: 30),
          Align(alignment: Alignment.centerLeft, child: Text("Ваш город", style: AppText.b1.copyWith(color: colorTheme.iconGray))),
          SizedBox(height: 4),
          DropdownButtonHideUnderline(
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
                    SizedBox(width: 8),
                    Text(city, style: AppText.t3.copyWith(color: colorTheme.tips)),
                  ],
                ),
              )).toList(),
              selectedItemBuilder: (context) {
                return cities.map((city) =>
                  DropdownMenuItem(
                    value: city, 
                    child: Text(city, style: AppText.t3.copyWith(color: colorTheme.tips))
                  )
                ).toList();
              },
              value: selectedCity,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
                _onTextChanged();
              },
              hint: Text("Ваш город", style: AppText.t3.copyWith(color: colorTheme.tips)),
              dropdownStyleData: DropdownStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                maxHeight: 250,
                elevation: 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child: Icon(SvgIcons.back, color: colorTheme.iconGray, size: 16),
                  ),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: EdgeInsets.zero
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorTheme.formInput,
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Align(alignment: Alignment.centerLeft, child: Text("Ваш адрес", style: AppText.b1.copyWith(color: colorTheme.iconGray))),
          SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colorTheme.formInput,
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: "Улица, дом, кв",
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => AutoRouter.of(context).replace(HomeRoute()),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: colorTheme.seedColor, width: 1),
                  ),
                  child: Text("Пропустить", style: AppText.b7.copyWith(color: colorTheme.seedColor),)
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: enabled ? () => AutoRouter.of(context).replace(HomeRoute()) : null,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: colorTheme.seedColor,
                    disabledBackgroundColor: colorTheme.tips,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Далее", style: AppText.b7.copyWith(color: colorTheme.background),)
                ),
              )
            ],
          ),
          SizedBox(height: 12),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
