// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PathResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PathResponse> _$pathResponseSerializer =
    new _$PathResponseSerializer();

class _$PathResponseSerializer implements StructuredSerializer<PathResponse> {
  @override
  final Iterable<Type> types = const [PathResponse, _$PathResponse];
  @override
  final String wireName = 'PathResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, PathResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PathResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PathResponseBuilder();

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
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PathResponse extends PathResponse {
  @override
  final int id;
  @override
  final String path;

  factory _$PathResponse([void Function(PathResponseBuilder)? updates]) =>
      (new PathResponseBuilder()..update(updates))._build();

  _$PathResponse._({required this.id, required this.path}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PathResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(path, r'PathResponse', 'path');
  }

  @override
  PathResponse rebuild(void Function(PathResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PathResponseBuilder toBuilder() => new PathResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PathResponse && id == other.id && path == other.path;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PathResponse')
          ..add('id', id)
          ..add('path', path))
        .toString();
  }
}

class PathResponseBuilder
    implements Builder<PathResponse, PathResponseBuilder> {
  _$PathResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  PathResponseBuilder();

  PathResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _path = $v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PathResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PathResponse;
  }

  @override
  void update(void Function(PathResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PathResponse build() => _build();

  _$PathResponse _build() {
    final _$result = _$v ??
        new _$PathResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'PathResponse', 'id'),
            path: BuiltValueNullFieldError.checkNotNull(
                path, r'PathResponse', 'path'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
