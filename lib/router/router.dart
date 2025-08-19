import 'package:auto_route/auto_route.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:dorimol/screens/account/account_screen.dart';
import 'package:dorimol/screens/account/screens/export.dart';
import 'package:dorimol/screens/authorization/authorization_screen.dart';
import 'package:dorimol/screens/catalog/catalog_screen.dart';
import 'package:dorimol/screens/categories/categories_screen.dart';
import 'package:dorimol/screens/errors/error_screen.dart';
import 'package:dorimol/screens/home_screen.dart';
import 'package:dorimol/screens/cart/cart_screen.dart';
import 'package:dorimol/screens/onboarding/screens/export.dart';
import 'package:dorimol/screens/product/product_screen.dart';
import 'package:dorimol/screens/store/store_screen.dart';
import 'package:dorimol/screens/onboarding/onboarding_screen.dart';
import 'package:dorimol/theme/app_colors.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: "/home",
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
          children: [
            CustomRoute(
              page: CategoriesRoute.page,
              path: "categories",
              initial: true,
              duration: Duration(milliseconds: 0), // Remove dragging when animation
              reverseDuration: Duration(milliseconds: 0), // Remove dragging when animation
            ),
            CustomRoute(
              page: CatalogRoute.page,
              path: "catalog",
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
            ),
            CustomRoute(
              page: ProductRoute.page,
              path: "product",
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
            ),
          ],
        ),
      ]
    ),
    AutoRoute(page: AuthorizationRoute.page, path: "/"),
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