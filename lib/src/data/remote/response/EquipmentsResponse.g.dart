// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentsResponse> _$equipmentsResponseSerializer =
    new _$EquipmentsResponseSerializer();

class _$EquipmentsResponseSerializer
    implements StructuredSerializer<EquipmentsResponse> {
  @override
  final Iterable<Type> types = const [EquipmentsResponse, _$EquipmentsResponse];
  @override
  final String wireName = 'EquipmentsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'short_name',
      serializers.serialize(object.shortName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EquipmentsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentsResponseBuilder();

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
        case 'short_name':
          result.shortName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EquipmentsResponse extends EquipmentsResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final String shortName;

  factory _$EquipmentsResponse(
          [void Function(EquipmentsResponseBuilder)? updates]) =>
      (new EquipmentsResponseBuilder()..update(updates))._build();

  _$EquipmentsResponse._(
      {required this.id, required this.name, required this.shortName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EquipmentsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'EquipmentsResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        shortName, r'EquipmentsResponse', 'shortName');
  }

  @override
  EquipmentsResponse rebuild(
          void Function(EquipmentsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentsResponseBuilder toBuilder() =>
      new EquipmentsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentsResponse &&
        id == other.id &&
        name == other.name &&
        shortName == other.shortName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, shortName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentsResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('shortName', shortName))
        .toString();
  }
}

class EquipmentsResponseBuilder
    implements Builder<EquipmentsResponse, EquipmentsResponseBuilder> {
  _$EquipmentsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _shortName;
  String? get shortName => _$this._shortName;
  set shortName(String? shortName) => _$this._shortName = shortName;

  EquipmentsResponseBuilder();

  EquipmentsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _shortName = $v.shortName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentsResponse;
  }

  @override
  void update(void Function(EquipmentsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentsResponse build() => _build();

  _$EquipmentsResponse _build() {
    final _$result = _$v ??
        new _$EquipmentsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EquipmentsResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'EquipmentsResponse', 'name'),
            shortName: BuiltValueNullFieldError.checkNotNull(
                shortName, r'EquipmentsResponse', 'shortName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
