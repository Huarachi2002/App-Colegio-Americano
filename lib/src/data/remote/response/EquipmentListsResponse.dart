import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/DetailsEquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/HeaderEquipmentListsResponse.dart';

part 'EquipmentListsResponse.g.dart';

abstract class EquipmentListsResponse
    implements Built<EquipmentListsResponse, EquipmentListsResponseBuilder> {

  EquipmentListsResponse._();

  @BuiltValueField(wireName: 'header')
  HeaderEquipmentListsResponse get header;

  @BuiltValueField(wireName: 'details')
  BuiltList<DetailsEquipmentListsResponse> get details;

  factory EquipmentListsResponse([updates(
      EquipmentListsResponseBuilder equipmentListsResponseBuilder)]) = _$EquipmentListsResponse;

  static Serializer<EquipmentListsResponse> get serializer =>
      _$equipmentListsResponseSerializer;
}