class ApiException implements Exception {
  int code;
  String messageId;

  ApiException(this.code, this.messageId);
}


class UnknownApiException extends ApiException{
  UnknownApiException() : super(-2000, "unknown_exception");
}

class IoApiException extends ApiException{
  IoApiException(): super(-1000, 'connect_exception');
}