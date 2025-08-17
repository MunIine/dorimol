import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme =  Theme.of(context).extension<AppColors>()!;

    return AutoTabsRouter(
      routes: [
        OnboardingFirstRoute(colorTheme: colorTheme),
        OnboardingSecondRoute(colorTheme: colorTheme),
      ],

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: OnboardingAppBar(colorTheme: colorTheme, tabsRouter: tabsRouter),
          body: child,
        );
      },
    );
  }
}

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
    required this.colorTheme,
    required this.tabsRouter,
  });

  final AppColors colorTheme;
  final TabsRouter tabsRouter;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: List.generate(tabsRouter.pageCount, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index < tabsRouter.pageCount - 1 ? 8 : 0),
              height: 4,
              decoration: BoxDecoration(
                color: index <= tabsRouter.activeIndex ? colorTheme.iconGray : colorTheme.stripe,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }),
      ),
    );
  }
}