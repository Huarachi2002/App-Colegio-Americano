import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EquipmentRequestHeaderResponse.g.dart';

abstract class EquipmentRequestHeaderResponse
    implements
        Built<EquipmentRequestHeaderResponse,
            EquipmentRequestHeaderResponseBuilder> {
  EquipmentRequestHeaderResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'state')
  String get state;

  @BuiltValueField(wireName: 'erp_code')
  String? get erpCode;

  @BuiltValueField(wireName: 'token')
  String get token;

  @BuiltValueField(wireName: 'total')
  String get total;

  @BuiltValueField(wireName: 'price_list_id')
  int get priceListId;

  @BuiltValueField(wireName: 'equipment_list_id')
  int get equipmentListId;

  @BuiltValueField(wireName: 'student_id')
  int get studentId;

  @BuiltValueField(wireName: 'employee_id')
  int get employeeId;

  @BuiltValueField(wireName: 'academic_management_id')
  int get academicManagementId;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  factory EquipmentRequestHeaderResponse(
          [updates(
              EquipmentRequestHeaderResponseBuilder
                  equipmentRequestHeaderResponseBuilder)]) =
      _$EquipmentRequestHeaderResponse;

  static Serializer<EquipmentRequestHeaderResponse> get serializer =>
      _$equipmentRequestHeaderResponseSerializer;
}
