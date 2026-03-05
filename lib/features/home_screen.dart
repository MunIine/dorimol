import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    final icons = [
      SvgIcons.user,
      SvgIcons.groceryBasket,
      SvgIcons.shoppingCartFilled,
    ];

    return AutoTabsRouter(
      routes: [
        const AccountRoute(),
        const StoreRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          extendBody: true,
          bottomNavigationBar: Consumer<NavBarController>(
            builder: (context, controller, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              transform: Matrix4.translationValues(0, controller.isVisible ? 0 : 120, 0),
              child:  NavBar(colorTheme: colorTheme, icons: icons, tabsRouter: tabsRouter)
            )
          ),
        );
      },
    );
  }
}