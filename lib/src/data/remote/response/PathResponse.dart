import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PathResponse.g.dart';

abstract class PathResponse
    implements Built<PathResponse, PathResponseBuilder> {

  PathResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'path')
  String get path;

  factory PathResponse(
      [updates(PathResponseBuilder pathResponseBuilder)]) = _$PathResponse;

  static Serializer<PathResponse> get serializer => _$pathResponseSerializer;
}