import 'package:dorimol/api/api.dart';
import 'package:dorimol/data/services/auth_sevice.dart';
import 'package:dorimol/screens/authorization/bloc/authorization_bloc.dart';
import 'package:dorimol/screens/cart/bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/screens/categories/bloc/categories_bloc.dart';
import 'package:dorimol/screens/product/bloc/product_details_bloc.dart';
import 'package:dorimol/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.config, required this.currentVersion});

  final Map<String, String> config;
  final String currentVersion;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final apiClient = GetIt.I<DorimolApiClient>();
    final authService = GetIt.I<AuthService>();
    final minVersion = widget.config["min_app_version"] ?? "0.0.0";
    final maintenance = bool.parse(widget.config["maintenance_mode"] ?? "false");

    if (isOutdated(widget.currentVersion, minVersion)) {
      return const MaterialApp(
        home: BlockedScreen(
          message: "Требуется обновление приложения. Пожалуйста, установите последнюю версию.",
        ),
      );
    }
    if (maintenance) {
      return const MaterialApp(
        home: BlockedScreen(
          message: "Ведутся технические работы. Попробуйте позже.",
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoriesBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => CatalogBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => ProductDetailsBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => CartBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => AuthorizationBloc(authService: authService)),
      ],
      child: MaterialApp.router(
        theme: lightTheme,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
        ),
      ),
    );
  }

  bool isOutdated(String current, String minRequired) {
    List<int> c = current.split('.').map(int.parse).toList();
    List<int> m = minRequired.split('.').map(int.parse).toList();
    for (int i = 0; i < 3; i++) {
      if (c[i] < m[i]) return true;
      if (c[i] > m[i]) return false;
    }
    return false;
  }

}

class BlockedScreen extends StatelessWidget {
  const BlockedScreen({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_amber_rounded, size: 64, color: Colors.orange),
              const SizedBox(height: 24),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}