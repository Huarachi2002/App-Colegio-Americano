import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PivotStudentsResponse.g.dart';

abstract class PivotStudentsResponse
    implements Built<PivotStudentsResponse, PivotStudentsResponseBuilder> {

  PivotStudentsResponse._();

  @BuiltValueField(wireName: 'father_id')
  int get fatherId;

  @BuiltValueField(wireName: 'student_id')
  int get studentId;

  factory PivotStudentsResponse([updates(
      PivotStudentsResponseBuilder pivotStudentsResponseBuilder)]) = _$PivotStudentsResponse;

  static Serializer<PivotStudentsResponse> get serializer =>
      _$pivotStudentsResponseSerializer;
}