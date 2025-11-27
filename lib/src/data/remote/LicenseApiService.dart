import 'package:built_value/built_value.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:colegio_americano/src/data/remote/LicenseBuiltValueConverter.dart';
import 'package:colegio_americano/src/data/remote/client/HttpClientFactory.dart';
import 'package:colegio_americano/src/data/remote/client/BaseClient.dart';
import 'package:colegio_americano/src/data/remote/configuration/AuthorizationInterceptor.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/AuthRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LicenseListRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LicenseRequest.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AuthResponse.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseValidationKeyResponse.dart';

part 'LicenseApiService.chopper.dart';

@ChopperApi(baseUrl: SyncConstants.LICENSE_ENDPOINT)
abstract class LicenseApiService extends ChopperService {
  @Post(path: 'auth', optionalBody: true)
  Future<Response<AuthResponse>> issueToken(@Body() AuthRequest body);

  @Post(path: 'license/listado', optionalBody: true)
  Future<Response<BuiltList<LicenseListResponse>>> getLicenseList(
      @Body() LicenseListRequest body);

  @nullable
  @multipart
  @Post(
      path: 'license',
      optionalBody: true,
      headers: {'Content-Type': 'multipart/form-data'})
  Future<Response<LicenseResponse>> setLicense(
      @Part('entity') String body,
      @PartFile("file") dynamic file1,
      @PartFile("file") dynamic file2,
      @PartFile("file") dynamic file3,
      @PartFile("file") dynamic file4,
      @Part("file") String? fileS1,
      @Part("file") String? fileS2,
      @Part("file") String? fileS3,
      @Part("file") String? fileS4);

  @nullable
  @multipart
  @Put(
      path: 'license',
      optionalBody: true,
      headers: {'Content-Type': 'multipart/form-data'})
  Future<Response<LicenseResponse>> updateLicense(
      @Part('entity') String body,
      @PartFile("file") dynamic file1,
      @PartFile("file") dynamic file2,
      @PartFile("file") dynamic file3,
      @PartFile("file") dynamic file4,
      @Part("file") String? fileS1,
      @Part("file") String? fileS2,
      @Part("file") String? fileS3,
      @Part("file") String? fileS4);

  @multipart
  @Put(
      path: 'license',
      optionalBody: true,
      headers: {'Content-Type': 'multipart/form-data'})
  Future<Response<LicenseResponse>> updateLicense2(
      @Part('entity') String body, @Part("file") String file);

  @Get(path: 'license/generarCodigo')
  Future<Response<LicenseValidationKeyResponse>> getValidationKey();

  static LicenseApiService create() {
    final client = BaseClient(
      baseUrl: Uri.parse(SyncConstants.LICENSE_SERVER_HOST),
      client: HttpClientFactory.createIOClient(),
      services: [
        _$LicenseApiService(),
      ],
      converter: LicenseBuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor(), AuthorizationInterceptor()],
    );
    return _$LicenseApiService(client);
  }
}
