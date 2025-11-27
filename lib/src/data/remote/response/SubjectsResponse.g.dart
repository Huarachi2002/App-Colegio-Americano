// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubjectsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubjectsResponse> _$subjectsResponseSerializer =
    new _$SubjectsResponseSerializer();

class _$SubjectsResponseSerializer
    implements StructuredSerializer<SubjectsResponse> {
  @override
  final Iterable<Type> types = const [SubjectsResponse, _$SubjectsResponse];
  @override
  final String wireName = 'SubjectsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubjectsResponse object,
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
  SubjectsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubjectsResponseBuilder();

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

class _$SubjectsResponse extends SubjectsResponse {
  @override
  final int id;
  @override
  final String name;

  factory _$SubjectsResponse(
          [void Function(SubjectsResponseBuilder)? updates]) =>
      (new SubjectsResponseBuilder()..update(updates))._build();

  _$SubjectsResponse._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SubjectsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'SubjectsResponse', 'name');
  }

  @override
  SubjectsResponse rebuild(void Function(SubjectsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubjectsResponseBuilder toBuilder() =>
      new SubjectsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubjectsResponse && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'SubjectsResponse')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SubjectsResponseBuilder
    implements Builder<SubjectsResponse, SubjectsResponseBuilder> {
  _$SubjectsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SubjectsResponseBuilder();

  SubjectsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubjectsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubjectsResponse;
  }

  @override
  void update(void Function(SubjectsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubjectsResponse build() => _build();

  _$SubjectsResponse _build() {
    final _$result = _$v ??
        new _$SubjectsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SubjectsResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SubjectsResponse', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
