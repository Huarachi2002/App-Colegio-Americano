import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:colegio_americano/src/data/remote/request/SubjectRequest.dart';

part 'GradeRequest.g.dart';

abstract class GradeRequest
    implements Built<GradeRequest, GradeRequestBuilder> {

  GradeRequest._();

  @BuiltValueField(wireName: 'id')
  BigInt get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'subjects')
  SubjectRequest get subjects;

  factory GradeRequest([updates(
      GradeRequestBuilder gradeRequestBuilder)]) = _$GradeRequest;

  static Serializer<GradeRequest> get serializer =>
      _$gradeRequestSerializer;
}
