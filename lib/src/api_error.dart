import 'app_error.dart';

class ApiError extends AppError {
  const ApiError(String message, String code) : super(message, code);

  factory ApiError.unauthorized() =>
      const ApiError('Unauthorized access', '401');

  factory ApiError.server() => const ApiError('Server error', '500');

  factory ApiError.noInternet() =>
      const ApiError('No internet connection', 'NO_INTERNET');

  factory ApiError.unknown() =>
      const ApiError('Something went wrong', 'UNKNOWN');
}
