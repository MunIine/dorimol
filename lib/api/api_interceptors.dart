import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dorimol/data/exceptions.dart';
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
          try{
            final accessToken = await _refreshCompleter!.future;
            final clone = await _retryRequest(err.requestOptions, accessToken);
            return handler.resolve(clone);
          } catch (e){
            return handler.reject(err.copyWith(error: e));
          }
        }
        _isRefreshing = true;
        _refreshCompleter = Completer<String>();
        _refreshCompleter!.future.catchError((_){return "dummy";});

        final refreshToken = await tokenService.refreshToken;
        final response = await refreshDio.post(
          '/auth/refresh',
          options: Options(
            headers: {
              'Authorization': 'Bearer $refreshToken',
            }
          )
        );

        final tokens = JwtTokensAnwer.fromJson(response.data);
        tokenService.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);

        _refreshCompleter!.complete(tokens.accessToken);
        _isRefreshing = false;

        final clone = await _retryRequest(err.requestOptions, tokens.accessToken);
        return handler.resolve(clone);
      } catch (newError) {
        if (newError is DioException && newError.response?.statusCode == 401){
          await tokenService.clearTokens();
          final error = err.copyWith(
            error: TokenRefreshException(
              err.response?.data?['detail'] ?? "Refresh token error",
              originalRequest: err,
              refreshRequest: newError
            )
          );

          _isRefreshing = false;
          _refreshCompleter!.completeError(error);

          return handler.reject(error);
        }
        _isRefreshing = false;
        _refreshCompleter!.completeError(newError);
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = tokenService.accessToken;
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options);
  }

  Future<Response> _retryRequest(RequestOptions requestOptions, String accessToken) async {
    final options = requestOptions.copyWith(
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (requestOptions.data is FormData) {
      options.data = (requestOptions.data as FormData).clone();
    }

    return dio.fetch(options);
  }
}