import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'EquipmentRequestDetailResponse.g.dart';

abstract class EquipmentRequestDetailResponse
    implements
        Built<
            EquipmentRequestDetailResponse,
            EquipmentRequestDetailResponseBuilder> {

  EquipmentRequestDetailResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'quantity')
  String get quantity;

  @BuiltValueField(wireName: 'price')
  String get price;

  @BuiltValueField(wireName: 'subtotal')
  String get subtotal;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  @BuiltValueField(wireName: 'equipment_request_id')
  int get equipmentRequestId;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;


  factory EquipmentRequestDetailResponse([updates(
      EquipmentRequestDetailResponseBuilder equipmentRequestDetailResponseBuilder)]) = _$EquipmentRequestDetailResponse;

  static Serializer<EquipmentRequestDetailResponse> get serializer =>
      _$equipmentRequestDetailResponseSerializer;
}