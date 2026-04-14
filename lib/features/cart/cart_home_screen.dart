import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/features/cart/widgets/cart_button.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/progress_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartHomeScreen extends StatefulWidget {
  const CartHomeScreen({super.key});

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return AutoTabsRouter(
      routes: [CartRoute(colorTheme: colorTheme), CheckoutRoute(colorTheme: colorTheme)],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop && tabsRouter.activeIndex == 0) {
              final router = AutoTabsRouter.of(context).parent()! as TabsRouter;
              router.setActiveIndex(router.previousIndex!);
              context.read<NavBarController>().show();
            }
            if (!didPop && tabsRouter.activeIndex == 1) {
              tabsRouter.setActiveIndex(0);
            }
          },
          child: Scaffold(
            appBar: ProgressAppBar(tabsRouter: tabsRouter, activeColor: colorTheme.seedColor),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
              child: child,
            ),
            bottomNavigationBar: CartButton(
              tabsRouter: tabsRouter,
              colorTheme: colorTheme,
              enabled: checkEnable(tabsRouter),
              onTap:  () => tabsRouter.setActiveIndex(1),
              text: Center(
                child: Text("Оформить заказ", style: AppText.h1.copyWith(color: Colors.white))
              ),
            ),
          ),
        );
      },
    );
  }

  bool checkEnable(TabsRouter tabsRouter){
    if (tabsRouter.activeIndex == 0){
      if (context.read<CartBloc>().state is CartWithItems) return true;
    }
    return false;
  }
}