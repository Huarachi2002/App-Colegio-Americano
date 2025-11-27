import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'DetailsEquipmentListsResponse.g.dart';

abstract class DetailsEquipmentListsResponse
    implements
        Built<
            DetailsEquipmentListsResponse,
            DetailsEquipmentListsResponseBuilder> {

  DetailsEquipmentListsResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'single_purchase')
  String get singlePurchase;

  @BuiltValueField(wireName: 'min_quantity')
  String get minQuantity;

  @BuiltValueField(wireName: 'max_quantity')
  String get maxQuantity;

  @BuiltValueField(wireName: 'equipment_list_id')
  int get equipmentListId;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  @BuiltValueField(wireName: 'created_by')
  int get createdBy;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  factory DetailsEquipmentListsResponse([updates(
      DetailsEquipmentListsResponseBuilder detailsEquipmentListsResponseBuilder)]) = _$DetailsEquipmentListsResponse;

  static Serializer<DetailsEquipmentListsResponse> get serializer =>
      _$detailsEquipmentListsResponseSerializer;
}