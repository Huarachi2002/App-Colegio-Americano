import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'StudentCodeRequest.g.dart';

/// Request para endpoints que requieren el ERP code del estudiante
/// Compatible con StudentCodeDto del backend NestJS
abstract class StudentCodeRequest
    implements Built<StudentCodeRequest, StudentCodeRequestBuilder> {
  StudentCodeRequest._();

  @BuiltValueField(wireName: 'studentErpCode')
  String get studentErpCode;

  factory StudentCodeRequest(
          [updates(StudentCodeRequestBuilder studentCodeRequestBuilder)]) =
      _$StudentCodeRequest;

  static Serializer<StudentCodeRequest> get serializer =>
      _$studentCodeRequestSerializer;
}
