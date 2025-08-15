import 'package:auto_route/auto_route.dart';
import 'package:dorimol/screens/authorization/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Привет", style: AppText.b32),
            SizedBox(height: 8),
            Text("Войдите в свой аккаунт и откройте для себя первый онлайн-рынок ПМР, где всё самое свежее — прямо от производителей.", style: AppText.t6,),
            SizedBox(height: 24),
            Text("Номер телефона", style: AppText.b1.copyWith(color: colorTheme.iconGray)),
            SizedBox(height: 4),
            NumberTextFieldBlock(colorTheme: colorTheme),
            SizedBox(height: 20),
            SmsTextField(colorTheme: colorTheme),
          ],
        ),
      ),
    );
  }
}