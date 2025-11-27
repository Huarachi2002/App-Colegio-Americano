// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LicenseApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$LicenseApiService extends LicenseApiService {
  _$LicenseApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = LicenseApiService;

  @override
  Future<Response<AuthResponse>> issueToken(AuthRequest body) {
    final Uri $url = Uri.parse('/rest/client/auth');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthResponse, AuthResponse>($request);
  }

  @override
  Future<Response<BuiltList<LicenseListResponse>>> getLicenseList(
      LicenseListRequest body) {
    final Uri $url = Uri.parse('/rest/client/license/listado');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<BuiltList<LicenseListResponse>, LicenseListResponse>($request);
  }

  @override
  Future<Response<LicenseResponse>> setLicense(
    String body,
    dynamic file1,
    dynamic file2,
    dynamic file3,
    dynamic file4,
    String? fileS1,
    String? fileS2,
    String? fileS3,
    String? fileS4,
  ) {
    final Uri $url = Uri.parse('/rest/client/license');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/form-data',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'entity',
        body,
      ),
      PartValue<String?>(
        'file',
        fileS1,
      ),
      PartValue<String?>(
        'file',
        fileS2,
      ),
      PartValue<String?>(
        'file',
        fileS3,
      ),
      PartValue<String?>(
        'file',
        fileS4,
      ),
      PartValueFile<dynamic>(
        'file',
        file1,
      ),
      PartValueFile<dynamic>(
        'file',
        file2,
      ),
      PartValueFile<dynamic>(
        'file',
        file3,
      ),
      PartValueFile<dynamic>(
        'file',
        file4,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<LicenseResponse, LicenseResponse>($request);
  }

  @override
  Future<Response<LicenseResponse>> updateLicense(
    String body,
    dynamic file1,
    dynamic file2,
    dynamic file3,
    dynamic file4,
    String? fileS1,
    String? fileS2,
    String? fileS3,
    String? fileS4,
  ) {
    final Uri $url = Uri.parse('/rest/client/license');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/form-data',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'entity',
        body,
      ),
      PartValue<String?>(
        'file',
        fileS1,
      ),
      PartValue<String?>(
        'file',
        fileS2,
      ),
      PartValue<String?>(
        'file',
        fileS3,
      ),
      PartValue<String?>(
        'file',
        fileS4,
      ),
      PartValueFile<dynamic>(
        'file',
        file1,
      ),
      PartValueFile<dynamic>(
        'file',
        file2,
      ),
      PartValueFile<dynamic>(
        'file',
        file3,
      ),
      PartValueFile<dynamic>(
        'file',
        file4,
      ),
    ];
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<LicenseResponse, LicenseResponse>($request);
  }

  @override
  Future<Response<LicenseResponse>> updateLicense2(
    String body,
    String file,
  ) {
    final Uri $url = Uri.parse('/rest/client/license');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/form-data',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'entity',
        body,
      ),
      PartValue<String>(
        'file',
        file,
      ),
    ];
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<LicenseResponse, LicenseResponse>($request);
  }

  @override
  Future<Response<LicenseValidationKeyResponse>> getValidationKey() {
    final Uri $url = Uri.parse('/rest/client/license/generarCodigo');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<LicenseValidationKeyResponse,
        LicenseValidationKeyResponse>($request);
  }
}
