import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AttachmentResponse.g.dart';

abstract class AttachmentResponse
    implements Built<AttachmentResponse, AttachmentResponseBuilder> {

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'fileName')
  String get fileName;

  AttachmentResponse._();

  factory AttachmentResponse([updates(AttachmentResponseBuilder attachmentResponseBuilder)]) =
      _$AttachmentResponse;

  static Serializer<AttachmentResponse> get serializer => _$attachmentResponseSerializer;
}