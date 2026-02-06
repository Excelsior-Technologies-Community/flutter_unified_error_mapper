import 'package:dio/dio.dart';

import 'app_error.dart';
import 'api_error.dart';
import 'ui_error.dart';
import 'error_codes.dart';

class ErrorMapper {
  static AppError map(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;

      if (statusCode == 401) {
        return ApiError.unauthorized();
      }

      if (statusCode != null && statusCode >= 500) {
        return ApiError.server();
      }

      if (error.type == DioExceptionType.connectionError) {
        return ApiError.noInternet();
      }
    }

    return ApiError.unknown();
  }

  static UiError toUi(AppError error) {
    switch (error.code) {
      case ErrorCodes.unauthorized:
        return const UiError(
          title: 'Unauthorized',
          message: 'Please login again.',
        );

      case ErrorCodes.noInternet:
        return const UiError(
          title: 'No Internet',
          message: 'Check your connection and try again.',
        );

      case ErrorCodes.server:
        return const UiError(
          title: 'Server Error',
          message: 'Please try again later.',
        );

      default:
        return const UiError(title: 'Error', message: 'Something went wrong.');
    }
  }
}
