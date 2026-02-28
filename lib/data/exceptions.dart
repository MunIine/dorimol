import 'package:dio/dio.dart';

class TokenException implements Exception {
  const TokenException(this.message);
  
  final String message;

  @override
  String toString() => 'TokenException: $message';
}

class TokenRefreshException extends TokenException {
  const TokenRefreshException(String message, {required this.originalRequest, required this.refreshRequest}) : super(message);

  final DioException originalRequest;
  final DioException? refreshRequest;
}