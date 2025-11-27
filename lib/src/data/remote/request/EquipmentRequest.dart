import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/request/EquipmentRequestDetail.dart';

part 'EquipmentRequest.g.dart';

abstract class EquipmentRequest
    implements Built<EquipmentRequest, EquipmentRequestBuilder> {

  EquipmentRequest._();

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'total')
  String get total;

  @BuiltValueField(wireName: 'student_id')
  String get studentId;

  @BuiltValueField(wireName: 'price_list_id')
  String get priceListId;

  @BuiltValueField(wireName: 'token')
  String get token;

  @BuiltValueField(wireName: 'equipment_list_id')
  String get equipmentListId;

  @BuiltValueField(wireName: 'academic_management_id')
  String get academicManagementId;

  @BuiltValueField(wireName: 'details')
  BuiltList<EquipmentRequestDetail> get details;

  factory EquipmentRequest([updates(
      EquipmentRequestBuilder equipmentRequestBuilder)]) = _$EquipmentRequest;

  static Serializer<EquipmentRequest> get serializer =>
      _$equipmentRequestSerializer;
}