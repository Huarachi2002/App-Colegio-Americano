import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ParallelsResponse.g.dart';

abstract class ParallelsResponse
    implements Built<ParallelsResponse, ParallelsResponseBuilder> {

  ParallelsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  factory ParallelsResponse([updates(
      ParallelsResponseBuilder parallelsResponseBuilder)]) = _$ParallelsResponse;

  static Serializer<ParallelsResponse> get serializer =>
      _$parallelsResponseSerializer;
}