import 'package:auto_route/auto_route.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/screens/account/widgets/export.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return AutoTabsRouter(
      routes: [
        AccountBIORoute(colorTheme: colorTheme),
        AccountOrderHistoryRoute(colorTheme: colorTheme),
      ],
      builder: (context, child) {
      final tabsRouter = AutoTabsRouter.of(context);
        
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50, bottom: 20),
        child: Column(
          children: [
            AccountAppBar(colorTheme: colorTheme),
            SizedBox(height: 12),
            AccountPersonalSale(colorTheme: colorTheme),
            SizedBox(height: 12),
            Expanded(child: AccountInfoBlock(tabsRouter: tabsRouter, colorTheme: colorTheme, child: child)), //TOрDO: Подумать над этим отображением
          ],
        ),
      );
      },
    );

  }
}

class AccountInfoBlock extends StatelessWidget {
  const AccountInfoBlock({
    super.key,
    required this.tabsRouter,
    required this.colorTheme,
    required this.child,
  });

  final TabsRouter tabsRouter;
  final AppColors colorTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  tabsRouter.setActiveIndex(0);
                },
                child: Text("Личная информация", style: AppText.t6.copyWith(color: tabsRouter.activeIndex == 0 ? colorTheme.exyBlue : colorTheme.tips)),
              ),
              GestureDetector(
                onTap: () {
                  tabsRouter.setActiveIndex(1);
                },
                child: Text("История заказов", style: AppText.t6.copyWith(color: tabsRouter.activeIndex == 1 ? colorTheme.exyBlue : colorTheme.tips)),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(child: child)
        ],
      ),
    );
  }
}