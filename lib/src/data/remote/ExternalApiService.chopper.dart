// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExternalApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ExternalApiService extends ExternalApiService {
  _$ExternalApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ExternalApiService;

  @override
  Future<Response<ApiResponse<BuiltList<LicenseResponse>>>> getLicenses() {
    final Uri $url = Uri.parse('/test.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<BuiltList<LicenseResponse>>,
        LicenseResponse>($request);
  }
}
