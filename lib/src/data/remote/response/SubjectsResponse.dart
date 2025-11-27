import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SubjectsResponse.g.dart';

abstract class SubjectsResponse
    implements Built<SubjectsResponse, SubjectsResponseBuilder> {

  SubjectsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  factory SubjectsResponse([updates(
      SubjectsResponseBuilder subjectsResponseBuilder)]) = _$SubjectsResponse;

  static Serializer<SubjectsResponse> get serializer =>
      _$subjectsResponseSerializer;
}