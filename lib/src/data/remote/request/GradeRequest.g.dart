// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GradeRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GradeRequest> _$gradeRequestSerializer =
    new _$GradeRequestSerializer();

class _$GradeRequestSerializer implements StructuredSerializer<GradeRequest> {
  @override
  final Iterable<Type> types = const [GradeRequest, _$GradeRequest];
  @override
  final String wireName = 'GradeRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, GradeRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(BigInt)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'subjects',
      serializers.serialize(object.subjects,
          specifiedType: const FullType(SubjectRequest)),
    ];

    return result;
  }

  @override
  GradeRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GradeRequestBuilder();

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
        case 'subjects':
          result.subjects.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubjectRequest))!
              as SubjectRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$GradeRequest extends GradeRequest {
  @override
  final BigInt id;
  @override
  final String name;
  @override
  final SubjectRequest subjects;

  factory _$GradeRequest([void Function(GradeRequestBuilder)? updates]) =>
      (new GradeRequestBuilder()..update(updates))._build();

  _$GradeRequest._(
      {required this.id, required this.name, required this.subjects})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GradeRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GradeRequest', 'name');
    BuiltValueNullFieldError.checkNotNull(
        subjects, r'GradeRequest', 'subjects');
  }

  @override
  GradeRequest rebuild(void Function(GradeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GradeRequestBuilder toBuilder() => new GradeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradeRequest &&
        id == other.id &&
        name == other.name &&
        subjects == other.subjects;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, subjects.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GradeRequest')
          ..add('id', id)
          ..add('name', name)
          ..add('subjects', subjects))
        .toString();
  }
}

class GradeRequestBuilder
    implements Builder<GradeRequest, GradeRequestBuilder> {
  _$GradeRequest? _$v;

  BigInt? _id;
  BigInt? get id => _$this._id;
  set id(BigInt? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SubjectRequestBuilder? _subjects;
  SubjectRequestBuilder get subjects =>
      _$this._subjects ??= new SubjectRequestBuilder();
  set subjects(SubjectRequestBuilder? subjects) => _$this._subjects = subjects;

  GradeRequestBuilder();

  GradeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _subjects = $v.subjects.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GradeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GradeRequest;
  }

  @override
  void update(void Function(GradeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GradeRequest build() => _build();

  _$GradeRequest _build() {
    _$GradeRequest _$result;
    try {
      _$result = _$v ??
          new _$GradeRequest._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GradeRequest', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GradeRequest', 'name'),
              subjects: subjects.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subjects';
        subjects.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GradeRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
