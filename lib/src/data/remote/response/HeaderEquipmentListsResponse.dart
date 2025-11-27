import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'HeaderEquipmentListsResponse.g.dart';

abstract class HeaderEquipmentListsResponse
    implements
        Built<HeaderEquipmentListsResponse,
            HeaderEquipmentListsResponseBuilder> {

  HeaderEquipmentListsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'state')
  String get state;

  @BuiltValueField(wireName: 'academic_management_id')
  int get academicManagementId;

  @BuiltValueField(wireName: 'grade_id')
  int get gradeId;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  factory HeaderEquipmentListsResponse([updates(
      HeaderEquipmentListsResponseBuilder headerEquipmentListsResponseBuilder)]) = _$HeaderEquipmentListsResponse;

  static Serializer<HeaderEquipmentListsResponse> get serializer =>
      _$headerEquipmentListsResponseSerializer;
}