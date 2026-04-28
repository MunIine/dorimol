import 'package:dio/dio.dart';

class TokenException implements Exception {
  const TokenException(this.message);
  
  final String message;

  @override
  String toString() => 'TokenException: $message';
}

class TokenRefreshException extends TokenException {
  const TokenRefreshException(super.message, {required this.originalRequest, required this.refreshRequest});

  final DioException originalRequest;
  final DioException? refreshRequest;
}