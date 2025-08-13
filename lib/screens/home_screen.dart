import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/nav_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    final icons = [
      Icons.category,
      Icons.category,
      Icons.category,
    ];

    return AutoTabsRouter(
      routes: [
        AccountRoute(),
        CategoriesRoute(),
        OrderRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: Stack(
            children: [
              child,
              NavBar(colorTheme: colorTheme, icons: icons, tabsRouter: tabsRouter)
            ],
          ),
        );
      },
    );
  }
}