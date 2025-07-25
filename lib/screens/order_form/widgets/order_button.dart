import 'package:dorimol/theme/export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.colorTheme, 
    required this.onTap,
    required this.price,
    required this.enabled
  });

  final AppColors colorTheme;
  final VoidCallback onTap;
  final double price;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: enabled ? colorTheme.seedColor : colorTheme.tips
              ),
              child: Row(
                children: [
                  Spacer(),
                  Text("$priceруб.", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
                  SizedBox(width: 16),
                  Text("|", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
                  SizedBox(width: 16),
                  Text("Заказать", style: AppText.h1.copyWith(color: Color(0xFFFFFFFF))),
                  Spacer()
                ],
              )
            ),
          ),
          SizedBox(height: 14),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppText.t1.copyWith(fontFamily: AppText.rostelecom.fontFamily),
              children: [
                TextSpan(text: "Оформляя заказ, вы автоматически соглашаетесь на обработку\n",style: TextStyle(color: colorTheme.textGray)),
                TextSpan(
                  text: "персональных данных", 
                  style: TextStyle(color: colorTheme.seedColor),
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse("https://ecobaza.github.io/EcoBaza_policy/"))
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}