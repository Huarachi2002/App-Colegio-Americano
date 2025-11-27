import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:colegio_americano/src/data/local/preference/LoginPreference.dart';
import 'package:colegio_americano/src/data/remote/LicenseApiService.dart';
import 'package:colegio_americano/src/data/remote/client/BaseClient.dart';
import 'package:colegio_americano/src/data/remote/request/AuthRequest.dart';
import 'package:chopper/chopper.dart';

class AuthorizationInterceptor
    implements ResponseInterceptor, RequestInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) async {
    print("[AUTH INTERCEPTOR] On response...");
    if (response.statusCode == 401 || response.statusCode == 440) {
      print("[AUTH INTERCEPTOR] Is unauthorized!");
      bool isSuccessful = await issueToken();
      if (isSuccessful) {
        GetIt getIt = GetIt.instance;
        LicenseApiService apiService = getIt<LicenseApiService>();
        final client = apiService.client as BaseClient;
        print("[AUTH INTERCEPTOR] Setting retry to true...");
        client.setRetry(true);
      }
    }
    return response;
  }

  Future issueToken() async {
    try {
      print("[AUTH INTERCEPTOR] Issuing new token");
      GetIt getIt = GetIt.instance;
      LicenseApiService apiService = getIt<LicenseApiService>();
      LoginPreference loginPreference = getIt<LoginPreference>();
      final body = AuthRequestBuilder()
        ..codeParent = await loginPreference.fatherErpCode
        ..username = 'licencias'
        ..password = '4d6asd15';
      print(body.build());
      final response = await apiService.issueToken(body.build());
      print("[AUTH INTERCEPTOR] error: ${response.error}");
      print("[AUTH INTERCEPTOR] body: ${response.bodyString}");
      if (response.isSuccessful) {
        final body = response.body!;
        print("[AUTH INTERCEPTOR] Setting access token: ${body.authorization}");
        loginPreference.setLicenseAuthTokenKey(body.authorization!);
        return true;
      }
      return false;
    } catch (e) {
      print("[AUTH INTERCEPTOR] exception: $e");
      return false;
    }
  }

  @override
  FutureOr<Request> onRequest(Request request) async {
    try {
      print("[HEADER INTERCEPTOR] On request...");
      GetIt getIt = GetIt.instance;
      LoginPreference loginPreference = getIt<LoginPreference>();
      if (request.multipart)
        return request.copyWith(headers: {
          'Authorization': await loginPreference.licenseAuthTokenKey,
        });
      final finalBody = request.copyWith(headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': await loginPreference.licenseAuthTokenKey,
        'Accept': '*/*'
      });
      print("Headers: ${finalBody.headers}");
      return finalBody;
    } catch (exception) {
      print("[HEADER INTERCEPTOR] exception: $exception");
      return request;
    }
  }
}
