import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

base class BaseClient extends ChopperClient {
  static bool _retry = false;

  BaseClient({
    Uri? baseUrl,
    http.Client? client,
    Iterable interceptors = const [],
    authenticator,
    converter,
    errorConverter,
    Iterable<ChopperService> services = const [],
  }) : super(
    client: client,
    baseUrl: baseUrl,
    interceptors: interceptors,
    authenticator: authenticator,
    converter: converter,
    errorConverter: errorConverter,
    services: services,
  );

  void setRetry(value) => _retry = value;

  @override
  Future<Response<BodyType>> send<BodyType, InnerType>(
      Request request, {
        ConvertRequest? requestConverter,
        ConvertResponse? responseConverter,
      }) async {
    var result;
    int maxAttempts = 2;
    int attempts = 0;
    do {
      attempts++;
      if (_retry) _retry = false;

      try {
        result = await super.send<BodyType, InnerType>(
          request,
          requestConverter: requestConverter,
          responseConverter: responseConverter,
        );
        break;
      } catch (e) {
        print("Error en BaseClient.send: $e");
        if (!_retry || attempts >= maxAttempts) {
          rethrow;
        }
      }
    } while (_retry && attempts < maxAttempts);

    return result;
  }
}
