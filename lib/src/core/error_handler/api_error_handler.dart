import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:starter_application/main.dart';
import 'package:starter_application/src/core/error_handler/general_response.dart';
import 'package:starter_application/src/widgets/no_internet_screen.dart';

mixin APIErrorHandler {
  Future<GeneralResponse<T>> handleError<T>(
    Future<Response<T>> Function() executor,
  ) async {
    try {
      final response = await executor();
      if (response.isSuccessful) {
        return SuccessResponse<T>(
          statusCode: response.statusCode,
          response: response.body,
        );
      } else {
        return ErrorResponse(
          statusCode: response.statusCode,
          message: response.bodyString,
        );
      }
    } on SocketException catch (_) {
      final BuildContext currentContext = navigatorKey.currentContext!;
      scheduleMicrotask(
        () => Navigator.of(currentContext).push(
          MaterialPageRoute(
            builder: (context) => const NoInternetScreen(),
          ),
        ),
      );
      return ErrorResponse(statusCode: -100, message: "No Internet");
    }
  }
}
