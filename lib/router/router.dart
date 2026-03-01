import 'package:auto_route/auto_route.dart';
import 'package:dorimol/models/category.dart';
import 'package:dorimol/router/router_guards.dart';
import 'package:dorimol/features/account/account_screen.dart';
import 'package:dorimol/features/account/bio/account_bio_screen.dart';
import 'package:dorimol/features/account/order_history/account_order_history_screen.dart';
import 'package:dorimol/features/authorization/authorization_screen.dart';
import 'package:dorimol/features/catalog/catalog_screen.dart';
import 'package:dorimol/features/categories/categories_screen.dart';
import 'package:dorimol/features/errors/error_screen.dart';
import 'package:dorimol/features/home_screen.dart';
import 'package:dorimol/features/cart/cart_screen.dart';
import 'package:dorimol/features/onboarding/screens/export.dart';
import 'package:dorimol/features/product/product_screen.dart';
import 'package:dorimol/features/store/store_screen.dart';
import 'package:dorimol/features/onboarding/onboarding_screen.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: "/",
      guards: [AuthGuard()],
      children: [
        AutoRoute(
          page: AccountRoute.page,
          path: "account",
          children: [
            AutoRoute(page: AccountBIORoute.page, path: "bio"),
            AutoRoute(page: AccountOrderHistoryRoute.page, path: "order-history"),
          ]
        ),
        AutoRoute(
          page: StoreRoute.page,
          path: "store",
          initial: true,
          children: [
            CustomRoute(
              page: CategoriesRoute.page,
              path: "categories",
              initial: true,
              duration: const Duration(milliseconds: 0), // Remove dragging when animation
              reverseDuration: const Duration(milliseconds: 0), // Remove dragging when animation
            ),
            CustomRoute(
              page: CatalogRoute.page,
              path: "catalog",
              duration: const Duration(milliseconds: 0),
              reverseDuration: const Duration(milliseconds: 0),
            ),
            CustomRoute(
              page: ProductRoute.page,
              path: "product",
              duration: const Duration(milliseconds: 0),
              reverseDuration: const Duration(milliseconds: 0),
            ),
          ],
        ),
      ]
    ),
    AutoRoute(page: AuthorizationRoute.page, path: "/auth"),
    AutoRoute(
      page: OnboardingRoute.page, 
      path: "/onboarding",
      children: [
        AutoRoute(page: OnboardingFirstRoute.page, path: "first"),
        AutoRoute(page: OnboardingSecondRoute.page, path: "second"),
      ]
    ),
    AutoRoute(page: CartRoute.page, path: "/order"),
    AutoRoute(page: ErrorRoute.page, path: "/error"),
  ];
}