import 'package:auto_route/auto_route.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 100, bottom: 90),
          child: Column(
            children: [
              Text(
                "Что-то пошло не так...",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: colorTheme.textBlack
                )
              ),
              Text("Мы знаем о проблеме и уже работаем", style: AppText.t7.copyWith(color: colorTheme.textBlack)),
              Spacer(),
              SizedBox(width: 250, child: Image(image: AssetImage("lib/assets/errors/error.png"))),
              Spacer(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => AutoRouter.of(context).pushPath("/"),
                  style: TextButton.styleFrom(backgroundColor: colorTheme.iconGray, padding: EdgeInsets.symmetric(vertical: 12)),
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