import 'package:dio/dio.dart';
import 'package:dorimol/api/api.dart';
import 'package:dorimol/screens/categories/categories_screen.dart';
import 'package:dorimol/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final client = DorimolApiClient.create(apiUrl: dotenv.env['API_URL']);

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: CategoriesScreen(),
    );
  }
}