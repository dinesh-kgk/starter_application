import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_application/main.dart';
import 'package:starter_application/src/core/error_handler/general_response.dart';
import 'package:starter_application/src/widgets/no_internet_screen.dart';

mixin APIErrorHandler {
  Future<GeneralResponse<T>> handleError<T>(
    Future<T> Function() executor,
  ) async {
    try {
      final response = await executor();
      return SuccessResponse<T>(
        statusCode: 200,
        response: response,
      );
    } on DioException catch (e) {
      if (e.error.toString().contains("SocketException")) {
        final BuildContext currentContext = navigatorKey.currentContext!;
        scheduleMicrotask(
          () => Navigator.of(currentContext).push(
            MaterialPageRoute(
              builder: (context) => const NoInternetScreen(),
            ),
          ),
        );
        return ErrorResponse(statusCode: -100, message: "No Internet");
      } else {
        return ErrorResponse(
          statusCode: e.response!.statusCode!,
          message: e.response!.statusMessage!,
        );
      }
    }
  }
}
