import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String apiUrl = dotenv.env['API_URL']!;
  double stepInCart (String unit) {
    switch (unit) {
      case "кг":
        return 0.5;
      default:
        return 1;
    }
  }
}