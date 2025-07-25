import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dorimol/screens/errors/default_error.dart';
import 'package:dorimol/screens/errors/internet_error.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.exception});

  final Exception exception;

  @override
  Widget build(BuildContext context) {
    if (exception is DioException){
      final dioException = exception as DioException;
      if (dioException.type == DioExceptionType.connectionError) {
        return InternetError();
      }
      return DefaultError();
    }
    return DefaultError();
  }
}