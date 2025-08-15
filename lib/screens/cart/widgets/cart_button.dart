import 'package:auto_route/auto_route.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CartButton extends StatelessWidget {
  const CartButton({
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
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => AutoRouter.of(context).pop(),
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: colorTheme.seedColor,
                ),
                icon: Transform.rotate(
                  angle: 3.14159,
                  child: Icon(SvgIcons.back, color: colorTheme.background)
                )
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: enabled ? colorTheme.seedColor : colorTheme.tips
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$priceруб.", style: AppText.h1.copyWith(color: const Color(0xFFFFFFFF))),
                        const SizedBox(width: 16),
                        Text("|", style: AppText.h1.copyWith(color: const Color(0xFFFFFFFF))),
                        const SizedBox(width: 16),
                        Text("Заказать", style: AppText.h1.copyWith(color: const Color(0xFFFFFFFF))),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
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