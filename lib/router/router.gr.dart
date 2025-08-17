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
/// [AuthorizationScreen]
class AuthorizationRoute extends PageRouteInfo<void> {
  const AuthorizationRoute({List<PageRouteInfo>? children})
    : super(AuthorizationRoute.name, initialChildren: children);

  static const String name = 'AuthorizationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthorizationScreen();
    },
  );
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
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
/// [OnboardingFirstScreen]
class OnboardingFirstRoute extends PageRouteInfo<OnboardingFirstRouteArgs> {
  OnboardingFirstRoute({
    Key? key,
    required AppColors colorTheme,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingFirstRoute.name,
         args: OnboardingFirstRouteArgs(key: key, colorTheme: colorTheme),
         initialChildren: children,
       );

  static const String name = 'OnboardingFirstRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingFirstRouteArgs>();
      return OnboardingFirstScreen(key: args.key, colorTheme: args.colorTheme);
    },
  );
}

class OnboardingFirstRouteArgs {
  const OnboardingFirstRouteArgs({this.key, required this.colorTheme});

  final Key? key;

  final AppColors colorTheme;

  @override
  String toString() {
    return 'OnboardingFirstRouteArgs{key: $key, colorTheme: $colorTheme}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingFirstRouteArgs) return false;
    return key == other.key && colorTheme == other.colorTheme;
  }

  @override
  int get hashCode => key.hashCode ^ colorTheme.hashCode;
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [OnboardingSecondScreen]
class OnboardingSecondRoute extends PageRouteInfo<OnboardingSecondRouteArgs> {
  OnboardingSecondRoute({
    Key? key,
    required AppColors colorTheme,
    List<PageRouteInfo>? children,
  }) : super(
         OnboardingSecondRoute.name,
         args: OnboardingSecondRouteArgs(key: key, colorTheme: colorTheme),
         initialChildren: children,
       );

  static const String name = 'OnboardingSecondRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingSecondRouteArgs>();
      return OnboardingSecondScreen(key: args.key, colorTheme: args.colorTheme);
    },
  );
}

class OnboardingSecondRouteArgs {
  const OnboardingSecondRouteArgs({this.key, required this.colorTheme});

  final Key? key;

  final AppColors colorTheme;

  @override
  String toString() {
    return 'OnboardingSecondRouteArgs{key: $key, colorTheme: $colorTheme}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingSecondRouteArgs) return false;
    return key == other.key && colorTheme == other.colorTheme;
  }

  @override
  int get hashCode => key.hashCode ^ colorTheme.hashCode;
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

/// generated route for
/// [StoreScreen]
class StoreRoute extends PageRouteInfo<void> {
  const StoreRoute({List<PageRouteInfo>? children})
    : super(StoreRoute.name, initialChildren: children);

  static const String name = 'StoreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StoreScreen();
    },
  );
}
