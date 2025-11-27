import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestDetailResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestHeaderResponse.dart';
import 'package:built_collection/built_collection.dart';

part 'EquipmentRequestResponse.g.dart';

abstract class EquipmentRequestResponse
    implements
        Built<EquipmentRequestResponse, EquipmentRequestResponseBuilder> {

  EquipmentRequestResponse._();

  @BuiltValueField(wireName: 'header')
  EquipmentRequestHeaderResponse get header;

  @BuiltValueField(wireName: 'details')
  BuiltList<EquipmentRequestDetailResponse> get details;

  factory EquipmentRequestResponse([updates(
      EquipmentRequestResponseBuilder equipmentRequestResponseBuilder)]) = _$EquipmentRequestResponse;

  static Serializer<EquipmentRequestResponse> get serializer =>
      _$equipmentRequestResponseSerializer;
}