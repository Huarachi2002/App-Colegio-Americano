// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentRequestDetailResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentRequestDetailResponse>
    _$equipmentRequestDetailResponseSerializer =
    new _$EquipmentRequestDetailResponseSerializer();

class _$EquipmentRequestDetailResponseSerializer
    implements StructuredSerializer<EquipmentRequestDetailResponse> {
  @override
  final Iterable<Type> types = const [
    EquipmentRequestDetailResponse,
    _$EquipmentRequestDetailResponse
  ];
  @override
  final String wireName = 'EquipmentRequestDetailResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentRequestDetailResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(String)),
      'subtotal',
      serializers.serialize(object.subtotal,
          specifiedType: const FullType(String)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'equipment_request_id',
      serializers.serialize(object.equipmentRequestId,
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
  EquipmentRequestDetailResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentRequestDetailResponseBuilder();

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
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'equipment_request_id':
          result.equipmentRequestId = serializers.deserialize(value,
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

class _$EquipmentRequestDetailResponse extends EquipmentRequestDetailResponse {
  @override
  final int id;
  @override
  final String quantity;
  @override
  final String price;
  @override
  final String subtotal;
  @override
  final int productId;
  @override
  final int equipmentRequestId;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$EquipmentRequestDetailResponse(
          [void Function(EquipmentRequestDetailResponseBuilder)? updates]) =>
      (new EquipmentRequestDetailResponseBuilder()..update(updates))._build();

  _$EquipmentRequestDetailResponse._(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.subtotal,
      required this.productId,
      required this.equipmentRequestId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'EquipmentRequestDetailResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'EquipmentRequestDetailResponse', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'EquipmentRequestDetailResponse', 'price');
    BuiltValueNullFieldError.checkNotNull(
        subtotal, r'EquipmentRequestDetailResponse', 'subtotal');
    BuiltValueNullFieldError.checkNotNull(
        productId, r'EquipmentRequestDetailResponse', 'productId');
    BuiltValueNullFieldError.checkNotNull(equipmentRequestId,
        r'EquipmentRequestDetailResponse', 'equipmentRequestId');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'EquipmentRequestDetailResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'EquipmentRequestDetailResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'EquipmentRequestDetailResponse', 'updatedAt');
  }

  @override
  EquipmentRequestDetailResponse rebuild(
          void Function(EquipmentRequestDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentRequestDetailResponseBuilder toBuilder() =>
      new EquipmentRequestDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentRequestDetailResponse &&
        id == other.id &&
        quantity == other.quantity &&
        price == other.price &&
        subtotal == other.subtotal &&
        productId == other.productId &&
        equipmentRequestId == other.equipmentRequestId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, subtotal.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, equipmentRequestId.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentRequestDetailResponse')
          ..add('id', id)
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('subtotal', subtotal)
          ..add('productId', productId)
          ..add('equipmentRequestId', equipmentRequestId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class EquipmentRequestDetailResponseBuilder
    implements
        Builder<EquipmentRequestDetailResponse,
            EquipmentRequestDetailResponseBuilder> {
  _$EquipmentRequestDetailResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _quantity;
  String? get quantity => _$this._quantity;
  set quantity(String? quantity) => _$this._quantity = quantity;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  String? _subtotal;
  String? get subtotal => _$this._subtotal;
  set subtotal(String? subtotal) => _$this._subtotal = subtotal;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  int? _equipmentRequestId;
  int? get equipmentRequestId => _$this._equipmentRequestId;
  set equipmentRequestId(int? equipmentRequestId) =>
      _$this._equipmentRequestId = equipmentRequestId;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  EquipmentRequestDetailResponseBuilder();

  EquipmentRequestDetailResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _quantity = $v.quantity;
      _price = $v.price;
      _subtotal = $v.subtotal;
      _productId = $v.productId;
      _equipmentRequestId = $v.equipmentRequestId;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentRequestDetailResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentRequestDetailResponse;
  }

  @override
  void update(void Function(EquipmentRequestDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentRequestDetailResponse build() => _build();

  _$EquipmentRequestDetailResponse _build() {
    final _$result = _$v ??
        new _$EquipmentRequestDetailResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EquipmentRequestDetailResponse', 'id'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'EquipmentRequestDetailResponse', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'EquipmentRequestDetailResponse', 'price'),
            subtotal: BuiltValueNullFieldError.checkNotNull(
                subtotal, r'EquipmentRequestDetailResponse', 'subtotal'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'EquipmentRequestDetailResponse', 'productId'),
            equipmentRequestId: BuiltValueNullFieldError.checkNotNull(
                equipmentRequestId, r'EquipmentRequestDetailResponse', 'equipmentRequestId'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'EquipmentRequestDetailResponse', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'EquipmentRequestDetailResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'EquipmentRequestDetailResponse', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
