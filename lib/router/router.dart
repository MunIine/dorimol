import 'package:dorimol/screens/catalog/catalog_screen.dart';
import 'package:dorimol/screens/categories/categories_screen.dart';
import 'package:dorimol/screens/product/product_screen.dart';

final routes = {
  '/': (context) => const CategoriesScreen(),
  '/catalog': (context) => const CatalogScreen(),
  '/product': (context) => const ProductScreen(),
};