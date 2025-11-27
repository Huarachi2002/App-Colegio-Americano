import 'package:built_value/built_value.dart';
import 'package:chopper/chopper.dart';
import 'package:colegio_americano/src/data/remote/BuiltValueConverter.dart';
import 'package:colegio_americano/src/data/remote/client/HttpClientFactory.dart';
import 'package:colegio_americano/src/data/remote/ExternalBuiltValueConverter.dart';
import 'package:colegio_americano/src/data/remote/configuration/HeaderInterceptor.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/DebtInformationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/EquipmentRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LoginRequest.dart';
import 'package:colegio_americano/src/data/remote/request/QrGenerationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/RegisterDeviceRequest.dart';
import 'package:colegio_americano/src/data/remote/request/StudentRequest.dart';
import 'package:colegio_americano/src/data/remote/request/SubjectRequest.dart';
import 'package:colegio_americano/src/data/remote/request/UpdateDeviceRequest.dart';
import 'package:colegio_americano/src/data/remote/response/AnnotationResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/DebtResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestResponse.dart';
import 'package:colegio_americano/src/data/remote/response/GradesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LoginResponse.dart';
import 'package:colegio_americano/src/data/remote/response/NewsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ParallelsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/PriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/RegisterDeviceResponse.dart';
import 'package:colegio_americano/src/data/remote/response/StudentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentPriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AcademicManagementResponse.dart';
import 'package:colegio_americano/src/data/remote/response/TypesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/VersionResponse.dart';

part 'ExternalApiService.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class ExternalApiService extends ChopperService {
  @Get(path: 'test.json')
  Future<Response<ApiResponse<BuiltList<LicenseResponse>>>> getLicenses();

  static ExternalApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(SyncConstants.EXTERNAL_SERVER_URL),
        client: HttpClientFactory.createIOClient(),
        services: [
          _$ExternalApiService(),
        ],
        converter: BuiltValueConverter(),
        interceptors: [HttpLoggingInterceptor(), HeaderInterceptor()]);
    return _$ExternalApiService(client);
  }
}
