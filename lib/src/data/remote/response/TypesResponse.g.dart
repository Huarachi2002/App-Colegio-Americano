// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TypesResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypesResponse> _$typesResponseSerializer =
    new _$TypesResponseSerializer();

class _$TypesResponseSerializer implements StructuredSerializer<TypesResponse> {
  @override
  final Iterable<Type> types = const [TypesResponse, _$TypesResponse];
  @override
  final String wireName = 'TypesResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypesResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
  TypesResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypesResponseBuilder();

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

class _$TypesResponse extends TypesResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$TypesResponse([void Function(TypesResponseBuilder)? updates]) =>
      (new TypesResponseBuilder()..update(updates))._build();

  _$TypesResponse._(
      {required this.id,
      required this.name,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'TypesResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'TypesResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'TypesResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'TypesResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'TypesResponse', 'updatedAt');
  }

  @override
  TypesResponse rebuild(void Function(TypesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypesResponseBuilder toBuilder() => new TypesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypesResponse &&
        id == other.id &&
        name == other.name &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypesResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class TypesResponseBuilder
    implements Builder<TypesResponse, TypesResponseBuilder> {
  _$TypesResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  TypesResponseBuilder();

  TypesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypesResponse;
  }

  @override
  void update(void Function(TypesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypesResponse build() => _build();

  _$TypesResponse _build() {
    final _$result = _$v ??
        new _$TypesResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TypesResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TypesResponse', 'name'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'TypesResponse', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'TypesResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'TypesResponse', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
