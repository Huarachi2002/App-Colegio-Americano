// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentRequestHeaderResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentRequestHeaderResponse>
    _$equipmentRequestHeaderResponseSerializer =
    new _$EquipmentRequestHeaderResponseSerializer();

class _$EquipmentRequestHeaderResponseSerializer
    implements StructuredSerializer<EquipmentRequestHeaderResponse> {
  @override
  final Iterable<Type> types = const [
    EquipmentRequestHeaderResponse,
    _$EquipmentRequestHeaderResponse
  ];
  @override
  final String wireName = 'EquipmentRequestHeaderResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentRequestHeaderResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'total',
      serializers.serialize(object.total,
          specifiedType: const FullType(String)),
      'price_list_id',
      serializers.serialize(object.priceListId,
          specifiedType: const FullType(int)),
      'equipment_list_id',
      serializers.serialize(object.equipmentListId,
          specifiedType: const FullType(int)),
      'student_id',
      serializers.serialize(object.studentId,
          specifiedType: const FullType(int)),
      'employee_id',
      serializers.serialize(object.employeeId,
          specifiedType: const FullType(int)),
      'academic_management_id',
      serializers.serialize(object.academicManagementId,
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
    ];
    Object? value;
    value = object.erpCode;
    if (value != null) {
      result
        ..add('erp_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EquipmentRequestHeaderResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentRequestHeaderResponseBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'erp_code':
          result.erpCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price_list_id':
          result.priceListId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'equipment_list_id':
          result.equipmentListId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'student_id':
          result.studentId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'employee_id':
          result.employeeId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'academic_management_id':
          result.academicManagementId = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$EquipmentRequestHeaderResponse extends EquipmentRequestHeaderResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final String state;
  @override
  final String? erpCode;
  @override
  final String token;
  @override
  final String total;
  @override
  final int priceListId;
  @override
  final int equipmentListId;
  @override
  final int studentId;
  @override
  final int employeeId;
  @override
  final int academicManagementId;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$EquipmentRequestHeaderResponse(
          [void Function(EquipmentRequestHeaderResponseBuilder)? updates]) =>
      (new EquipmentRequestHeaderResponseBuilder()..update(updates))._build();

  _$EquipmentRequestHeaderResponse._(
      {required this.id,
      required this.date,
      required this.state,
      this.erpCode,
      required this.token,
      required this.total,
      required this.priceListId,
      required this.equipmentListId,
      required this.studentId,
      required this.employeeId,
      required this.academicManagementId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'EquipmentRequestHeaderResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        date, r'EquipmentRequestHeaderResponse', 'date');
    BuiltValueNullFieldError.checkNotNull(
        state, r'EquipmentRequestHeaderResponse', 'state');
    BuiltValueNullFieldError.checkNotNull(
        token, r'EquipmentRequestHeaderResponse', 'token');
    BuiltValueNullFieldError.checkNotNull(
        total, r'EquipmentRequestHeaderResponse', 'total');
    BuiltValueNullFieldError.checkNotNull(
        priceListId, r'EquipmentRequestHeaderResponse', 'priceListId');
    BuiltValueNullFieldError.checkNotNull(
        equipmentListId, r'EquipmentRequestHeaderResponse', 'equipmentListId');
    BuiltValueNullFieldError.checkNotNull(
        studentId, r'EquipmentRequestHeaderResponse', 'studentId');
    BuiltValueNullFieldError.checkNotNull(
        employeeId, r'EquipmentRequestHeaderResponse', 'employeeId');
    BuiltValueNullFieldError.checkNotNull(academicManagementId,
        r'EquipmentRequestHeaderResponse', 'academicManagementId');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'EquipmentRequestHeaderResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'EquipmentRequestHeaderResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'EquipmentRequestHeaderResponse', 'updatedAt');
  }

  @override
  EquipmentRequestHeaderResponse rebuild(
          void Function(EquipmentRequestHeaderResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentRequestHeaderResponseBuilder toBuilder() =>
      new EquipmentRequestHeaderResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentRequestHeaderResponse &&
        id == other.id &&
        date == other.date &&
        state == other.state &&
        erpCode == other.erpCode &&
        token == other.token &&
        total == other.total &&
        priceListId == other.priceListId &&
        equipmentListId == other.equipmentListId &&
        studentId == other.studentId &&
        employeeId == other.employeeId &&
        academicManagementId == other.academicManagementId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, erpCode.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, priceListId.hashCode);
    _$hash = $jc(_$hash, equipmentListId.hashCode);
    _$hash = $jc(_$hash, studentId.hashCode);
    _$hash = $jc(_$hash, employeeId.hashCode);
    _$hash = $jc(_$hash, academicManagementId.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentRequestHeaderResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('state', state)
          ..add('erpCode', erpCode)
          ..add('token', token)
          ..add('total', total)
          ..add('priceListId', priceListId)
          ..add('equipmentListId', equipmentListId)
          ..add('studentId', studentId)
          ..add('employeeId', employeeId)
          ..add('academicManagementId', academicManagementId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class EquipmentRequestHeaderResponseBuilder
    implements
        Builder<EquipmentRequestHeaderResponse,
            EquipmentRequestHeaderResponseBuilder> {
  _$EquipmentRequestHeaderResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _erpCode;
  String? get erpCode => _$this._erpCode;
  set erpCode(String? erpCode) => _$this._erpCode = erpCode;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _total;
  String? get total => _$this._total;
  set total(String? total) => _$this._total = total;

  int? _priceListId;
  int? get priceListId => _$this._priceListId;
  set priceListId(int? priceListId) => _$this._priceListId = priceListId;

  int? _equipmentListId;
  int? get equipmentListId => _$this._equipmentListId;
  set equipmentListId(int? equipmentListId) =>
      _$this._equipmentListId = equipmentListId;

  int? _studentId;
  int? get studentId => _$this._studentId;
  set studentId(int? studentId) => _$this._studentId = studentId;

  int? _employeeId;
  int? get employeeId => _$this._employeeId;
  set employeeId(int? employeeId) => _$this._employeeId = employeeId;

  int? _academicManagementId;
  int? get academicManagementId => _$this._academicManagementId;
  set academicManagementId(int? academicManagementId) =>
      _$this._academicManagementId = academicManagementId;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  EquipmentRequestHeaderResponseBuilder();

  EquipmentRequestHeaderResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _state = $v.state;
      _erpCode = $v.erpCode;
      _token = $v.token;
      _total = $v.total;
      _priceListId = $v.priceListId;
      _equipmentListId = $v.equipmentListId;
      _studentId = $v.studentId;
      _employeeId = $v.employeeId;
      _academicManagementId = $v.academicManagementId;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentRequestHeaderResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentRequestHeaderResponse;
  }

  @override
  void update(void Function(EquipmentRequestHeaderResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentRequestHeaderResponse build() => _build();

  _$EquipmentRequestHeaderResponse _build() {
    final _$result = _$v ??
        new _$EquipmentRequestHeaderResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EquipmentRequestHeaderResponse', 'id'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'EquipmentRequestHeaderResponse', 'date'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'EquipmentRequestHeaderResponse', 'state'),
            erpCode: erpCode,
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'EquipmentRequestHeaderResponse', 'token'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'EquipmentRequestHeaderResponse', 'total'),
            priceListId: BuiltValueNullFieldError.checkNotNull(
                priceListId, r'EquipmentRequestHeaderResponse', 'priceListId'),
            equipmentListId: BuiltValueNullFieldError.checkNotNull(
                equipmentListId, r'EquipmentRequestHeaderResponse', 'equipmentListId'),
            studentId: BuiltValueNullFieldError.checkNotNull(
                studentId, r'EquipmentRequestHeaderResponse', 'studentId'),
            employeeId:
                BuiltValueNullFieldError.checkNotNull(employeeId, r'EquipmentRequestHeaderResponse', 'employeeId'),
            academicManagementId: BuiltValueNullFieldError.checkNotNull(academicManagementId, r'EquipmentRequestHeaderResponse', 'academicManagementId'),
            createdBy: BuiltValueNullFieldError.checkNotNull(createdBy, r'EquipmentRequestHeaderResponse', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(createdAt, r'EquipmentRequestHeaderResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'EquipmentRequestHeaderResponse', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
