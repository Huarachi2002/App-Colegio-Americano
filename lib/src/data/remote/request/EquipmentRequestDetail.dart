import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EquipmentRequestDetail.g.dart';

abstract class EquipmentRequestDetail
    implements Built<EquipmentRequestDetail, EquipmentRequestDetailBuilder> {

  EquipmentRequestDetail._();

  @BuiltValueField(wireName: 'quantity')
  String get quantity;

  @BuiltValueField(wireName: 'price')
  String get price;

  @BuiltValueField(wireName: 'subtotal')
  String get subtotal;

  @BuiltValueField(wireName: 'product_id')
  String get productId;

  factory EquipmentRequestDetail([updates(
      EquipmentRequestDetailBuilder equipmentRequestDetailBuilder)]) = _$EquipmentRequestDetail;

  static Serializer<EquipmentRequestDetail> get serializer =>
      _$equipmentRequestDetailSerializer;
}