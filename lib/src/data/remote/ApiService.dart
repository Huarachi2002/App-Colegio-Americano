import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:colegio_americano/src/data/remote/BuiltValueConverter.dart';
import 'package:colegio_americano/src/data/remote/configuration/HeaderInterceptor.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/DebtInformationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/EquipmentRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LoginRequest.dart';
import 'package:colegio_americano/src/data/remote/request/QrGenerationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/RegisterDeviceRequest.dart';
import 'package:colegio_americano/src/data/remote/request/StudentRequest.dart';
import 'package:colegio_americano/src/data/remote/request/UpdateDeviceRequest.dart';
import 'package:colegio_americano/src/data/remote/response/AcademicManagementResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AnnotationResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DebtResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentPriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/GradesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LoginResponse.dart';
import 'package:colegio_americano/src/data/remote/response/NewsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ParallelsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/PriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/RegisterDeviceResponse.dart';
import 'package:colegio_americano/src/data/remote/response/StudentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/TypesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/VersionResponse.dart';
import 'package:colegio_americano/src/data/remote/client/HttpClientFactory.dart';

part 'ApiService.chopper.dart';

@ChopperApi(baseUrl: '/api/')
abstract class ApiService extends ChopperService {
  @Get(path: 'sync/news_types')
  Future<Response<ApiResponse<BuiltList<TypesResponse>>>> getTypes();

  @Get(path: 'academic_management')
  Future<Response<ApiResponse<AcademicManagementResponse>>>
      academicManagement();

  @Post(path: 'sync/news')
  Future<Response<ApiResponse<BuiltList<NewsResponse>>>> getNews(
      @Body() String? body);

  @Post(path: 'login')
  Future<Response<ApiResponse<LoginResponse>>> login(@Body() LoginRequest body);

  @Post(path: 'grades')
  Future<Response<ApiResponse<BuiltList<GradesResponse>>>> grades(
      @Body() String body);

  @Post(path: 'parallels')
  Future<Response<ApiResponse<BuiltList<ParallelsResponse>>>> parallels(
      @Body() String body);

  @Post(path: 'equipments')
  Future<Response<ApiResponse<BuiltList<EquipmentsResponse>>>> equipments(
      @Body() String body);

  @Post(path: 'price_lists')
  Future<Response<ApiResponse<BuiltList<PriceListsResponse>>>> priceLists(
      @Body() String body);

  @Post(path: 'equipment_list')
  Future<Response<ApiResponse<BuiltList<EquipmentListsResponse>>>>
      equipmentLists(@Body() String body);

  @Post(path: 'students')
  Future<Response<ApiResponse<BuiltList<StudentsResponse>>>> students(
      @Body() String body);

  @Post(path: 'equipment_prices')
  Future<Response<ApiResponse<BuiltList<EquipmentPriceListsResponse>>>>
      equipmentPriceLists(@Body() String body);

  @Post(path: 'annotation')
  Future<Response<ApiResponse<AnnotationResponse>>> annotation(
      @Body() String body);

  @Post(path: 'equipment_request_historical')
  Future<Response<ApiResponse<BuiltList<EquipmentRequestResponse>>>>
      getEquipmentRequestHistorical(@Body() StudentRequest body);

  @Post(path: 'pending_debt_consultation')
  Future<Response<ApiResponse<DebtResponse>>> getPendingDebts(
      @Body() String body);

  @Post(
      path:
          'debt_consultation') // TODO: Check if this is correct in Backend -- Cambiar cuando acabe las pruebas a debt_consultation
  Future<Response<ApiResponse<DebtInformationRequest>>> getDebt(
      @Body() String body);

  @Post(path: 'generate_qr_test')
  Future<Response<ApiResponse<String>>> generateQrPayment(
      @Body() QrGenerationRequest body);

  @Post(path: 'equipment_request')
  Future<Response<ApiResponse<EquipmentRequestResponse>>> saveEquipmentRequest(
      @Body() EquipmentRequest body);

  @Post(path: 'device')
  Future<Response<ApiResponse<RegisterDeviceResponse>>> registerDevice(
      @Body() RegisterDeviceRequest body);

  @Post(path: 'update_device_token')
  Future<Response<ApiResponse<String>>> updateDevice(
      @Body() UpdateDeviceRequest body);

  @Get(path: 'sync/notifications')
  Future<Response<ApiResponse<BuiltList<NotificationResponse>>>>
      getNotifications();

  @Get(path: 'sync/notification/{notificationId}')
  Future<Response<ApiResponse<NotificationResponse>>> getNotificationById(
      @Path() String notificationId);

  @Get(path: 'app_last_version')
  Future<Response<ApiResponse<VersionResponse>>> getVersions();

  @Post(path: 'get_subjects')
  Future<Response<ApiResponse<GradesResponse>>> getSubjects(
      @Body() List<BigInt> body);

  @Get(path: 'father/{id}')
  Future<Response<ApiResponse<String>>> getFatherCode(@Path() int id);

  @Get(path: 'news_url')
  Future<Response<ApiResponse<String>>> getNewsUrl();

  @Get(path: 'debt_state/{erpCode}')
  Future<Response<ApiResponse<String>>> getDebtStatus(@Path() String erpCode);

  @Get(path: 'exchange_rate')
  Future<Response<ApiResponse<String>>> getExchangeRate();

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(SyncConstants.SERVER_URL),
        client: HttpClientFactory.createIOClient(),
        services: [
          _$ApiService(),
        ],
        converter: BuiltValueConverter(),
        interceptors: [HttpLoggingInterceptor(), HeaderInterceptor()]);
    return _$ApiService(client);
  }
}
