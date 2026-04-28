import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/services/ui_service.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/bars/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    final icons = [SvgIcons.user, SvgIcons.groceryBasket, SvgIcons.shoppingCartFilled];

    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => AccountBloc()..add(const FetchAccountInfo())),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: AutoTabsRouter(
        routes: [const AccountRoute(), const StoreRoute(), const CartHomeRoute()],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: child,
            extendBody: true,
            bottomNavigationBar: Consumer<NavBarController>(
              builder: (context, controller, child) => AnimatedContainer(
                duration: Duration(milliseconds: controller.animation == NavBarAnimation.soft ? 250 : 0),
                transform: Matrix4.translationValues(0, controller.isVisible ? 0 : 120, 0),
                child: NavBar(colorTheme: colorTheme, icons: icons, tabsRouter: tabsRouter),
              ),
            ),
          );
        },
      ),
    );
  }
}
