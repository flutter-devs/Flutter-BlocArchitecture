class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
    return "$_prefix";
  }
}

class NoInternetException extends ApiException {
  NoInternetException([String message]) : super(message, "");
}

class FetchDataException extends ApiException {
  FetchDataException([String message])
      : super(message, "Error During Communication : ");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request : ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request : ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String message]) : super(message, "Invalid Input : ");
}

class ForbiddenException extends ApiException {
  ForbiddenException([String message]) : super(message, "Forbidden : ");
}

class ResourceNotFoundException extends ApiException {
  ResourceNotFoundException([String message])
      : super(message, "Resource not found : ");
}

class ConflictException extends ApiException {
  ConflictException([String message])
      : super(message, "Error due to a conflict : ");
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException([String message])
      : super(message, "Internal Server Error : ");
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException([String message])
      : super(message, "Service Unavailable : ");
}

class CustomInputException extends ApiException {
  CustomInputException([String message]) : super(message, "Error : ");
}
