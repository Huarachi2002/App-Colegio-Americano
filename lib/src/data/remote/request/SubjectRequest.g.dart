// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubjectRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubjectRequest> _$subjectRequestSerializer =
    new _$SubjectRequestSerializer();

class _$SubjectRequestSerializer
    implements StructuredSerializer<SubjectRequest> {
  @override
  final Iterable<Type> types = const [SubjectRequest, _$SubjectRequest];
  @override
  final String wireName = 'SubjectRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubjectRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(BigInt)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SubjectRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubjectRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
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

class _$SubjectRequest extends SubjectRequest {
  @override
  final BigInt id;
  @override
  final String name;

  factory _$SubjectRequest([void Function(SubjectRequestBuilder)? updates]) =>
      (new SubjectRequestBuilder()..update(updates))._build();

  _$SubjectRequest._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SubjectRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'SubjectRequest', 'name');
  }

  @override
  SubjectRequest rebuild(void Function(SubjectRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubjectRequestBuilder toBuilder() =>
      new SubjectRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubjectRequest && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'SubjectRequest')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SubjectRequestBuilder
    implements Builder<SubjectRequest, SubjectRequestBuilder> {
  _$SubjectRequest? _$v;

  BigInt? _id;
  BigInt? get id => _$this._id;
  set id(BigInt? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SubjectRequestBuilder();

  SubjectRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubjectRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubjectRequest;
  }

  @override
  void update(void Function(SubjectRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubjectRequest build() => _build();

  _$SubjectRequest _build() {
    final _$result = _$v ??
        new _$SubjectRequest._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SubjectRequest', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SubjectRequest', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
