import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/authorization/bloc/authorization_bloc.dart';
import 'package:dorimol/screens/authorization/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController pinController = TextEditingController();
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
                if (state is AuthorizationSuccess && state.onboardingCompleted) {
                  AutoRouter.of(context).replace(const HomeRoute());
                }
                else if (state is AuthorizationSuccess && !state.onboardingCompleted) {
                  AutoRouter.of(context).replace(const OnboardingRoute());
                }
                else if (state is AuthorizationFailure) {
                  GetIt.I<Talker>().error(state.exception);
                }
              },
              builder: (context, state) {
                if (state is AuthorizationCodeSend || state is AuthorizationVerifying || state is AuthorizationSuccess) {
                  return SmsTextField(colorTheme: colorTheme, controller: pinController);
                }
                if (state is AuthorizationFailure && state.exception is FirebaseAuthException && (state.exception as FirebaseAuthException).code == 'invalid-verification-code'){
                  return SmsTextField(colorTheme: colorTheme, controller: pinController, incorrectPin: pinController.text, message: "Неверный код");
                }
                if (state is AuthorizationFailure){
                  return SmsTextField(colorTheme: colorTheme, controller: pinController, incorrectPin: pinController.text, message: "Произошла внутренняя ошибка");
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