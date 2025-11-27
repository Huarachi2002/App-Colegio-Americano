import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:colegio_americano/src/data/remote/request/AuthRequest.dart';
import 'package:colegio_americano/src/data/remote/request/ChargeDetailRequest.dart';
import 'package:colegio_americano/src/data/remote/request/DebtInformationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/EquipmentRequest.dart';
import 'package:colegio_americano/src/data/remote/request/EquipmentRequestDetail.dart';
import 'package:colegio_americano/src/data/remote/request/InvoiceDetailRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LicenseListRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LicenseRequest.dart';
import 'package:colegio_americano/src/data/remote/request/LoginRequest.dart';
import 'package:colegio_americano/src/data/remote/request/QrGenerationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/RegisterDeviceRequest.dart';
import 'package:colegio_americano/src/data/remote/request/StudentRequest.dart';
import 'package:colegio_americano/src/data/remote/request/UpdateDeviceRequest.dart';
import 'package:colegio_americano/src/data/remote/response/AbsencesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AcademicManagementResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AnnotationResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AnnotationsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AttachmentResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AuthResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DebtDetailResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DebtResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DetailsEquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentPriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestDetailResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestHeaderResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/GradesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/HeaderEquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseValidationKeyResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LoginResponse.dart';
import 'package:colegio_americano/src/data/remote/response/NewsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ParallelsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/PathResponse.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/PivotStudentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/PriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/RegisterDeviceResponse.dart';
import 'package:colegio_americano/src/data/remote/response/StudentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/TypesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/VersionResponse.dart';
import 'package:colegio_americano/src/data/remote/response/SubjectsResponse.dart';
import 'package:colegio_americano/src/data/remote/request/SubjectRequest.dart';
import 'package:colegio_americano/src/data/remote/response/GradesResponse.dart';
import 'package:colegio_americano/src/data/remote/request/GradeRequest.dart';
import 'package:colegio_americano/src/ui/screen/LicenseListScreen.dart';

part 'Serializers.g.dart';

@SerializersFor(const [
  LoginRequest,
  ApiResponse,
  LoginResponse,
  PathResponse,
  NewsResponse,
  PathResponse,
  TypesResponse,
  GradesResponse,
  ParallelsResponse,
  EquipmentsResponse,
  PriceListsResponse,
  EquipmentListsResponse,
  HeaderEquipmentListsResponse,
  DetailsEquipmentListsResponse,
  StudentsResponse,
  PivotStudentsResponse,
  EquipmentPriceListsResponse,
  AcademicManagementResponse,
  AnnotationResponse,
  AnnotationsResponse,
  AbsencesResponse,
  StudentRequest,
  EquipmentRequestDetailResponse,
  EquipmentRequestHeaderResponse,
  EquipmentRequestResponse,
  DebtDetailResponse,
  DebtResponse,
  InvoiceDetailRequest,
  ChargeDetailRequest,
  DebtInformationRequest,
  QrGenerationRequest,
  EquipmentRequestDetail,
  EquipmentRequest,
  RegisterDeviceRequest,
  RegisterDeviceResponse,
  UpdateDeviceRequest,
  NotificationResponse,
  VersionResponse,
  SubjectsResponse,
  SubjectRequest,
  GradesResponse,
  GradeRequest,
  LicenseResponse,
  LicenseRequest,
  LicenseListResponse,
  LicenseListRequest,
  AuthRequest,
  AuthResponse,
  AttachmentResponse,
  LicenseValidationKeyResponse,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PathResponse)]),
          () => new ListBuilder<PathResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(NewsResponse)]),
          () => new ListBuilder<NewsResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TypesResponse)]),
          () => new ListBuilder<TypesResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GradesResponse)]),
          () => new ListBuilder<GradesResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ParallelsResponse)]),
          () => new ListBuilder<ParallelsResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(EquipmentsResponse)]),
          () => new ListBuilder<EquipmentsResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PriceListsResponse)]),
          () => new ListBuilder<PriceListsResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(DetailsEquipmentListsResponse)]),
          () => new ListBuilder<DetailsEquipmentListsResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(EquipmentPriceListsResponse)]),
          () => new ListBuilder<EquipmentPriceListsResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AnnotationsResponse)]),
          () => new ListBuilder<AnnotationsResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AbsencesResponse)]),
          () => new ListBuilder<AbsencesResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(EquipmentRequestDetailResponse)]),
          () => new ListBuilder<EquipmentRequestDetailResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(EquipmentRequestResponse)]),
          () => new ListBuilder<EquipmentRequestResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DebtDetailResponse)]),
          () => new ListBuilder<DebtDetailResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(EquipmentRequestDetail)]),
          () => new ListBuilder<EquipmentRequestDetail>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(NotificationResponse)]),
          () => new ListBuilder<NotificationResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SubjectsResponse)]),
          () => new ListBuilder<SubjectsResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GradesResponse)]),
          () => new ListBuilder<GradesResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LicenseResponse)]),
          () => new ListBuilder<LicenseResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(LicenseListResponse)]),
          () => new ListBuilder<LicenseListResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LicenseListRequest)]),
          () => new ListBuilder<LicenseListRequest>()))
    .build();
