import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class SmsTextField extends StatelessWidget {
  const SmsTextField({
    super.key,
    required this.colorTheme,
  });

  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Код из смс", style: AppText.b1.copyWith(color: colorTheme.iconGray)),
        const SizedBox(height: 4),
        Pinput(
          length: 6,
          defaultPinTheme: PinTheme(
            width: 46,
            height: 46,
            textStyle: AppText.h1.copyWith(color: colorTheme.textBlack),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorTheme.tips, width: 2),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 46,
            height: 46,
            textStyle: AppText.h1.copyWith(color: colorTheme.textBlack),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorTheme.seedColor, width: 2),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 46,
            height: 46,
            textStyle: AppText.h1.copyWith(color: colorTheme.textBlack),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorTheme.seedColor, width: 2),
            ),
          ),
          useNativeKeyboard: true,
          showCursor: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            if (value.length == 6) AutoRouter.of(context).replace(OnboardingRoute());
          },
        ),
        const SizedBox(height: 12),
        Text("Отправить код повторно 29с", style: AppText.b1.copyWith(color: colorTheme.seedColor)),
        const SizedBox(height: 26)
      ],
    );
  }
}