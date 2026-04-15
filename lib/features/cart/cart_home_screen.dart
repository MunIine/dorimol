import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/constants.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
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
  final deliveryNotifier = ValueNotifier<DeliveryType>(DeliveryType.pickup);
  final activeIndexNotifier = ValueNotifier<int>(0);
  final enableButtonNotifier = ValueNotifier<bool>(false);
  late StreamSubscription _cartBlocSubscription;

  @override
  void initState() {
    super.initState();
    enableButtonNotifier.value = checkEnable();
    void updateEnable() {
      final enable = checkEnable();
      if (enable != enableButtonNotifier.value) enableButtonNotifier.value = enable;
    }

    Listenable.merge([
      addressController,
      cityNotifier,
      deliveryNotifier,
      activeIndexNotifier,
    ]).addListener(updateEnable);
    _cartBlocSubscription = context
        .read<CartBloc>()
        .stream
        .distinct((prev, current) => prev.runtimeType == current.runtimeType)
        .listen((state) => updateEnable());
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
          deliveryNotifier: deliveryNotifier,
        ),
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
          child: BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is OrderPlaced) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Center(
                      child: Text('Заказ оформлен', style: AppText.h1.copyWith(color: colorTheme.seedColor))
                    ),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage("lib/assets/errors/order_successful.png"),
                          width: 150,
                        ),
                      ],
                    ),
                    actions: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colorTheme.seedColor.withAlpha(40)
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            final router = AutoTabsRouter.of(context).parent()! as TabsRouter;
                            router.setActiveIndex(router.previousIndex!);
                            context.read<NavBarController>().show();
                            tabsRouter.setActiveIndex(0);
                            context.read<AccountBloc>().add(const FetchAccountInfo());
                            _reset();
                          },
                          child: Text('На главную', style: AppText.b7.copyWith(color: colorTheme.seedColor)),
                        ),
                      ),
                    ],
                  ),
                );
                return;
              } 
              if (state is OrderFailure) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    title: Center(
                      child: Text('Что-то пошло не так', style: AppText.h1.copyWith(color: colorTheme.seedColor))
                    ),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage("lib/assets/errors/error.png"),
                          width: 150,
                        ),
                      ],
                    ),
                    actions: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colorTheme.seedColor.withAlpha(40)
                        ),
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Вернуться в корзину', style: AppText.b7.copyWith(color: colorTheme.seedColor)),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: ProgressAppBar(tabsRouter: tabsRouter, activeColor: colorTheme.seedColor),
              body: Padding(padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16), child: child),
              bottomNavigationBar: ValueListenableBuilder(
                valueListenable: enableButtonNotifier,
                builder: (context, en, _) {
                  return CartButton(
                    tabsRouter: tabsRouter,
                    colorTheme: colorTheme,
                    enabled: en,
                    onTap: () {
                      if (activeIndexNotifier.value == 0) {
                        tabsRouter.setActiveIndex(1);
                        return;
                      }
                      context.read<CartBloc>().add(
                        AddOrder(
                          deliveryType: deliveryNotifier.value,
                          city: cityNotifier.value,
                          address: addressController.text.trim().isEmpty ? null : addressController.text.trim(),
                          comment: commentController.text.trim().isEmpty ? null : commentController.text.trim(),
                        ),
                      );
                    },
                    text: Center(
                      child: Text("Оформить заказ", style: AppText.h1.copyWith(color: Colors.white)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _reset() {
    cityNotifier.value = null;
    addressController.clear();
    commentController.clear();
    deliveryNotifier.value = DeliveryType.pickup;
    activeIndexNotifier.value = 0;
  }

  bool checkEnable() {
    if (activeIndexNotifier.value == 0) {
      if (context.read<CartBloc>().state is CartWithItems) return true;
    }
    if (activeIndexNotifier.value == 1) {
      if (deliveryNotifier.value == DeliveryType.courier) {
        // Delivery on
        return addressController.text.trim().isNotEmpty && cityNotifier.value != null;
      }
      return true;
    }
    return false;
  }
}
