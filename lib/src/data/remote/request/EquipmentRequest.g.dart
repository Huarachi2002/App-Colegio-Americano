// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentRequest> _$equipmentRequestSerializer =
    new _$EquipmentRequestSerializer();

class _$EquipmentRequestSerializer
    implements StructuredSerializer<EquipmentRequest> {
  @override
  final Iterable<Type> types = const [EquipmentRequest, _$EquipmentRequest];
  @override
  final String wireName = 'EquipmentRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, EquipmentRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'total',
      serializers.serialize(object.total,
          specifiedType: const FullType(String)),
      'student_id',
      serializers.serialize(object.studentId,
          specifiedType: const FullType(String)),
      'price_list_id',
      serializers.serialize(object.priceListId,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'equipment_list_id',
      serializers.serialize(object.equipmentListId,
          specifiedType: const FullType(String)),
      'academic_management_id',
      serializers.serialize(object.academicManagementId,
          specifiedType: const FullType(String)),
      'details',
      serializers.serialize(object.details,
          specifiedType: const FullType(
              BuiltList, const [const FullType(EquipmentRequestDetail)])),
    ];

    return result;
  }

  @override
  EquipmentRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'student_id':
          result.studentId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price_list_id':
          result.priceListId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'equipment_list_id':
          result.equipmentListId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'academic_management_id':
          result.academicManagementId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(EquipmentRequestDetail)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EquipmentRequest extends EquipmentRequest {
  @override
  final String date;
  @override
  final String total;
  @override
  final String studentId;
  @override
  final String priceListId;
  @override
  final String token;
  @override
  final String equipmentListId;
  @override
  final String academicManagementId;
  @override
  final BuiltList<EquipmentRequestDetail> details;

  factory _$EquipmentRequest(
          [void Function(EquipmentRequestBuilder)? updates]) =>
      (new EquipmentRequestBuilder()..update(updates))._build();

  _$EquipmentRequest._(
      {required this.date,
      required this.total,
      required this.studentId,
      required this.priceListId,
      required this.token,
      required this.equipmentListId,
      required this.academicManagementId,
      required this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, r'EquipmentRequest', 'date');
    BuiltValueNullFieldError.checkNotNull(total, r'EquipmentRequest', 'total');
    BuiltValueNullFieldError.checkNotNull(
        studentId, r'EquipmentRequest', 'studentId');
    BuiltValueNullFieldError.checkNotNull(
        priceListId, r'EquipmentRequest', 'priceListId');
    BuiltValueNullFieldError.checkNotNull(token, r'EquipmentRequest', 'token');
    BuiltValueNullFieldError.checkNotNull(
        equipmentListId, r'EquipmentRequest', 'equipmentListId');
    BuiltValueNullFieldError.checkNotNull(
        academicManagementId, r'EquipmentRequest', 'academicManagementId');
    BuiltValueNullFieldError.checkNotNull(
        details, r'EquipmentRequest', 'details');
  }

  @override
  EquipmentRequest rebuild(void Function(EquipmentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentRequestBuilder toBuilder() =>
      new EquipmentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentRequest &&
        date == other.date &&
        total == other.total &&
        studentId == other.studentId &&
        priceListId == other.priceListId &&
        token == other.token &&
        equipmentListId == other.equipmentListId &&
        academicManagementId == other.academicManagementId &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, studentId.hashCode);
    _$hash = $jc(_$hash, priceListId.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, equipmentListId.hashCode);
    _$hash = $jc(_$hash, academicManagementId.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentRequest')
          ..add('date', date)
          ..add('total', total)
          ..add('studentId', studentId)
          ..add('priceListId', priceListId)
          ..add('token', token)
          ..add('equipmentListId', equipmentListId)
          ..add('academicManagementId', academicManagementId)
          ..add('details', details))
        .toString();
  }
}

class EquipmentRequestBuilder
    implements Builder<EquipmentRequest, EquipmentRequestBuilder> {
  _$EquipmentRequest? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _total;
  String? get total => _$this._total;
  set total(String? total) => _$this._total = total;

  String? _studentId;
  String? get studentId => _$this._studentId;
  set studentId(String? studentId) => _$this._studentId = studentId;

  String? _priceListId;
  String? get priceListId => _$this._priceListId;
  set priceListId(String? priceListId) => _$this._priceListId = priceListId;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _equipmentListId;
  String? get equipmentListId => _$this._equipmentListId;
  set equipmentListId(String? equipmentListId) =>
      _$this._equipmentListId = equipmentListId;

  String? _academicManagementId;
  String? get academicManagementId => _$this._academicManagementId;
  set academicManagementId(String? academicManagementId) =>
      _$this._academicManagementId = academicManagementId;

  ListBuilder<EquipmentRequestDetail>? _details;
  ListBuilder<EquipmentRequestDetail> get details =>
      _$this._details ??= new ListBuilder<EquipmentRequestDetail>();
  set details(ListBuilder<EquipmentRequestDetail>? details) =>
      _$this._details = details;

  EquipmentRequestBuilder();

  EquipmentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _total = $v.total;
      _studentId = $v.studentId;
      _priceListId = $v.priceListId;
      _token = $v.token;
      _equipmentListId = $v.equipmentListId;
      _academicManagementId = $v.academicManagementId;
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentRequest;
  }

  @override
  void update(void Function(EquipmentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentRequest build() => _build();

  _$EquipmentRequest _build() {
    _$EquipmentRequest _$result;
    try {
      _$result = _$v ??
          new _$EquipmentRequest._(
              date: BuiltValueNullFieldError.checkNotNull(
                  date, r'EquipmentRequest', 'date'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'EquipmentRequest', 'total'),
              studentId: BuiltValueNullFieldError.checkNotNull(
                  studentId, r'EquipmentRequest', 'studentId'),
              priceListId: BuiltValueNullFieldError.checkNotNull(
                  priceListId, r'EquipmentRequest', 'priceListId'),
              token: BuiltValueNullFieldError.checkNotNull(
                  token, r'EquipmentRequest', 'token'),
              equipmentListId: BuiltValueNullFieldError.checkNotNull(
                  equipmentListId, r'EquipmentRequest', 'equipmentListId'),
              academicManagementId: BuiltValueNullFieldError.checkNotNull(
                  academicManagementId,
                  r'EquipmentRequest',
                  'academicManagementId'),
              details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EquipmentRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
