import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SubjectRequest.g.dart';

abstract class SubjectRequest
    implements Built<SubjectRequest, SubjectRequestBuilder> {

  SubjectRequest._();

  @BuiltValueField(wireName: 'id')
    BigInt get id;

    @BuiltValueField(wireName: 'name')
    String get name;

  factory SubjectRequest([updates(
     SubjectRequestBuilder subjectRequestBuilder)]) = _$SubjectRequest;

  static Serializer<SubjectRequest> get serializer =>
      _$subjectRequestSerializer;
}
