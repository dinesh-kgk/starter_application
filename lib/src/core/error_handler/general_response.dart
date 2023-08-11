sealed class GeneralResponse<T> {
  final int statusCode;
  final T? response;

  GeneralResponse({required this.statusCode, this.response});
}

class SuccessResponse<T> extends GeneralResponse<T> {
  SuccessResponse({required super.statusCode, required super.response});
}

class ErrorResponse<T> extends GeneralResponse<T> {
  final String message;

  ErrorResponse({required super.statusCode, required this.message});
}
