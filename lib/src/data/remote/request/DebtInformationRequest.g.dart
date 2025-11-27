// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DebtInformationRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DebtInformationRequest> _$debtInformationRequestSerializer =
    new _$DebtInformationRequestSerializer();

class _$DebtInformationRequestSerializer
    implements StructuredSerializer<DebtInformationRequest> {
  @override
  final Iterable<Type> types = const [
    DebtInformationRequest,
    _$DebtInformationRequest
  ];
  @override
  final String wireName = 'DebtInformationRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DebtInformationRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'idProceso',
      serializers.serialize(object.processId,
          specifiedType: const FullType(String)),
      'idTransaccion',
      serializers.serialize(object.transactionId,
          specifiedType: const FullType(String)),
      'NombreDeudor',
      serializers.serialize(object.debtorName,
          specifiedType: const FullType(String)),
      'MonedaDelCobro',
      serializers.serialize(object.currency,
          specifiedType: const FullType(String)),
      'MontoDelCobro',
      serializers.serialize(object.amount,
          specifiedType: const FullType(String)),
      'DetalleDelCobro',
      serializers.serialize(object.chargeDetail,
          specifiedType: const FullType(ChargeDetailRequest)),
      'DatosFactura',
      serializers.serialize(object.invoiceDetail,
          specifiedType: const FullType(InvoiceDetailRequest)),
    ];

    return result;
  }

  @override
  DebtInformationRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DebtInformationRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idProceso':
          result.processId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'idTransaccion':
          result.transactionId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'NombreDeudor':
          result.debtorName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MonedaDelCobro':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MontoDelCobro':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'DetalleDelCobro':
          result.chargeDetail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ChargeDetailRequest))!
              as ChargeDetailRequest);
          break;
        case 'DatosFactura':
          result.invoiceDetail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(InvoiceDetailRequest))!
              as InvoiceDetailRequest);
          break;
      }
    }

    return result.build();
  }
}

class _$DebtInformationRequest extends DebtInformationRequest {
  @override
  final String processId;
  @override
  final String transactionId;
  @override
  final String debtorName;
  @override
  final String currency;
  @override
  final String amount;
  @override
  final ChargeDetailRequest chargeDetail;
  @override
  final InvoiceDetailRequest invoiceDetail;

  factory _$DebtInformationRequest(
          [void Function(DebtInformationRequestBuilder)? updates]) =>
      (new DebtInformationRequestBuilder()..update(updates))._build();

  _$DebtInformationRequest._(
      {required this.processId,
      required this.transactionId,
      required this.debtorName,
      required this.currency,
      required this.amount,
      required this.chargeDetail,
      required this.invoiceDetail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        processId, r'DebtInformationRequest', 'processId');
    BuiltValueNullFieldError.checkNotNull(
        transactionId, r'DebtInformationRequest', 'transactionId');
    BuiltValueNullFieldError.checkNotNull(
        debtorName, r'DebtInformationRequest', 'debtorName');
    BuiltValueNullFieldError.checkNotNull(
        currency, r'DebtInformationRequest', 'currency');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'DebtInformationRequest', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        chargeDetail, r'DebtInformationRequest', 'chargeDetail');
    BuiltValueNullFieldError.checkNotNull(
        invoiceDetail, r'DebtInformationRequest', 'invoiceDetail');
  }

  @override
  DebtInformationRequest rebuild(
          void Function(DebtInformationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DebtInformationRequestBuilder toBuilder() =>
      new DebtInformationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DebtInformationRequest &&
        processId == other.processId &&
        transactionId == other.transactionId &&
        debtorName == other.debtorName &&
        currency == other.currency &&
        amount == other.amount &&
        chargeDetail == other.chargeDetail &&
        invoiceDetail == other.invoiceDetail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processId.hashCode);
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, debtorName.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, chargeDetail.hashCode);
    _$hash = $jc(_$hash, invoiceDetail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DebtInformationRequest')
          ..add('processId', processId)
          ..add('transactionId', transactionId)
          ..add('debtorName', debtorName)
          ..add('currency', currency)
          ..add('amount', amount)
          ..add('chargeDetail', chargeDetail)
          ..add('invoiceDetail', invoiceDetail))
        .toString();
  }
}

class DebtInformationRequestBuilder
    implements Builder<DebtInformationRequest, DebtInformationRequestBuilder> {
  _$DebtInformationRequest? _$v;

  String? _processId;
  String? get processId => _$this._processId;
  set processId(String? processId) => _$this._processId = processId;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _debtorName;
  String? get debtorName => _$this._debtorName;
  set debtorName(String? debtorName) => _$this._debtorName = debtorName;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  ChargeDetailRequestBuilder? _chargeDetail;
  ChargeDetailRequestBuilder get chargeDetail =>
      _$this._chargeDetail ??= new ChargeDetailRequestBuilder();
  set chargeDetail(ChargeDetailRequestBuilder? chargeDetail) =>
      _$this._chargeDetail = chargeDetail;

  InvoiceDetailRequestBuilder? _invoiceDetail;
  InvoiceDetailRequestBuilder get invoiceDetail =>
      _$this._invoiceDetail ??= new InvoiceDetailRequestBuilder();
  set invoiceDetail(InvoiceDetailRequestBuilder? invoiceDetail) =>
      _$this._invoiceDetail = invoiceDetail;

  DebtInformationRequestBuilder();

  DebtInformationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processId = $v.processId;
      _transactionId = $v.transactionId;
      _debtorName = $v.debtorName;
      _currency = $v.currency;
      _amount = $v.amount;
      _chargeDetail = $v.chargeDetail.toBuilder();
      _invoiceDetail = $v.invoiceDetail.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DebtInformationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DebtInformationRequest;
  }

  @override
  void update(void Function(DebtInformationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DebtInformationRequest build() => _build();

  _$DebtInformationRequest _build() {
    _$DebtInformationRequest _$result;
    try {
      _$result = _$v ??
          new _$DebtInformationRequest._(
              processId: BuiltValueNullFieldError.checkNotNull(
                  processId, r'DebtInformationRequest', 'processId'),
              transactionId: BuiltValueNullFieldError.checkNotNull(
                  transactionId, r'DebtInformationRequest', 'transactionId'),
              debtorName: BuiltValueNullFieldError.checkNotNull(
                  debtorName, r'DebtInformationRequest', 'debtorName'),
              currency: BuiltValueNullFieldError.checkNotNull(
                  currency, r'DebtInformationRequest', 'currency'),
              amount: BuiltValueNullFieldError.checkNotNull(
                  amount, r'DebtInformationRequest', 'amount'),
              chargeDetail: chargeDetail.build(),
              invoiceDetail: invoiceDetail.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chargeDetail';
        chargeDetail.build();
        _$failedField = 'invoiceDetail';
        invoiceDetail.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DebtInformationRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
