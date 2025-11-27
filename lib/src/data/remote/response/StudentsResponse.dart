import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/PivotStudentsResponse.dart';

part 'StudentsResponse.g.dart';

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
  String get email;

  @BuiltValueField(wireName: 'invoice_name')
  String get invoiceName;

  @BuiltValueField(wireName: 'nit')
  String get nit;

  @BuiltValueField(wireName: 'state')
  String get state;

  @BuiltValueField(wireName: 'father_id')
  int get fatherId;

  @BuiltValueField(wireName: 'grade_id')
  int get gradeId;

  @BuiltValueField(wireName: 'parallel_id')
  int get parallelId;

  @BuiltValueField(wireName: 'price_list_id')
  int get priceListId;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  @BuiltValueField(wireName: 'monthly_payment')
  int get monthlyPayment;

  @BuiltValueField(wireName: 'pivot')
  PivotStudentsResponse? get pivot;

  factory StudentsResponse(
          [updates(StudentsResponseBuilder studentsResponseBuilder)]) =
      _$StudentsResponse;

  static Serializer<StudentsResponse> get serializer =>
      _$studentsResponseSerializer;
}
