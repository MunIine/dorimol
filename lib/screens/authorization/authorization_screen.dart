import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/authorization/bloc/authorization_bloc.dart';
import 'package:dorimol/screens/authorization/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            const Text("Привет", style: AppText.h1alt),
            const SizedBox(height: 8),
            const Text("Войдите в свой аккаунт и откройте для себя первый онлайн-рынок ПМР, где всё самое свежее — прямо от производителей.", style: AppText.t6,),
            const SizedBox(height: 24),
            Text("Номер телефона", style: AppText.b1.copyWith(color: colorTheme.iconGray)),
            const SizedBox(height: 4),
            NumberTextFieldBlock(colorTheme: colorTheme),
            const SizedBox(height: 20),
            BlocConsumer<AuthorizationBloc, AuthorizationState>(
              listener: (context, state) {
                if (state is AuthorizationSuccess) {
                  AutoRouter.of(context).replace(OnboardingRoute());
                } else if (state is AuthorizationFailure) {
                  //TODO: Показать ошибку пользователю
                }
              },
              builder: (context, state) {
                if (state is AuthorizationCodeSend || state is AuthorizationVerifying || state is AuthorizationSuccess) {
                  return SmsTextField(colorTheme: colorTheme);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}