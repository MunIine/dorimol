import 'package:dio/dio.dart';
import 'package:dorimol/api/api.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/catalog/bloc/catalog_bloc.dart';
import 'package:dorimol/screens/categories/bloc/categories_bloc.dart';
import 'package:dorimol/screens/product/bloc/product_details_bloc.dart';
import 'package:dorimol/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown
  ]);

  await dotenv.load(fileName: ".env");

  final dio = Dio();
  final talker = TalkerFlutter.init();

  talker.debug("Talker initialized");

  Bloc.observer = TalkerBlocObserver(talker: talker);
  dio.interceptors.add(
    TalkerDioLogger(talker: talker, settings: const TalkerDioLoggerSettings(printResponseData: false)),
  );

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerSingleton(dio);
  GetIt.I.registerSingleton(DorimolApiClient.create(dio: dio, apiUrl: AppConfig.apiUrl));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final apiClient = GetIt.I<DorimolApiClient>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoriesBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => CatalogBloc(apiClient: apiClient)),
        BlocProvider(create: (context) => ProductDetailsBloc(apiClient: apiClient)),
      ],
      child: MaterialApp.router(
        theme: lightTheme,
        routerConfig: _appRouter.config(
          navigatorObservers:() => [TalkerRouteObserver(GetIt.I<Talker>())],
        ),
      ),
    );
  }
}
