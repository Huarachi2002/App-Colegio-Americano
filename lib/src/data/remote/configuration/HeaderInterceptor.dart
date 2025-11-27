import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:colegio_americano/src/data/local/preference/LoginPreference.dart';
import 'package:get_it/get_it.dart';

class HeaderInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    try {
      GetIt getIt = GetIt.instance;
      LoginPreference loginPreference = getIt<LoginPreference>();
      return request.copyWith(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + await loginPreference.apiToken,
        'Accept': 'application/json'
      });
    } catch (exception) {
      return request;
    }
  }
}
