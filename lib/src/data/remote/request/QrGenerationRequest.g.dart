// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QrGenerationRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QrGenerationRequest> _$qrGenerationRequestSerializer =
    new _$QrGenerationRequestSerializer();

class _$QrGenerationRequestSerializer
    implements StructuredSerializer<QrGenerationRequest> {
  @override
  final Iterable<Type> types = const [
    QrGenerationRequest,
    _$QrGenerationRequest
  ];
  @override
  final String wireName = 'QrGenerationRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, QrGenerationRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'erp_code',
      serializers.serialize(object.erpCode,
          specifiedType: const FullType(String)),
      'debt_information',
      serializers.serialize(object.debtInformation,
          specifiedType: const FullType(DebtInformationRequest)),
    ];

    return result;
  }

  @override
  QrGenerationRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QrGenerationRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'erp_code':
          result.erpCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'debt_information':
          result.debtInformation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DebtInformationRequest))!
              as DebtInformationRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$QrGenerationRequest extends QrGenerationRequest {
  @override
  final String erpCode;
  @override
  final DebtInformationRequest debtInformation;

  factory _$QrGenerationRequest(
          [void Function(QrGenerationRequestBuilder)? updates]) =>
      (new QrGenerationRequestBuilder()..update(updates))._build();

  _$QrGenerationRequest._(
      {required this.erpCode, required this.debtInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        erpCode, r'QrGenerationRequest', 'erpCode');
    BuiltValueNullFieldError.checkNotNull(
        debtInformation, r'QrGenerationRequest', 'debtInformation');
  }

  @override
  QrGenerationRequest rebuild(
          void Function(QrGenerationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QrGenerationRequestBuilder toBuilder() =>
      new QrGenerationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QrGenerationRequest &&
        erpCode == other.erpCode &&
        debtInformation == other.debtInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, erpCode.hashCode);
    _$hash = $jc(_$hash, debtInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QrGenerationRequest')
          ..add('erpCode', erpCode)
          ..add('debtInformation', debtInformation))
        .toString();
  }
}

class QrGenerationRequestBuilder
    implements Builder<QrGenerationRequest, QrGenerationRequestBuilder> {
  _$QrGenerationRequest? _$v;

  String? _erpCode;
  String? get erpCode => _$this._erpCode;
  set erpCode(String? erpCode) => _$this._erpCode = erpCode;

  DebtInformationRequestBuilder? _debtInformation;
  DebtInformationRequestBuilder get debtInformation =>
      _$this._debtInformation ??= new DebtInformationRequestBuilder();
  set debtInformation(DebtInformationRequestBuilder? debtInformation) =>
      _$this._debtInformation = debtInformation;

  QrGenerationRequestBuilder();

  QrGenerationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _erpCode = $v.erpCode;
      _debtInformation = $v.debtInformation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QrGenerationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QrGenerationRequest;
  }

  @override
  void update(void Function(QrGenerationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QrGenerationRequest build() => _build();

  _$QrGenerationRequest _build() {
    _$QrGenerationRequest _$result;
    try {
      _$result = _$v ??
          new _$QrGenerationRequest._(
              erpCode: BuiltValueNullFieldError.checkNotNull(
                  erpCode, r'QrGenerationRequest', 'erpCode'),
              debtInformation: debtInformation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'debtInformation';
        debtInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QrGenerationRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
