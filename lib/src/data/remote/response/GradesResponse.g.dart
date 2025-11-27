// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GradesResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GradesResponse> _$gradesResponseSerializer =
    new _$GradesResponseSerializer();

class _$GradesResponseSerializer
    implements StructuredSerializer<GradesResponse> {
  @override
  final Iterable<Type> types = const [GradesResponse, _$GradesResponse];
  @override
  final String wireName = 'GradesResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, GradesResponse object,
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
  GradesResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GradesResponseBuilder();

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

class _$GradesResponse extends GradesResponse {
  @override
  final int id;
  @override
  final String name;

  factory _$GradesResponse([void Function(GradesResponseBuilder)? updates]) =>
      (new GradesResponseBuilder()..update(updates))._build();

  _$GradesResponse._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GradesResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GradesResponse', 'name');
  }

  @override
  GradesResponse rebuild(void Function(GradesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GradesResponseBuilder toBuilder() =>
      new GradesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradesResponse && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'GradesResponse')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GradesResponseBuilder
    implements Builder<GradesResponse, GradesResponseBuilder> {
  _$GradesResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GradesResponseBuilder();

  GradesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GradesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GradesResponse;
  }

  @override
  void update(void Function(GradesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GradesResponse build() => _build();

  _$GradesResponse _build() {
    final _$result = _$v ??
        new _$GradesResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GradesResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GradesResponse', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
