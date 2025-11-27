import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EquipmentsResponse.g.dart';

abstract class EquipmentsResponse
    implements Built<EquipmentsResponse, EquipmentsResponseBuilder> {

  EquipmentsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'short_name')
  String get shortName;

  factory EquipmentsResponse([updates(
      EquipmentsResponseBuilder equipmentsResponseBuilder)]) = _$EquipmentsResponse;

  static Serializer<EquipmentsResponse> get serializer =>
      _$equipmentsResponseSerializer;
}