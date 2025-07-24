import 'package:auto_route/auto_route.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:dorimol/screens/catalog/catalog_screen.dart';
import 'package:dorimol/screens/categories/categories_screen.dart';
import 'package:dorimol/screens/errors/error_screen.dart';
import 'package:dorimol/screens/errors/internet_error_screen.dart';
import 'package:dorimol/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CategoriesRoute.page, path: "/"),
    AutoRoute(page: CatalogRoute.page, path: "/catalog"),
    AutoRoute(page: ProductRoute.page, path: "/product"),
    AutoRoute(page: InternetErrorRoute.page, path: "/internet_error"),
    AutoRoute(page: ErrorRoute.page, path: "/error"),
  ];
}