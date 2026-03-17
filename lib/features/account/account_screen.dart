import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:dorimol/features/account/widgets/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final ValueNotifier<File?> pendingAvatarNotifier = ValueNotifier<File?>(null);

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    return BlocProvider(
      create: (context) => AccountBloc()..add(const FetchAccountInfo()),
      child: AutoTabsRouter(
        routes: [
          AccountBIORoute(colorTheme: colorTheme, pendingAvatarNotifier: pendingAvatarNotifier),
          AccountOrderHistoryRoute(colorTheme: colorTheme),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              if (state is AccountLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50, bottom: 20),
                  child: Column(
                    children: [
                      AccountAppBar(
                        colorTheme: colorTheme, 
                        user: state.user, 
                        editMode: state.editMode,
                        pendingAvatarNotifier: pendingAvatarNotifier
                      ),
                      const SizedBox(height: 12),
                      AccountPersonalSale(
                        colorTheme: colorTheme,
                        user: state.user
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: AccountInfoBlock(tabsRouter: tabsRouter, colorTheme: colorTheme, child: child),
                      ),
                    ],
                  ),
                );
              }
              if (state is AccountFailure) {
                AutoRouter.of(context).replace(ErrorRoute(exception: state.error));
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

class AccountInfoBlock extends StatefulWidget {
  const AccountInfoBlock({super.key, required this.tabsRouter, required this.colorTheme, required this.child});

  final TabsRouter tabsRouter;
  final AppColors colorTheme;
  final Widget child;

  @override
  State<AccountInfoBlock> createState() => _AccountInfoBlockState();
}

class _AccountInfoBlockState extends State<AccountInfoBlock> {
  late final NavBarController navBarController;
  bool orderHistoryNavbarVisible = true;

  @override
  void initState() {
    super.initState();
    navBarController = context.read<NavBarController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  orderHistoryNavbarVisible = navBarController.isVisible;
                  navBarController.show();
                  widget.tabsRouter.setActiveIndex(0);
                },
                child: Text(
                  "Личная информация",
                  style: AppText.t6.copyWith(color: widget.tabsRouter.activeIndex == 0 ? widget.colorTheme.exyBlue : widget.colorTheme.tips),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (orderHistoryNavbarVisible != navBarController.isVisible) navBarController.toggle();
                  widget.tabsRouter.setActiveIndex(1);
                },
                child: Text(
                  "История заказов",
                  style: AppText.t6.copyWith(color: widget.tabsRouter.activeIndex == 1 ? widget.colorTheme.exyBlue : widget.colorTheme.tips),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
