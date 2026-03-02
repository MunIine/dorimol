import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/data/services/auth_service.dart';
import 'package:dorimol/data/services/token_service.dart';
import 'package:dorimol/features/authorization/bloc/authorization_bloc.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
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
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  Key _appKey = UniqueKey();

  void logout() async {
    final tokenService = GetIt.I<TokenService>();
    await tokenService.clearTokens();
    setState(() {
      _appKey = UniqueKey();
    });
    _appRouter.replaceAll([const AuthorizationRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final publicApiClient = GetIt.I<PublicApiClient>();
    final authService = GetIt.I<AuthService>();
    final tokenService = GetIt.I<TokenService>();
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
      key: _appKey,
      providers: [
        BlocProvider(create: (context) => CartBloc(apiClient: publicApiClient)),
        BlocProvider(create: (context) => AuthorizationBloc(authService: authService, tokenService: tokenService)),
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