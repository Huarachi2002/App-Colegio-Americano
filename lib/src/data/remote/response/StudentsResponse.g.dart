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
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'invoice_name',
      serializers.serialize(object.invoiceName,
          specifiedType: const FullType(String)),
      'nit',
      serializers.serialize(object.nit, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'father_id',
      serializers.serialize(object.fatherId,
          specifiedType: const FullType(int)),
      'grade_id',
      serializers.serialize(object.gradeId, specifiedType: const FullType(int)),
      'parallel_id',
      serializers.serialize(object.parallelId,
          specifiedType: const FullType(int)),
      'price_list_id',
      serializers.serialize(object.priceListId,
          specifiedType: const FullType(int)),
      'created_by',
      serializers.serialize(object.createdBy,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
      'monthly_payment',
      serializers.serialize(object.monthlyPayment,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.pivot;
    if (value != null) {
      result
        ..add('pivot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PivotStudentsResponse)));
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
              specifiedType: const FullType(String))! as String;
          break;
        case 'invoice_name':
          result.invoiceName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nit':
          result.nit = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'father_id':
          result.fatherId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'grade_id':
          result.gradeId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'parallel_id':
          result.parallelId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'price_list_id':
          result.priceListId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
        case 'monthly_payment':
          result.monthlyPayment = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pivot':
          result.pivot.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PivotStudentsResponse))!
              as PivotStudentsResponse);
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
  final String email;
  @override
  final String invoiceName;
  @override
  final String nit;
  @override
  final String state;
  @override
  final int fatherId;
  @override
  final int gradeId;
  @override
  final int parallelId;
  @override
  final int priceListId;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int monthlyPayment;
  @override
  final PivotStudentsResponse? pivot;

  factory _$StudentsResponse(
          [void Function(StudentsResponseBuilder)? updates]) =>
      (new StudentsResponseBuilder()..update(updates))._build();

  _$StudentsResponse._(
      {required this.id,
      required this.name,
      required this.erpCode,
      required this.email,
      required this.invoiceName,
      required this.nit,
      required this.state,
      required this.fatherId,
      required this.gradeId,
      required this.parallelId,
      required this.priceListId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required this.monthlyPayment,
      this.pivot})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'StudentsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'StudentsResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        erpCode, r'StudentsResponse', 'erpCode');
    BuiltValueNullFieldError.checkNotNull(email, r'StudentsResponse', 'email');
    BuiltValueNullFieldError.checkNotNull(
        invoiceName, r'StudentsResponse', 'invoiceName');
    BuiltValueNullFieldError.checkNotNull(nit, r'StudentsResponse', 'nit');
    BuiltValueNullFieldError.checkNotNull(state, r'StudentsResponse', 'state');
    BuiltValueNullFieldError.checkNotNull(
        fatherId, r'StudentsResponse', 'fatherId');
    BuiltValueNullFieldError.checkNotNull(
        gradeId, r'StudentsResponse', 'gradeId');
    BuiltValueNullFieldError.checkNotNull(
        parallelId, r'StudentsResponse', 'parallelId');
    BuiltValueNullFieldError.checkNotNull(
        priceListId, r'StudentsResponse', 'priceListId');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'StudentsResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'StudentsResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'StudentsResponse', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(
        monthlyPayment, r'StudentsResponse', 'monthlyPayment');
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
        invoiceName == other.invoiceName &&
        nit == other.nit &&
        state == other.state &&
        fatherId == other.fatherId &&
        gradeId == other.gradeId &&
        parallelId == other.parallelId &&
        priceListId == other.priceListId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        monthlyPayment == other.monthlyPayment &&
        pivot == other.pivot;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, erpCode.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, invoiceName.hashCode);
    _$hash = $jc(_$hash, nit.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, fatherId.hashCode);
    _$hash = $jc(_$hash, gradeId.hashCode);
    _$hash = $jc(_$hash, parallelId.hashCode);
    _$hash = $jc(_$hash, priceListId.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, monthlyPayment.hashCode);
    _$hash = $jc(_$hash, pivot.hashCode);
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
          ..add('invoiceName', invoiceName)
          ..add('nit', nit)
          ..add('state', state)
          ..add('fatherId', fatherId)
          ..add('gradeId', gradeId)
          ..add('parallelId', parallelId)
          ..add('priceListId', priceListId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('monthlyPayment', monthlyPayment)
          ..add('pivot', pivot))
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

  String? _invoiceName;
  String? get invoiceName => _$this._invoiceName;
  set invoiceName(String? invoiceName) => _$this._invoiceName = invoiceName;

  String? _nit;
  String? get nit => _$this._nit;
  set nit(String? nit) => _$this._nit = nit;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  int? _fatherId;
  int? get fatherId => _$this._fatherId;
  set fatherId(int? fatherId) => _$this._fatherId = fatherId;

  int? _gradeId;
  int? get gradeId => _$this._gradeId;
  set gradeId(int? gradeId) => _$this._gradeId = gradeId;

  int? _parallelId;
  int? get parallelId => _$this._parallelId;
  set parallelId(int? parallelId) => _$this._parallelId = parallelId;

  int? _priceListId;
  int? get priceListId => _$this._priceListId;
  set priceListId(int? priceListId) => _$this._priceListId = priceListId;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  int? _monthlyPayment;
  int? get monthlyPayment => _$this._monthlyPayment;
  set monthlyPayment(int? monthlyPayment) =>
      _$this._monthlyPayment = monthlyPayment;

  PivotStudentsResponseBuilder? _pivot;
  PivotStudentsResponseBuilder get pivot =>
      _$this._pivot ??= new PivotStudentsResponseBuilder();
  set pivot(PivotStudentsResponseBuilder? pivot) => _$this._pivot = pivot;

  StudentsResponseBuilder();

  StudentsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _erpCode = $v.erpCode;
      _email = $v.email;
      _invoiceName = $v.invoiceName;
      _nit = $v.nit;
      _state = $v.state;
      _fatherId = $v.fatherId;
      _gradeId = $v.gradeId;
      _parallelId = $v.parallelId;
      _priceListId = $v.priceListId;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _monthlyPayment = $v.monthlyPayment;
      _pivot = $v.pivot?.toBuilder();
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
    _$StudentsResponse _$result;
    try {
      _$result = _$v ??
          new _$StudentsResponse._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'StudentsResponse', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'StudentsResponse', 'name'),
              erpCode: BuiltValueNullFieldError.checkNotNull(
                  erpCode, r'StudentsResponse', 'erpCode'),
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'StudentsResponse', 'email'),
              invoiceName: BuiltValueNullFieldError.checkNotNull(
                  invoiceName, r'StudentsResponse', 'invoiceName'),
              nit: BuiltValueNullFieldError.checkNotNull(
                  nit, r'StudentsResponse', 'nit'),
              state: BuiltValueNullFieldError.checkNotNull(
                  state, r'StudentsResponse', 'state'),
              fatherId: BuiltValueNullFieldError.checkNotNull(
                  fatherId, r'StudentsResponse', 'fatherId'),
              gradeId: BuiltValueNullFieldError.checkNotNull(
                  gradeId, r'StudentsResponse', 'gradeId'),
              parallelId: BuiltValueNullFieldError.checkNotNull(parallelId, r'StudentsResponse', 'parallelId'),
              priceListId: BuiltValueNullFieldError.checkNotNull(priceListId, r'StudentsResponse', 'priceListId'),
              createdBy: BuiltValueNullFieldError.checkNotNull(createdBy, r'StudentsResponse', 'createdBy'),
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt, r'StudentsResponse', 'createdAt'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'StudentsResponse', 'updatedAt'),
              monthlyPayment: BuiltValueNullFieldError.checkNotNull(monthlyPayment, r'StudentsResponse', 'monthlyPayment'),
              pivot: _pivot?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pivot';
        _pivot?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StudentsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
