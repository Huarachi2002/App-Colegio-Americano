import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'PriceListsResponse.g.dart';

abstract class PriceListsResponse
    implements Built<PriceListsResponse, PriceListsResponseBuilder> {

  PriceListsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  factory PriceListsResponse([updates(
      PriceListsResponseBuilder priceListsResponseBuilder)]) = _$PriceListsResponse;

  static Serializer<PriceListsResponse> get serializer =>
      _$priceListsResponseSerializer;
}