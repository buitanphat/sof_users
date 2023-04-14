// ignore_for_file: prefer_typing_uninitialized_variables

class ApiError implements Exception {
  final _message;
  final _prefix;

  ApiError([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class ApiErrorNetwork extends ApiError {
  ApiErrorNetwork([message]) : super(message, "Error During Communication: ");
}

class ApiErrorBadRequest extends ApiError {
  ApiErrorBadRequest([message]) : super(message, "Invalid Request: ");
}

class ApiErrorUnauthorised extends ApiError {
  ApiErrorUnauthorised([message]) : super(message, "Unauthorised: ");
}

class ApiErrorInvalidInput extends ApiError {
  ApiErrorInvalidInput([message]) : super(message, "Invalid Input: ");
}
