import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Column(
      // mainAxisAlignment: MainAxisAlignment.s,
      children: [
        Text(
          'ТОВАР НЕ НАЙДЕН',
          style: AppText.h1.copyWith(
            color: colorTheme.seedColor,
          ),
        ),
        const SizedBox(height: 18),
        const Image(image: AssetImage("lib/assets/errors/404.png")),
      ],
    );
  }
}