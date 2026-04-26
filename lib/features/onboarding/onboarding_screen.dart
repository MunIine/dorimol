import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/features/onboarding/onboarding_service.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/progress_appbar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controllerFirstPage = TextEditingController();
  final controllerSecondPage = TextEditingController();

  void endOnboarding(BuildContext context, String? city) async {
    final router = AutoRouter.of(context);
    try {
      await OnboardingService().completeOnboarding(controllerFirstPage.text.trim(), city?.trim(), controllerSecondPage.text.trim());
      router.replace(const HomeRoute());
    } catch (e) {
      router.replace(ErrorRoute(exception: Exception("Произошла ошибка")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme =  Theme.of(context).extension<AppColors>()!;

    return AutoTabsRouter(
      routes: [
        OnboardingFirstRoute(colorTheme: colorTheme, controller: controllerFirstPage),
        OnboardingSecondRoute(colorTheme: colorTheme, controller: controllerSecondPage, endOnboarding: endOnboarding,),
      ],

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: ProgressAppBar(tabsRouter: tabsRouter, activeColor: colorTheme.iconGray),
          backgroundColor: colorTheme.background,
          body: child,
        );
      },
    );
  }
}