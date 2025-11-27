import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'TypesResponse.g.dart';

abstract class TypesResponse
    implements Built<TypesResponse, TypesResponseBuilder> {

  TypesResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  factory TypesResponse(
      [updates(TypesResponseBuilder typesResponseBuilder)]) = _$TypesResponse;

  static Serializer<TypesResponse> get serializer => _$typesResponseSerializer;
}