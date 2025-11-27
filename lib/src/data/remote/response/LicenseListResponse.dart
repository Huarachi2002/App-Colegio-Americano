import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/AttachmentResponse.dart';

part 'LicenseListResponse.g.dart';

abstract class LicenseListResponse
    implements Built<LicenseListResponse, LicenseListResponseBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'fecha')
  DateTime? get date;

  @BuiltValueField(wireName: 'codigoEstudiante')
  int? get studentCode;

  @BuiltValueField(wireName: 'nombreEstudiante')
  String? get studentName;

  @BuiltValueField(wireName: 'tipoLicencia')
  int? get licenseType;

  @BuiltValueField(wireName: 'tipoPeriodo')
  int? get licensePeriod;

  @BuiltValueField(wireName: 'cantidadPeriodo')
  int? get quantityPeriod;

  @BuiltValueField(wireName: 'fechaInicial')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'endDate')
  DateTime? get endDate;

  @BuiltValueField(wireName: 'tieneExamen')
  bool? get test;

  @BuiltValueField(wireName: 'examenDe')
  String? get subject;

  @BuiltValueField(wireName: 'motivo')
  String? get reason;

  @BuiltValueField(wireName: 'solicitante')
  String? get requesterName;

  @BuiltValueField(wireName: 'motivoDelRechazo')
  String? get rejectionReason;

  @BuiltValueField(wireName: 'estadoId')
  int get statusId;

  @BuiltValueField(wireName: 'estado')
  String get status;

  @BuiltValueField(wireName: 'archivos')
  BuiltList<AttachmentResponse>? get attachments;

  LicenseListResponse._();

  factory LicenseListResponse(
          [updates(LicenseListResponseBuilder licenseListResponseBuilder)]) =
      _$LicenseListResponse;

  static Serializer<LicenseListResponse> get serializer =>
      _$licenseListResponseSerializer;
}
