// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<ApiResponse<BuiltList<TypesResponse>>>> getTypes() {
    final Uri $url = Uri.parse('/api/sync/news_types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ApiResponse<BuiltList<TypesResponse>>, TypesResponse>($request);
  }

  @override
  Future<Response<ApiResponse<AcademicManagementResponse>>>
      academicManagement() {
    final Uri $url = Uri.parse('/api/academic_management');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<AcademicManagementResponse>,
        AcademicManagementResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<NewsResponse>>>> getNews(String? body) {
    final Uri $url = Uri.parse('/api/sync/news');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ApiResponse<BuiltList<NewsResponse>>, NewsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<LoginResponse>>> login(LoginRequest body) {
    final Uri $url = Uri.parse('/api/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<LoginResponse>, LoginResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<GradesResponse>>>> grades(String body) {
    final Uri $url = Uri.parse('/api/grades');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ApiResponse<BuiltList<GradesResponse>>, GradesResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<ParallelsResponse>>>> parallels(
      String body) {
    final Uri $url = Uri.parse('/api/parallels');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<BuiltList<ParallelsResponse>>,
        ParallelsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<EquipmentsResponse>>>> equipments(
      String body) {
    final Uri $url = Uri.parse('/api/equipments');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<BuiltList<EquipmentsResponse>>,
        EquipmentsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<PriceListsResponse>>>> priceLists(
      String body) {
    final Uri $url = Uri.parse('/api/price_lists');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<BuiltList<PriceListsResponse>>,
        PriceListsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<EquipmentListsResponse>>>>
      equipmentLists(String body) {
    final Uri $url = Uri.parse('/api/equipment_list');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<BuiltList<EquipmentListsResponse>>,
        EquipmentListsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<StudentsResponse>>>> students() {
    final Uri $url = Uri.parse('/api/students');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<BuiltList<StudentsResponse>>,
        StudentsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<EquipmentPriceListsResponse>>>>
      equipmentPriceLists(String body) {
    final Uri $url = Uri.parse('/api/equipment_prices');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<BuiltList<EquipmentPriceListsResponse>>,
        EquipmentPriceListsResponse>($request);
  }

  @override
  Future<Response<ApiResponse<AnnotationResponse>>> annotation(String body) {
    final Uri $url = Uri.parse('/api/annotation');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ApiResponse<AnnotationResponse>, AnnotationResponse>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<EquipmentRequestResponse>>>>
      getEquipmentRequestHistorical(StudentRequest body) {
    final Uri $url = Uri.parse('/api/equipment_request_historical');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<BuiltList<EquipmentRequestResponse>>,
        EquipmentRequestResponse>($request);
  }

  @override
  Future<Response<ApiResponse<DebtResponse>>> getPendingDebts(
      StudentCodeRequest body) {
    final Uri $url = Uri.parse('/api/pending_debt_consultation');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<DebtResponse>, DebtResponse>($request);
  }

  @override
  Future<Response<ApiResponse<DebtInformationRequest>>> getDebt(
      StudentCodeRequest body) {
    final Uri $url = Uri.parse('/api/debt_consultation');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<DebtInformationRequest>,
        DebtInformationRequest>($request);
  }

  @override
  Future<Response<ApiResponse<String>>> generateQrPayment(
      QrGenerationRequest body) {
    final Uri $url = Uri.parse('/api/generate_qr');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<String>, String>($request);
  }

  @override
  Future<Response<ApiResponse<EquipmentRequestResponse>>> saveEquipmentRequest(
      EquipmentRequest body) {
    final Uri $url = Uri.parse('/api/equipment_request');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<EquipmentRequestResponse>,
        EquipmentRequestResponse>($request);
  }

  @override
  Future<Response<ApiResponse<RegisterDeviceResponse>>> registerDevice(
      RegisterDeviceRequest body) {
    final Uri $url = Uri.parse('/api/device');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<RegisterDeviceResponse>,
        RegisterDeviceResponse>($request);
  }

  @override
  Future<Response<ApiResponse<String>>> updateDevice(UpdateDeviceRequest body) {
    final Uri $url = Uri.parse('/api/update_device_token');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<String>, String>($request);
  }

  @override
  Future<Response<ApiResponse<BuiltList<NotificationResponse>>>>
      getNotifications() {
    final Uri $url = Uri.parse('/api/sync/notifications');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<BuiltList<NotificationResponse>>,
        NotificationResponse>($request);
  }

  @override
  Future<Response<ApiResponse<NotificationResponse>>> getNotificationById(
      String notificationId) {
    final Uri $url = Uri.parse('/api/sync/notification/${notificationId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<NotificationResponse>, NotificationResponse>(
        $request);
  }

  @override
  Future<Response<ApiResponse<VersionResponse>>> getVersions() {
    final Uri $url = Uri.parse('/api/app_last_version');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<VersionResponse>, VersionResponse>($request);
  }

  @override
  Future<Response<ApiResponse<GradesResponse>>> getSubjects(List<BigInt> body) {
    final Uri $url = Uri.parse('/api/get_subjects');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResponse<GradesResponse>, GradesResponse>($request);
  }

  @override
  Future<Response<ApiResponse<String>>> getFatherCode(int id) {
    final Uri $url = Uri.parse('/api/father/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<String>, String>($request);
  }

  @override
  Future<Response<ApiResponse<String>>> getNewsUrl() {
    final Uri $url = Uri.parse('/api/news_url');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<String>, String>($request);
  }

  @override
  Future<Response<ApiResponse<String>>> getDebtStatus(String erpCode) {
    final Uri $url = Uri.parse('/api/debt_state/${erpCode}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<String>, String>($request);
  }

  @override
  Future<Response<ApiResponse<String>>> getExchangeRate() {
    final Uri $url = Uri.parse('/api/exchange_rate');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ApiResponse<String>, String>($request);
  }
}
