import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dorimol/data/services/token_service.dart';
import 'package:dorimol/models/jwt_tokens_anwer.dart';

class AuthInterceptor extends Interceptor{
  AuthInterceptor({required this.dio, required this.refreshDio, required this.tokenService});

  final Dio dio;
  final Dio refreshDio;
  final TokenService tokenService;

  bool _isRefreshing = false;
  Completer<String>? _refreshCompleter;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        if (_isRefreshing){
          final accessToken = await _refreshCompleter!.future;
          final options = err.requestOptions.copyWith(
            headers: {
              ...err.requestOptions.headers,
              'Authorization': 'Bearer ${accessToken}',
            }
          );

          final clone = await dio.fetch(options);
          return handler.resolve(clone);
        }
        _isRefreshing = true;
        _refreshCompleter = Completer<String>();

        final refreshToken = await tokenService.refreshToken;
        final response = await refreshDio.post(
          '/auth/refresh',
          options: Options(
            headers: {
              'Authorization': 'Bearer $refreshToken',
            }
          )
        );

        final tokens = JwtTokensAnwer.fromJson(response.data);;
        tokenService.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);

        _refreshCompleter!.complete(tokens.accessToken);
        _isRefreshing = false;

        final options = err.requestOptions.copyWith(
          headers: {
            ...err.requestOptions.headers,
            'Authorization': 'Bearer ${tokens.accessToken}',
          }
        );

        final clone = await dio.fetch(options);
        return handler.resolve(clone);
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 401){
          await tokenService.clearTokens();
        }
        _isRefreshing = false;
        _refreshCompleter!.completeError(e);
        return handler.next(err);
      }
    }

    return handler.next(err);
  }
}