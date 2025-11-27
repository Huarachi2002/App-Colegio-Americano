import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EquipmentPriceListsResponse.g.dart';

abstract class EquipmentPriceListsResponse
    implements
        Built<EquipmentPriceListsResponse, EquipmentPriceListsResponseBuilder> {

  EquipmentPriceListsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'price_list_id')
  int get priceListId;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  @BuiltValueField(wireName: 'price')
  String get price;

  factory EquipmentPriceListsResponse([updates(
      EquipmentPriceListsResponseBuilder equipmentPriceListsResponseBuilder)]) = _$EquipmentPriceListsResponse;

  static Serializer<EquipmentPriceListsResponse> get serializer =>
      _$equipmentPriceListsResponseSerializer;
}