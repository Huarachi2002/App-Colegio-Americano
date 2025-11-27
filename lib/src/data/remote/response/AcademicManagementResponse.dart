import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AcademicManagementResponse.g.dart';

abstract class AcademicManagementResponse
    implements
        Built<AcademicManagementResponse, AcademicManagementResponseBuilder> {

  AcademicManagementResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'year')
  int get year;

  @BuiltValueField(wireName: 'registration_start_date')
  String get registrationStartDate;

  @BuiltValueField(wireName: 'registration_end_date')
  String get registrationEndDate;

  @BuiltValueField(wireName: 'state')
  String get state;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  factory AcademicManagementResponse([updates(
      AcademicManagementResponseBuilder academicManagementResponseBuilder)]) = _$AcademicManagementResponse;

  static Serializer<AcademicManagementResponse> get serializer =>
      _$academicManagementResponseSerializer;
}