import 'package:auto_route/auto_route.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InternetErrorScreen extends StatelessWidget {
  const InternetErrorScreen({super.key});

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
                "Ошибка сети",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: colorTheme.textBlack
                )
              ),
              Text("Нет подключения к интернету", style: AppText.t7.copyWith(color: colorTheme.textBlack)),
              Spacer(),
              SizedBox(width: 300, child: Image(image: AssetImage("lib/assets/errors/network.png"))),
              Spacer(),
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