// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PriceListsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PriceListsResponse> _$priceListsResponseSerializer =
    new _$PriceListsResponseSerializer();

class _$PriceListsResponseSerializer
    implements StructuredSerializer<PriceListsResponse> {
  @override
  final Iterable<Type> types = const [PriceListsResponse, _$PriceListsResponse];
  @override
  final String wireName = 'PriceListsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PriceListsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PriceListsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PriceListsResponseBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PriceListsResponse extends PriceListsResponse {
  @override
  final int id;
  @override
  final String name;

  factory _$PriceListsResponse(
          [void Function(PriceListsResponseBuilder)? updates]) =>
      (new PriceListsResponseBuilder()..update(updates))._build();

  _$PriceListsResponse._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PriceListsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'PriceListsResponse', 'name');
  }

  @override
  PriceListsResponse rebuild(
          void Function(PriceListsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceListsResponseBuilder toBuilder() =>
      new PriceListsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PriceListsResponse && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PriceListsResponse')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class PriceListsResponseBuilder
    implements Builder<PriceListsResponse, PriceListsResponseBuilder> {
  _$PriceListsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PriceListsResponseBuilder();

  PriceListsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PriceListsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PriceListsResponse;
  }

  @override
  void update(void Function(PriceListsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PriceListsResponse build() => _build();

  _$PriceListsResponse _build() {
    final _$result = _$v ??
        new _$PriceListsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'PriceListsResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'PriceListsResponse', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
