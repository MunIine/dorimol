import 'package:dio/dio.dart';
import 'package:dorimol/api/private_api_client.dart';
import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/api/api_interceptors.dart';
import 'package:dorimol/app.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/data/services/auth_service.dart';
import 'package:dorimol/data/services/config_service.dart';
import 'package:dorimol/data/services/storage_service.dart';
import 'package:dorimol/data/services/token_service.dart';
import 'package:dorimol/features/errors/error_screen.dart';
import 'package:dorimol/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dorimol/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: ".env");

  final publicDio = Dio(AppConfig.baseOptions);
  final privateDio = Dio(AppConfig.baseOptions);
  final refreshDio = Dio(AppConfig.baseOptions);
  final talker = TalkerFlutter.init();
  final storageService = StorageService();
  final tokenService = TokenService(storageService: storageService, talker: talker);

  await tokenService.init();

  talker.debug("Talker initialized");

  Bloc.observer = TalkerBlocObserver(talker: talker);
  refreshDio.interceptors.add(
    TalkerDioLogger(talker: talker, settings: const TalkerDioLoggerSettings(printResponseData: false)),
  );
  publicDio.interceptors.add(
    TalkerDioLogger(talker: talker, settings: const TalkerDioLoggerSettings(printResponseData: false)),
  );
  privateDio.interceptors.addAll([
    TalkerDioLogger(talker: talker, settings: const TalkerDioLoggerSettings(printResponseData: false)),
    AuthInterceptor(dio: publicDio, refreshDio: refreshDio, tokenService: tokenService)
  ]);

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerSingleton(publicDio);
  GetIt.I.registerSingleton(storageService);
  GetIt.I.registerSingleton(tokenService);
  GetIt.I.registerSingleton(PublicApiClient.create(dio: publicDio, apiUrl: AppConfig.apiUrl));
  GetIt.I.registerSingleton(PrivateApiClient.create(dio: privateDio, apiUrl: AppConfig.apiUrl));
  GetIt.I.registerSingleton(AuthService(apiClient: GetIt.I<PublicApiClient>()));

  try {
    final serverConfig = await GetIt.I<PublicApiClient>().fetchConfig();
    GetIt.I.registerSingleton(ConfigService(serverConfig: serverConfig));

    final packageInfo = await PackageInfo.fromPlatform();
    
    runApp(MyApp(currentVersion: packageInfo.version));
  } on Exception catch (e) {
    talker.error("Failed to fetch config: $e");
    runApp(
      MaterialApp(
        theme: lightTheme,
        home: ErrorScreen(exception: e, disabledButton: true)
      ),
    );
  }
}
