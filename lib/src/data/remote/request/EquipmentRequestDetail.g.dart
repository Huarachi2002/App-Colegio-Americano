// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentRequestDetail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentRequestDetail> _$equipmentRequestDetailSerializer =
    new _$EquipmentRequestDetailSerializer();

class _$EquipmentRequestDetailSerializer
    implements StructuredSerializer<EquipmentRequestDetail> {
  @override
  final Iterable<Type> types = const [
    EquipmentRequestDetail,
    _$EquipmentRequestDetail
  ];
  @override
  final String wireName = 'EquipmentRequestDetail';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentRequestDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EquipmentRequestDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentRequestDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EquipmentRequestDetail extends EquipmentRequestDetail {
  @override
  final String quantity;
  @override
  final String price;
  @override
  final String subtotal;
  @override
  final String productId;

  factory _$EquipmentRequestDetail(
          [void Function(EquipmentRequestDetailBuilder)? updates]) =>
      (new EquipmentRequestDetailBuilder()..update(updates))._build();

  _$EquipmentRequestDetail._(
      {required this.quantity,
      required this.price,
      required this.subtotal,
      required this.productId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'EquipmentRequestDetail', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'EquipmentRequestDetail', 'price');
    BuiltValueNullFieldError.checkNotNull(
        subtotal, r'EquipmentRequestDetail', 'subtotal');
    BuiltValueNullFieldError.checkNotNull(
        productId, r'EquipmentRequestDetail', 'productId');
  }

  @override
  EquipmentRequestDetail rebuild(
          void Function(EquipmentRequestDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentRequestDetailBuilder toBuilder() =>
      new EquipmentRequestDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentRequestDetail &&
        quantity == other.quantity &&
        price == other.price &&
        subtotal == other.subtotal &&
        productId == other.productId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, subtotal.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentRequestDetail')
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('subtotal', subtotal)
          ..add('productId', productId))
        .toString();
  }
}

class EquipmentRequestDetailBuilder
    implements Builder<EquipmentRequestDetail, EquipmentRequestDetailBuilder> {
  _$EquipmentRequestDetail? _$v;

  String? _quantity;
  String? get quantity => _$this._quantity;
  set quantity(String? quantity) => _$this._quantity = quantity;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  String? _subtotal;
  String? get subtotal => _$this._subtotal;
  set subtotal(String? subtotal) => _$this._subtotal = subtotal;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  EquipmentRequestDetailBuilder();

  EquipmentRequestDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _price = $v.price;
      _subtotal = $v.subtotal;
      _productId = $v.productId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentRequestDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentRequestDetail;
  }

  @override
  void update(void Function(EquipmentRequestDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentRequestDetail build() => _build();

  _$EquipmentRequestDetail _build() {
    final _$result = _$v ??
        new _$EquipmentRequestDetail._(
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'EquipmentRequestDetail', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'EquipmentRequestDetail', 'price'),
            subtotal: BuiltValueNullFieldError.checkNotNull(
                subtotal, r'EquipmentRequestDetail', 'subtotal'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'EquipmentRequestDetail', 'productId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
