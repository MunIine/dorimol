import 'package:auto_route/auto_route.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:dorimol/screens/account/account_screen.dart';
import 'package:dorimol/screens/catalog/catalog_screen.dart';
import 'package:dorimol/screens/categories/categories_screen.dart';
import 'package:dorimol/screens/errors/error_screen.dart';
import 'package:dorimol/screens/home_screen.dart';
import 'package:dorimol/screens/order_form/order_screen.dart';
import 'package:dorimol/screens/product/product_screen.dart';
import 'package:dorimol/screens/store/store_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: "/",
      children: [
        AutoRoute(page: AccountRoute.page, path: "account"),
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
    AutoRoute(page: OrderRoute.page, path: "/order"),
    AutoRoute(page: ErrorRoute.page, path: "/error"),
  ];
}