import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AnnotationsResponse.g.dart';

abstract class AnnotationsResponse
    implements Built<AnnotationsResponse, AnnotationsResponseBuilder> {

  AnnotationsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'subject')
  String get subject;

  @BuiltValueField(wireName: 'text')
  String get text;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  factory AnnotationsResponse([updates(
      AnnotationsResponseBuilder annotationsResponseBuilder)]) = _$AnnotationsResponse;

  static Serializer<AnnotationsResponse> get serializer =>
      _$annotationsResponseSerializer;
}