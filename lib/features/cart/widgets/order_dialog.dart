import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDialog extends StatelessWidget {
  const OrderDialog({
    super.key,
    required this.context,
    required this.colorTheme, 
    required this.tabsRouter, 
    required this.reset
  });

  final BuildContext context;
  final AppColors colorTheme;
  final TabsRouter tabsRouter;
  final VoidCallback reset;

  @override
  Widget build(BuildContext _) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
        current is OrderLoading ||
        current is OrderPlaced ||
        current is OrderFailure,
      builder: (_, state) {
        if (state is OrderPlaced) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              title: Center(
                child: Text('Заказ оформлен', style: AppText.h1.copyWith(color: colorTheme.seedColor)),
              ),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(image: AssetImage("lib/assets/errors/order_successful.png"), width: 150),
                ],
              ),
              actions: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorTheme.seedColor.withAlpha(40),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      final router = AutoTabsRouter.of(context).parent()! as TabsRouter;
                      router.setActiveIndex(router.previousIndex!);
                      context.read<NavBarController>().show();
                      tabsRouter.setActiveIndex(0);
                      context.read<AccountBloc>().add(const FetchAccountInfo());
                      reset();
                    },
                    child: Text('На главную', style: AppText.b7.copyWith(color: colorTheme.seedColor)),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is OrderFailure) {
          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            title: Center(
              child: Text(
                'Что-то пошло не так',
                style: AppText.h1.copyWith(color: colorTheme.seedColor),
              ),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [Image(image: AssetImage("lib/assets/errors/error.png"), width: 150)],
            ),
            actions: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorTheme.seedColor.withAlpha(40),
                ),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Вернуться в корзину',
                    style: AppText.b7.copyWith(color: colorTheme.seedColor),
                  ),
                ),
              ),
            ],
          );
        }
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Center(
              child: Text(
                'Размещаем заказ...',
                style: AppText.h1.copyWith(color: colorTheme.seedColor),
              ),
            ),
            content: const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 50),
              child: Column(mainAxisSize: MainAxisSize.min, children: [CircularProgressIndicator()]),
            ),
          ),
        );
      },
    );
  }
}