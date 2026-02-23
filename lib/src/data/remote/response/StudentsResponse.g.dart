// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StudentsResponse> _$studentsResponseSerializer =
    new _$StudentsResponseSerializer();

class _$StudentsResponseSerializer
    implements StructuredSerializer<StudentsResponse> {
  @override
  final Iterable<Type> types = const [StudentsResponse, _$StudentsResponse];
  @override
  final String wireName = 'StudentsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudentsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'erp_code',
      serializers.serialize(object.erpCode,
          specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state, specifiedType: const FullType(int)),
      'father_id',
      serializers.serialize(object.fatherId,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gradeId;
    if (value != null) {
      result
        ..add('grade_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parallelId;
    if (value != null) {
      result
        ..add('parallel_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  StudentsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentsResponseBuilder();

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
        case 'erp_code':
          result.erpCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'father_id':
          result.fatherId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'grade_id':
          result.gradeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'parallel_id':
          result.parallelId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$StudentsResponse extends StudentsResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final String erpCode;
  @override
  final String? email;
  @override
  final int state;
  @override
  final int fatherId;
  @override
  final int? gradeId;
  @override
  final int? parallelId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  factory _$StudentsResponse(
          [void Function(StudentsResponseBuilder)? updates]) =>
      (new StudentsResponseBuilder()..update(updates))._build();

  _$StudentsResponse._(
      {required this.id,
      required this.name,
      required this.erpCode,
      this.email,
      required this.state,
      required this.fatherId,
      this.gradeId,
      this.parallelId,
      this.createdAt,
      this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'StudentsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'StudentsResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        erpCode, r'StudentsResponse', 'erpCode');
    BuiltValueNullFieldError.checkNotNull(state, r'StudentsResponse', 'state');
    BuiltValueNullFieldError.checkNotNull(
        fatherId, r'StudentsResponse', 'fatherId');
  }

  @override
  StudentsResponse rebuild(void Function(StudentsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentsResponseBuilder toBuilder() =>
      new StudentsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentsResponse &&
        id == other.id &&
        name == other.name &&
        erpCode == other.erpCode &&
        email == other.email &&
        state == other.state &&
        fatherId == other.fatherId &&
        gradeId == other.gradeId &&
        parallelId == other.parallelId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, erpCode.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, fatherId.hashCode);
    _$hash = $jc(_$hash, gradeId.hashCode);
    _$hash = $jc(_$hash, parallelId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudentsResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('erpCode', erpCode)
          ..add('email', email)
          ..add('state', state)
          ..add('fatherId', fatherId)
          ..add('gradeId', gradeId)
          ..add('parallelId', parallelId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class StudentsResponseBuilder
    implements Builder<StudentsResponse, StudentsResponseBuilder> {
  _$StudentsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _erpCode;
  String? get erpCode => _$this._erpCode;
  set erpCode(String? erpCode) => _$this._erpCode = erpCode;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  int? _state;
  int? get state => _$this._state;
  set state(int? state) => _$this._state = state;

  int? _fatherId;
  int? get fatherId => _$this._fatherId;
  set fatherId(int? fatherId) => _$this._fatherId = fatherId;

  int? _gradeId;
  int? get gradeId => _$this._gradeId;
  set gradeId(int? gradeId) => _$this._gradeId = gradeId;

  int? _parallelId;
  int? get parallelId => _$this._parallelId;
  set parallelId(int? parallelId) => _$this._parallelId = parallelId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  StudentsResponseBuilder();

  StudentsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _erpCode = $v.erpCode;
      _email = $v.email;
      _state = $v.state;
      _fatherId = $v.fatherId;
      _gradeId = $v.gradeId;
      _parallelId = $v.parallelId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentsResponse;
  }

  @override
  void update(void Function(StudentsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudentsResponse build() => _build();

  _$StudentsResponse _build() {
    final _$result = _$v ??
        new _$StudentsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'StudentsResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'StudentsResponse', 'name'),
            erpCode: BuiltValueNullFieldError.checkNotNull(
                erpCode, r'StudentsResponse', 'erpCode'),
            email: email,
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'StudentsResponse', 'state'),
            fatherId: BuiltValueNullFieldError.checkNotNull(
                fatherId, r'StudentsResponse', 'fatherId'),
            gradeId: gradeId,
            parallelId: parallelId,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
