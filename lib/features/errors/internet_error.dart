import 'package:auto_route/auto_route.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

class InternetError extends StatelessWidget {
  const InternetError({super.key, required this.disabledButton});

  final bool disabledButton;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 100, bottom: 90),
          child: Column(
            children: [
              Text(
                "Ошибка сети",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: colorTheme.textBlack
                )
              ),
              Text("Проверьте подключение к интернету", style: AppText.t7.copyWith(color: colorTheme.textBlack)),
              const Spacer(),
              const SizedBox(width: 300, child: Image(image: AssetImage("lib/assets/errors/network.png"))),
              const Spacer(),
              if (!disabledButton) SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => AutoRouter.of(context).pushPath("/"),
                  style: TextButton.styleFrom(backgroundColor: colorTheme.iconGray, padding: const EdgeInsets.symmetric(vertical: 12)),
                  child: Text("На главную", style: AppText.b7.copyWith(color: colorTheme.background))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}