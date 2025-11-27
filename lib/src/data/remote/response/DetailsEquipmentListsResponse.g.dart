// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailsEquipmentListsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DetailsEquipmentListsResponse>
    _$detailsEquipmentListsResponseSerializer =
    new _$DetailsEquipmentListsResponseSerializer();

class _$DetailsEquipmentListsResponseSerializer
    implements StructuredSerializer<DetailsEquipmentListsResponse> {
  @override
  final Iterable<Type> types = const [
    DetailsEquipmentListsResponse,
    _$DetailsEquipmentListsResponse
  ];
  @override
  final String wireName = 'DetailsEquipmentListsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DetailsEquipmentListsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'single_purchase',
      serializers.serialize(object.singlePurchase,
          specifiedType: const FullType(String)),
      'min_quantity',
      serializers.serialize(object.minQuantity,
          specifiedType: const FullType(String)),
      'max_quantity',
      serializers.serialize(object.maxQuantity,
          specifiedType: const FullType(String)),
      'equipment_list_id',
      serializers.serialize(object.equipmentListId,
          specifiedType: const FullType(int)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'created_by',
      serializers.serialize(object.createdBy,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DetailsEquipmentListsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DetailsEquipmentListsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'single_purchase':
          result.singlePurchase = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'min_quantity':
          result.minQuantity = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'max_quantity':
          result.maxQuantity = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'equipment_list_id':
          result.equipmentListId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DetailsEquipmentListsResponse extends DetailsEquipmentListsResponse {
  @override
  final int id;
  @override
  final String singlePurchase;
  @override
  final String minQuantity;
  @override
  final String maxQuantity;
  @override
  final int equipmentListId;
  @override
  final int productId;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$DetailsEquipmentListsResponse(
          [void Function(DetailsEquipmentListsResponseBuilder)? updates]) =>
      (new DetailsEquipmentListsResponseBuilder()..update(updates))._build();

  _$DetailsEquipmentListsResponse._(
      {required this.id,
      required this.singlePurchase,
      required this.minQuantity,
      required this.maxQuantity,
      required this.equipmentListId,
      required this.productId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'DetailsEquipmentListsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        singlePurchase, r'DetailsEquipmentListsResponse', 'singlePurchase');
    BuiltValueNullFieldError.checkNotNull(
        minQuantity, r'DetailsEquipmentListsResponse', 'minQuantity');
    BuiltValueNullFieldError.checkNotNull(
        maxQuantity, r'DetailsEquipmentListsResponse', 'maxQuantity');
    BuiltValueNullFieldError.checkNotNull(
        equipmentListId, r'DetailsEquipmentListsResponse', 'equipmentListId');
    BuiltValueNullFieldError.checkNotNull(
        productId, r'DetailsEquipmentListsResponse', 'productId');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'DetailsEquipmentListsResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'DetailsEquipmentListsResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'DetailsEquipmentListsResponse', 'updatedAt');
  }

  @override
  DetailsEquipmentListsResponse rebuild(
          void Function(DetailsEquipmentListsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailsEquipmentListsResponseBuilder toBuilder() =>
      new DetailsEquipmentListsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailsEquipmentListsResponse &&
        id == other.id &&
        singlePurchase == other.singlePurchase &&
        minQuantity == other.minQuantity &&
        maxQuantity == other.maxQuantity &&
        equipmentListId == other.equipmentListId &&
        productId == other.productId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, singlePurchase.hashCode);
    _$hash = $jc(_$hash, minQuantity.hashCode);
    _$hash = $jc(_$hash, maxQuantity.hashCode);
    _$hash = $jc(_$hash, equipmentListId.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DetailsEquipmentListsResponse')
          ..add('id', id)
          ..add('singlePurchase', singlePurchase)
          ..add('minQuantity', minQuantity)
          ..add('maxQuantity', maxQuantity)
          ..add('equipmentListId', equipmentListId)
          ..add('productId', productId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class DetailsEquipmentListsResponseBuilder
    implements
        Builder<DetailsEquipmentListsResponse,
            DetailsEquipmentListsResponseBuilder> {
  _$DetailsEquipmentListsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _singlePurchase;
  String? get singlePurchase => _$this._singlePurchase;
  set singlePurchase(String? singlePurchase) =>
      _$this._singlePurchase = singlePurchase;

  String? _minQuantity;
  String? get minQuantity => _$this._minQuantity;
  set minQuantity(String? minQuantity) => _$this._minQuantity = minQuantity;

  String? _maxQuantity;
  String? get maxQuantity => _$this._maxQuantity;
  set maxQuantity(String? maxQuantity) => _$this._maxQuantity = maxQuantity;

  int? _equipmentListId;
  int? get equipmentListId => _$this._equipmentListId;
  set equipmentListId(int? equipmentListId) =>
      _$this._equipmentListId = equipmentListId;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  DetailsEquipmentListsResponseBuilder();

  DetailsEquipmentListsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _singlePurchase = $v.singlePurchase;
      _minQuantity = $v.minQuantity;
      _maxQuantity = $v.maxQuantity;
      _equipmentListId = $v.equipmentListId;
      _productId = $v.productId;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailsEquipmentListsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailsEquipmentListsResponse;
  }

  @override
  void update(void Function(DetailsEquipmentListsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DetailsEquipmentListsResponse build() => _build();

  _$DetailsEquipmentListsResponse _build() {
    final _$result = _$v ??
        new _$DetailsEquipmentListsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DetailsEquipmentListsResponse', 'id'),
            singlePurchase: BuiltValueNullFieldError.checkNotNull(
                singlePurchase, r'DetailsEquipmentListsResponse', 'singlePurchase'),
            minQuantity: BuiltValueNullFieldError.checkNotNull(
                minQuantity, r'DetailsEquipmentListsResponse', 'minQuantity'),
            maxQuantity: BuiltValueNullFieldError.checkNotNull(
                maxQuantity, r'DetailsEquipmentListsResponse', 'maxQuantity'),
            equipmentListId: BuiltValueNullFieldError.checkNotNull(
                equipmentListId, r'DetailsEquipmentListsResponse', 'equipmentListId'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'DetailsEquipmentListsResponse', 'productId'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'DetailsEquipmentListsResponse', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(createdAt, r'DetailsEquipmentListsResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'DetailsEquipmentListsResponse', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
