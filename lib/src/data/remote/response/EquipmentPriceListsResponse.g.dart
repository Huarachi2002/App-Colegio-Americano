// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentPriceListsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentPriceListsResponse>
    _$equipmentPriceListsResponseSerializer =
    new _$EquipmentPriceListsResponseSerializer();

class _$EquipmentPriceListsResponseSerializer
    implements StructuredSerializer<EquipmentPriceListsResponse> {
  @override
  final Iterable<Type> types = const [
    EquipmentPriceListsResponse,
    _$EquipmentPriceListsResponse
  ];
  @override
  final String wireName = 'EquipmentPriceListsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentPriceListsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'price_list_id',
      serializers.serialize(object.priceListId,
          specifiedType: const FullType(int)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EquipmentPriceListsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentPriceListsResponseBuilder();

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
        case 'price_list_id':
          result.priceListId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EquipmentPriceListsResponse extends EquipmentPriceListsResponse {
  @override
  final int id;
  @override
  final int priceListId;
  @override
  final int productId;
  @override
  final String price;

  factory _$EquipmentPriceListsResponse(
          [void Function(EquipmentPriceListsResponseBuilder)? updates]) =>
      (new EquipmentPriceListsResponseBuilder()..update(updates))._build();

  _$EquipmentPriceListsResponse._(
      {required this.id,
      required this.priceListId,
      required this.productId,
      required this.price})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'EquipmentPriceListsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        priceListId, r'EquipmentPriceListsResponse', 'priceListId');
    BuiltValueNullFieldError.checkNotNull(
        productId, r'EquipmentPriceListsResponse', 'productId');
    BuiltValueNullFieldError.checkNotNull(
        price, r'EquipmentPriceListsResponse', 'price');
  }

  @override
  EquipmentPriceListsResponse rebuild(
          void Function(EquipmentPriceListsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentPriceListsResponseBuilder toBuilder() =>
      new EquipmentPriceListsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentPriceListsResponse &&
        id == other.id &&
        priceListId == other.priceListId &&
        productId == other.productId &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, priceListId.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentPriceListsResponse')
          ..add('id', id)
          ..add('priceListId', priceListId)
          ..add('productId', productId)
          ..add('price', price))
        .toString();
  }
}

class EquipmentPriceListsResponseBuilder
    implements
        Builder<EquipmentPriceListsResponse,
            EquipmentPriceListsResponseBuilder> {
  _$EquipmentPriceListsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _priceListId;
  int? get priceListId => _$this._priceListId;
  set priceListId(int? priceListId) => _$this._priceListId = priceListId;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  EquipmentPriceListsResponseBuilder();

  EquipmentPriceListsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _priceListId = $v.priceListId;
      _productId = $v.productId;
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentPriceListsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentPriceListsResponse;
  }

  @override
  void update(void Function(EquipmentPriceListsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentPriceListsResponse build() => _build();

  _$EquipmentPriceListsResponse _build() {
    final _$result = _$v ??
        new _$EquipmentPriceListsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EquipmentPriceListsResponse', 'id'),
            priceListId: BuiltValueNullFieldError.checkNotNull(
                priceListId, r'EquipmentPriceListsResponse', 'priceListId'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'EquipmentPriceListsResponse', 'productId'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'EquipmentPriceListsResponse', 'price'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
