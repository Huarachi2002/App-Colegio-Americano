import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'GradesResponse.g.dart';

abstract class GradesResponse
    implements Built<GradesResponse, GradesResponseBuilder> {

  GradesResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  factory GradesResponse([updates(
      GradesResponseBuilder gradesResponseBuilder)]) = _$GradesResponse;

  static Serializer<GradesResponse> get serializer =>
      _$gradesResponseSerializer;
}