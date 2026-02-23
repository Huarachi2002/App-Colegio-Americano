import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'StudentsResponse.g.dart';

/// StudentsResponse - Modelo alineado con backend NestJS
/// Campos eliminados (obsoletos): invoice_name, nit, price_list_id,
/// created_by, monthly_payment, pivot
abstract class StudentsResponse
    implements Built<StudentsResponse, StudentsResponseBuilder> {
  StudentsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'erp_code')
  String get erpCode;

  @BuiltValueField(wireName: 'email')
  String? get email;

  @BuiltValueField(wireName: 'state')
  int get state;

  @BuiltValueField(wireName: 'father_id')
  int get fatherId;

  @BuiltValueField(wireName: 'grade_id')
  int? get gradeId;

  @BuiltValueField(wireName: 'parallel_id')
  int? get parallelId;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  factory StudentsResponse(
          [updates(StudentsResponseBuilder studentsResponseBuilder)]) =
      _$StudentsResponse;

  static Serializer<StudentsResponse> get serializer =>
      _$studentsResponseSerializer;
}
