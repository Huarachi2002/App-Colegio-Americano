import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/AbsencesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/AnnotationsResponse.dart';

part 'AnnotationResponse.g.dart';

abstract class AnnotationResponse
    implements Built<AnnotationResponse, AnnotationResponseBuilder> {

  AnnotationResponse._();

  @BuiltValueField(wireName: 'annotations')
  BuiltList<AnnotationsResponse> get annotations;

  @BuiltValueField(wireName: 'absences')
  BuiltList<AbsencesResponse> get absences;

  factory AnnotationResponse([updates(
      AnnotationResponseBuilder annotationResponseBuilder)]) = _$AnnotationResponse;

  static Serializer<AnnotationResponse> get serializer =>
      _$annotationResponseSerializer;
}