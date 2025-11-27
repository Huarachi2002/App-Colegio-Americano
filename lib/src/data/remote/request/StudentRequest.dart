import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'StudentRequest.g.dart';

abstract class StudentRequest
    implements Built<StudentRequest, StudentRequestBuilder> {

  StudentRequest._();

  @BuiltValueField(wireName: 'student_id')
  String get studentId;

  factory StudentRequest([updates(
      StudentRequestBuilder studentRequestBuilder)]) = _$StudentRequest;

  static Serializer<StudentRequest> get serializer =>
      _$studentRequestSerializer;
}