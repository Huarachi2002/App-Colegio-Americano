// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ParallelsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ParallelsResponse> _$parallelsResponseSerializer =
    new _$ParallelsResponseSerializer();

class _$ParallelsResponseSerializer
    implements StructuredSerializer<ParallelsResponse> {
  @override
  final Iterable<Type> types = const [ParallelsResponse, _$ParallelsResponse];
  @override
  final String wireName = 'ParallelsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, ParallelsResponse object,
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
  ParallelsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ParallelsResponseBuilder();

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

class _$ParallelsResponse extends ParallelsResponse {
  @override
  final int id;
  @override
  final String name;

  factory _$ParallelsResponse(
          [void Function(ParallelsResponseBuilder)? updates]) =>
      (new ParallelsResponseBuilder()..update(updates))._build();

  _$ParallelsResponse._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ParallelsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'ParallelsResponse', 'name');
  }

  @override
  ParallelsResponse rebuild(void Function(ParallelsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParallelsResponseBuilder toBuilder() =>
      new ParallelsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParallelsResponse && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'ParallelsResponse')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ParallelsResponseBuilder
    implements Builder<ParallelsResponse, ParallelsResponseBuilder> {
  _$ParallelsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ParallelsResponseBuilder();

  ParallelsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParallelsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ParallelsResponse;
  }

  @override
  void update(void Function(ParallelsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParallelsResponse build() => _build();

  _$ParallelsResponse _build() {
    final _$result = _$v ??
        new _$ParallelsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ParallelsResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ParallelsResponse', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
