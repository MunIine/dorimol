import 'package:dorimol/api/api.dart';
import 'package:dorimol/data/app_config.dart';
import 'package:dorimol/screens/categories/bloc/categories_bloc.dart';
import 'package:dorimol/screens/categories/categories_screen.dart';
import 'package:dorimol/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(apiClient: DorimolApiClient.create(apiUrl: AppConfig.apiUrl)),
      child: MaterialApp(theme: lightTheme, home: CategoriesScreen()),
    );
  }
}
