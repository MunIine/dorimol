// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountScreen();
    },
  );
}

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
/// [ErrorScreen]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    Key? key,
    required Exception exception,
    List<PageRouteInfo>? children,
  }) : super(
         ErrorRoute.name,
         args: ErrorRouteArgs(key: key, exception: exception),
         initialChildren: children,
       );

  static const String name = 'ErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ErrorRouteArgs>();
      return ErrorScreen(key: args.key, exception: args.exception);
    },
  );
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.exception});

  final Key? key;

  final Exception exception;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, exception: $exception}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ErrorRouteArgs) return false;
    return key == other.key && exception == other.exception;
  }

  @override
  int get hashCode => key.hashCode ^ exception.hashCode;
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [OrderScreen]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
    : super(OrderRoute.name, initialChildren: children);

  static const String name = 'OrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrderScreen();
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
