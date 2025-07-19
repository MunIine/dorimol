// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CatalogScreen]
class CatalogRoute extends PageRouteInfo<CatalogRouteArgs> {
  CatalogRoute({
    Key? key,
    Category? category,
    String? query,
    List<PageRouteInfo>? children,
  }) : super(
         CatalogRoute.name,
         args: CatalogRouteArgs(key: key, category: category, query: query),
         initialChildren: children,
       );

  static const String name = 'CatalogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CatalogRouteArgs>(
        orElse: () => const CatalogRouteArgs(),
      );
      return CatalogScreen(
        key: args.key,
        category: args.category,
        query: args.query,
      );
    },
  );
}

class CatalogRouteArgs {
  const CatalogRouteArgs({this.key, this.category, this.query});

  final Key? key;

  final Category? category;

  final String? query;

  @override
  String toString() {
    return 'CatalogRouteArgs{key: $key, category: $category, query: $query}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatalogRouteArgs) return false;
    return key == other.key &&
        category == other.category &&
        query == other.query;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode ^ query.hashCode;
}

/// generated route for
/// [CategoriesScreen]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoriesScreen();
    },
  );
}

/// generated route for
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({Key? key, required String id, List<PageRouteInfo>? children})
    : super(
        ProductRoute.name,
        args: ProductRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'ProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return ProductScreen(key: args.key, id: args.id);
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}
