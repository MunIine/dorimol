import 'package:dio/dio.dart';
import 'package:dorimol/api/api.dart';
import 'package:dorimol/app.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/data/services/auth_sevice.dart';
import 'package:dorimol/screens/errors/error_screen.dart';
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
  GetIt.I.registerSingleton(AuthService());

  try {
    final config = await GetIt.I<DorimolApiClient>().fetchConfig();

    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    
    runApp(MyApp(config: config, currentVersion: currentVersion));
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
