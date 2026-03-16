import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String apiUrl = dotenv.env['API_URL']!;
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: apiUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  );
  static final maxUploadFileSize = 5 * 1024 * 1024; // 5 MB
  static final allowedUploadFileExtensions = ['png', 'jpg', 'jpeg', 'webp'];
  double stepInCart (String unit) {
    switch (unit) {
      case "кг":
        return 0.5;
      default:
        return 1;
    }
  }
}