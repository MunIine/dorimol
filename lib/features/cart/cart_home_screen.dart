import 'dart:async';

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
  final cityNotifier = ValueNotifier<String?>(null);
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  // TODO: maybe more clean solution
  // --------notifier to form button check--------
  final deliveryNotifier = ValueNotifier<bool>(false);
  final activeIndexNotifier = ValueNotifier<int>(0);
  final enableButtonNotifier = ValueNotifier<bool>(false);
  late StreamSubscription _cartBlocSubscription;

  @override
  void initState() {
    super.initState();
    enableButtonNotifier.value = checkEnable();
    void updateEnable(){
      final enable = checkEnable();
      if (enable != enableButtonNotifier.value) enableButtonNotifier.value = enable;
    }
    Listenable.merge([addressController, cityNotifier, deliveryNotifier, activeIndexNotifier]).addListener(updateEnable);
    _cartBlocSubscription = context.read<CartBloc>().stream.distinct(
      (prev, current) => prev.runtimeType == current.runtimeType
      ).listen((state) => updateEnable());
  }

  @override
  void dispose() {
    super.dispose();
    _cartBlocSubscription.cancel();
  }
  // -----------------------------

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return AutoTabsRouter(
      routes: [
        CartRoute(colorTheme: colorTheme), 
        CheckoutRoute(
          colorTheme: colorTheme,
          cityNotifier: cityNotifier,
          addressController: addressController,
          commentController: commentController,
          deliveryNotifier: deliveryNotifier
        )
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        tabsRouter.addListener(() => activeIndexNotifier.value = tabsRouter.activeIndex);
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
            bottomNavigationBar: ValueListenableBuilder(
              valueListenable: enableButtonNotifier,
              builder: (context, en, _) {
                return CartButton(
                  tabsRouter: tabsRouter,
                  colorTheme: colorTheme,
                  enabled: en,
                  onTap:  () => {
                    tabsRouter.setActiveIndex(1),
                  },
                  text: Center(
                    child: Text("Оформить заказ", style: AppText.h1.copyWith(color: Colors.white))
                  ),
                );
              }
            ),
          ),
        );
      },
    );
  }

  bool checkEnable(){
    if (activeIndexNotifier.value == 0){
      if (context.read<CartBloc>().state is CartWithItems) return true;
    }
    if (activeIndexNotifier.value == 1){
      if (deliveryNotifier.value){ // Delivery on
        return addressController.text.trim().isNotEmpty && cityNotifier.value != null;
      }
      return true;
    }
    return false;
  }
}