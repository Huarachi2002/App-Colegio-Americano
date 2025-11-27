// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AcademicManagementResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AcademicManagementResponse> _$academicManagementResponseSerializer =
    new _$AcademicManagementResponseSerializer();

class _$AcademicManagementResponseSerializer
    implements StructuredSerializer<AcademicManagementResponse> {
  @override
  final Iterable<Type> types = const [
    AcademicManagementResponse,
    _$AcademicManagementResponse
  ];
  @override
  final String wireName = 'AcademicManagementResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AcademicManagementResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'registration_start_date',
      serializers.serialize(object.registrationStartDate,
          specifiedType: const FullType(String)),
      'registration_end_date',
      serializers.serialize(object.registrationEndDate,
          specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
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
  AcademicManagementResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AcademicManagementResponseBuilder();

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
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'registration_start_date':
          result.registrationStartDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'registration_end_date':
          result.registrationEndDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
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

class _$AcademicManagementResponse extends AcademicManagementResponse {
  @override
  final int id;
  @override
  final int year;
  @override
  final String registrationStartDate;
  @override
  final String registrationEndDate;
  @override
  final String state;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$AcademicManagementResponse(
          [void Function(AcademicManagementResponseBuilder)? updates]) =>
      (new AcademicManagementResponseBuilder()..update(updates))._build();

  _$AcademicManagementResponse._(
      {required this.id,
      required this.year,
      required this.registrationStartDate,
      required this.registrationEndDate,
      required this.state,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'AcademicManagementResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        year, r'AcademicManagementResponse', 'year');
    BuiltValueNullFieldError.checkNotNull(registrationStartDate,
        r'AcademicManagementResponse', 'registrationStartDate');
    BuiltValueNullFieldError.checkNotNull(registrationEndDate,
        r'AcademicManagementResponse', 'registrationEndDate');
    BuiltValueNullFieldError.checkNotNull(
        state, r'AcademicManagementResponse', 'state');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'AcademicManagementResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'AcademicManagementResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'AcademicManagementResponse', 'updatedAt');
  }

  @override
  AcademicManagementResponse rebuild(
          void Function(AcademicManagementResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcademicManagementResponseBuilder toBuilder() =>
      new AcademicManagementResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcademicManagementResponse &&
        id == other.id &&
        year == other.year &&
        registrationStartDate == other.registrationStartDate &&
        registrationEndDate == other.registrationEndDate &&
        state == other.state &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, registrationStartDate.hashCode);
    _$hash = $jc(_$hash, registrationEndDate.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcademicManagementResponse')
          ..add('id', id)
          ..add('year', year)
          ..add('registrationStartDate', registrationStartDate)
          ..add('registrationEndDate', registrationEndDate)
          ..add('state', state)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AcademicManagementResponseBuilder
    implements
        Builder<AcademicManagementResponse, AcademicManagementResponseBuilder> {
  _$AcademicManagementResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  String? _registrationStartDate;
  String? get registrationStartDate => _$this._registrationStartDate;
  set registrationStartDate(String? registrationStartDate) =>
      _$this._registrationStartDate = registrationStartDate;

  String? _registrationEndDate;
  String? get registrationEndDate => _$this._registrationEndDate;
  set registrationEndDate(String? registrationEndDate) =>
      _$this._registrationEndDate = registrationEndDate;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  AcademicManagementResponseBuilder();

  AcademicManagementResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _year = $v.year;
      _registrationStartDate = $v.registrationStartDate;
      _registrationEndDate = $v.registrationEndDate;
      _state = $v.state;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcademicManagementResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AcademicManagementResponse;
  }

  @override
  void update(void Function(AcademicManagementResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcademicManagementResponse build() => _build();

  _$AcademicManagementResponse _build() {
    final _$result = _$v ??
        new _$AcademicManagementResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AcademicManagementResponse', 'id'),
            year: BuiltValueNullFieldError.checkNotNull(
                year, r'AcademicManagementResponse', 'year'),
            registrationStartDate: BuiltValueNullFieldError.checkNotNull(
                registrationStartDate, r'AcademicManagementResponse', 'registrationStartDate'),
            registrationEndDate: BuiltValueNullFieldError.checkNotNull(
                registrationEndDate, r'AcademicManagementResponse', 'registrationEndDate'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'AcademicManagementResponse', 'state'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'AcademicManagementResponse', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AcademicManagementResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'AcademicManagementResponse', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
