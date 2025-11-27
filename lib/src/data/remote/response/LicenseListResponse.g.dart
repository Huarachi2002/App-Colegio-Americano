// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LicenseListResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LicenseListResponse> _$licenseListResponseSerializer =
    new _$LicenseListResponseSerializer();

class _$LicenseListResponseSerializer
    implements StructuredSerializer<LicenseListResponse> {
  @override
  final Iterable<Type> types = const [
    LicenseListResponse,
    _$LicenseListResponse
  ];
  @override
  final String wireName = 'LicenseListResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LicenseListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'estadoId',
      serializers.serialize(object.statusId,
          specifiedType: const FullType(int)),
      'estado',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('fecha')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.studentCode;
    if (value != null) {
      result
        ..add('codigoEstudiante')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.studentName;
    if (value != null) {
      result
        ..add('nombreEstudiante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.licenseType;
    if (value != null) {
      result
        ..add('tipoLicencia')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.licensePeriod;
    if (value != null) {
      result
        ..add('tipoPeriodo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.quantityPeriod;
    if (value != null) {
      result
        ..add('cantidadPeriodo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('fechaInicial')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('endDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.test;
    if (value != null) {
      result
        ..add('tieneExamen')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('examenDe')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reason;
    if (value != null) {
      result
        ..add('motivo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requesterName;
    if (value != null) {
      result
        ..add('solicitante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rejectionReason;
    if (value != null) {
      result
        ..add('motivoDelRechazo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attachments;
    if (value != null) {
      result
        ..add('archivos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AttachmentResponse)])));
    }
    return result;
  }

  @override
  LicenseListResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LicenseListResponseBuilder();

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
        case 'fecha':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'codigoEstudiante':
          result.studentCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nombreEstudiante':
          result.studentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tipoLicencia':
          result.licenseType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tipoPeriodo':
          result.licensePeriod = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cantidadPeriodo':
          result.quantityPeriod = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fechaInicial':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'tieneExamen':
          result.test = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'examenDe':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'motivo':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'solicitante':
          result.requesterName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'motivoDelRechazo':
          result.rejectionReason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'estadoId':
          result.statusId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'estado':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'archivos':
          result.attachments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AttachmentResponse)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$LicenseListResponse extends LicenseListResponse {
  @override
  final int id;
  @override
  final DateTime? date;
  @override
  final int? studentCode;
  @override
  final String? studentName;
  @override
  final int? licenseType;
  @override
  final int? licensePeriod;
  @override
  final int? quantityPeriod;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final bool? test;
  @override
  final String? subject;
  @override
  final String? reason;
  @override
  final String? requesterName;
  @override
  final String? rejectionReason;
  @override
  final int statusId;
  @override
  final String status;
  @override
  final BuiltList<AttachmentResponse>? attachments;

  factory _$LicenseListResponse(
          [void Function(LicenseListResponseBuilder)? updates]) =>
      (new LicenseListResponseBuilder()..update(updates))._build();

  _$LicenseListResponse._(
      {required this.id,
      this.date,
      this.studentCode,
      this.studentName,
      this.licenseType,
      this.licensePeriod,
      this.quantityPeriod,
      this.startDate,
      this.endDate,
      this.test,
      this.subject,
      this.reason,
      this.requesterName,
      this.rejectionReason,
      required this.statusId,
      required this.status,
      this.attachments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'LicenseListResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        statusId, r'LicenseListResponse', 'statusId');
    BuiltValueNullFieldError.checkNotNull(
        status, r'LicenseListResponse', 'status');
  }

  @override
  LicenseListResponse rebuild(
          void Function(LicenseListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LicenseListResponseBuilder toBuilder() =>
      new LicenseListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LicenseListResponse &&
        id == other.id &&
        date == other.date &&
        studentCode == other.studentCode &&
        studentName == other.studentName &&
        licenseType == other.licenseType &&
        licensePeriod == other.licensePeriod &&
        quantityPeriod == other.quantityPeriod &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        test == other.test &&
        subject == other.subject &&
        reason == other.reason &&
        requesterName == other.requesterName &&
        rejectionReason == other.rejectionReason &&
        statusId == other.statusId &&
        status == other.status &&
        attachments == other.attachments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, studentCode.hashCode);
    _$hash = $jc(_$hash, studentName.hashCode);
    _$hash = $jc(_$hash, licenseType.hashCode);
    _$hash = $jc(_$hash, licensePeriod.hashCode);
    _$hash = $jc(_$hash, quantityPeriod.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, test.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, requesterName.hashCode);
    _$hash = $jc(_$hash, rejectionReason.hashCode);
    _$hash = $jc(_$hash, statusId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, attachments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LicenseListResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('studentCode', studentCode)
          ..add('studentName', studentName)
          ..add('licenseType', licenseType)
          ..add('licensePeriod', licensePeriod)
          ..add('quantityPeriod', quantityPeriod)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('test', test)
          ..add('subject', subject)
          ..add('reason', reason)
          ..add('requesterName', requesterName)
          ..add('rejectionReason', rejectionReason)
          ..add('statusId', statusId)
          ..add('status', status)
          ..add('attachments', attachments))
        .toString();
  }
}

class LicenseListResponseBuilder
    implements Builder<LicenseListResponse, LicenseListResponseBuilder> {
  _$LicenseListResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  int? _studentCode;
  int? get studentCode => _$this._studentCode;
  set studentCode(int? studentCode) => _$this._studentCode = studentCode;

  String? _studentName;
  String? get studentName => _$this._studentName;
  set studentName(String? studentName) => _$this._studentName = studentName;

  int? _licenseType;
  int? get licenseType => _$this._licenseType;
  set licenseType(int? licenseType) => _$this._licenseType = licenseType;

  int? _licensePeriod;
  int? get licensePeriod => _$this._licensePeriod;
  set licensePeriod(int? licensePeriod) =>
      _$this._licensePeriod = licensePeriod;

  int? _quantityPeriod;
  int? get quantityPeriod => _$this._quantityPeriod;
  set quantityPeriod(int? quantityPeriod) =>
      _$this._quantityPeriod = quantityPeriod;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  bool? _test;
  bool? get test => _$this._test;
  set test(bool? test) => _$this._test = test;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _requesterName;
  String? get requesterName => _$this._requesterName;
  set requesterName(String? requesterName) =>
      _$this._requesterName = requesterName;

  String? _rejectionReason;
  String? get rejectionReason => _$this._rejectionReason;
  set rejectionReason(String? rejectionReason) =>
      _$this._rejectionReason = rejectionReason;

  int? _statusId;
  int? get statusId => _$this._statusId;
  set statusId(int? statusId) => _$this._statusId = statusId;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ListBuilder<AttachmentResponse>? _attachments;
  ListBuilder<AttachmentResponse> get attachments =>
      _$this._attachments ??= new ListBuilder<AttachmentResponse>();
  set attachments(ListBuilder<AttachmentResponse>? attachments) =>
      _$this._attachments = attachments;

  LicenseListResponseBuilder();

  LicenseListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _studentCode = $v.studentCode;
      _studentName = $v.studentName;
      _licenseType = $v.licenseType;
      _licensePeriod = $v.licensePeriod;
      _quantityPeriod = $v.quantityPeriod;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _test = $v.test;
      _subject = $v.subject;
      _reason = $v.reason;
      _requesterName = $v.requesterName;
      _rejectionReason = $v.rejectionReason;
      _statusId = $v.statusId;
      _status = $v.status;
      _attachments = $v.attachments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LicenseListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LicenseListResponse;
  }

  @override
  void update(void Function(LicenseListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LicenseListResponse build() => _build();

  _$LicenseListResponse _build() {
    _$LicenseListResponse _$result;
    try {
      _$result = _$v ??
          new _$LicenseListResponse._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'LicenseListResponse', 'id'),
              date: date,
              studentCode: studentCode,
              studentName: studentName,
              licenseType: licenseType,
              licensePeriod: licensePeriod,
              quantityPeriod: quantityPeriod,
              startDate: startDate,
              endDate: endDate,
              test: test,
              subject: subject,
              reason: reason,
              requesterName: requesterName,
              rejectionReason: rejectionReason,
              statusId: BuiltValueNullFieldError.checkNotNull(
                  statusId, r'LicenseListResponse', 'statusId'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'LicenseListResponse', 'status'),
              attachments: _attachments?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attachments';
        _attachments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LicenseListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
