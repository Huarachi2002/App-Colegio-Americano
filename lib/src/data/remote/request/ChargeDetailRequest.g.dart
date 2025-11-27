// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChargeDetailRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChargeDetailRequest> _$chargeDetailRequestSerializer =
    new _$ChargeDetailRequestSerializer();

class _$ChargeDetailRequestSerializer
    implements StructuredSerializer<ChargeDetailRequest> {
  @override
  final Iterable<Type> types = const [
    ChargeDetailRequest,
    _$ChargeDetailRequest
  ];
  @override
  final String wireName = 'ChargeDetailRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChargeDetailRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ConceptoPago',
      serializers.serialize(object.paymentConcept,
          specifiedType: const FullType(String)),
      'PeriodoPago',
      serializers.serialize(object.paymentPeriod,
          specifiedType: const FullType(String)),
      'MultaPago',
      serializers.serialize(object.paymentPenalty,
          specifiedType: const FullType(String)),
      'DescuentoPago',
      serializers.serialize(object.paymentDiscount,
          specifiedType: const FullType(String)),
      'MontoPago',
      serializers.serialize(object.paymentAmount,
          specifiedType: const FullType(String)),
      'Facturable',
      serializers.serialize(object.isInvoice,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ChargeDetailRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChargeDetailRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ConceptoPago':
          result.paymentConcept = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'PeriodoPago':
          result.paymentPeriod = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MultaPago':
          result.paymentPenalty = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'DescuentoPago':
          result.paymentDiscount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MontoPago':
          result.paymentAmount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'Facturable':
          result.isInvoice = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ChargeDetailRequest extends ChargeDetailRequest {
  @override
  final String paymentConcept;
  @override
  final String paymentPeriod;
  @override
  final String paymentPenalty;
  @override
  final String paymentDiscount;
  @override
  final String paymentAmount;
  @override
  final String isInvoice;

  factory _$ChargeDetailRequest(
          [void Function(ChargeDetailRequestBuilder)? updates]) =>
      (new ChargeDetailRequestBuilder()..update(updates))._build();

  _$ChargeDetailRequest._(
      {required this.paymentConcept,
      required this.paymentPeriod,
      required this.paymentPenalty,
      required this.paymentDiscount,
      required this.paymentAmount,
      required this.isInvoice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        paymentConcept, r'ChargeDetailRequest', 'paymentConcept');
    BuiltValueNullFieldError.checkNotNull(
        paymentPeriod, r'ChargeDetailRequest', 'paymentPeriod');
    BuiltValueNullFieldError.checkNotNull(
        paymentPenalty, r'ChargeDetailRequest', 'paymentPenalty');
    BuiltValueNullFieldError.checkNotNull(
        paymentDiscount, r'ChargeDetailRequest', 'paymentDiscount');
    BuiltValueNullFieldError.checkNotNull(
        paymentAmount, r'ChargeDetailRequest', 'paymentAmount');
    BuiltValueNullFieldError.checkNotNull(
        isInvoice, r'ChargeDetailRequest', 'isInvoice');
  }

  @override
  ChargeDetailRequest rebuild(
          void Function(ChargeDetailRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChargeDetailRequestBuilder toBuilder() =>
      new ChargeDetailRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChargeDetailRequest &&
        paymentConcept == other.paymentConcept &&
        paymentPeriod == other.paymentPeriod &&
        paymentPenalty == other.paymentPenalty &&
        paymentDiscount == other.paymentDiscount &&
        paymentAmount == other.paymentAmount &&
        isInvoice == other.isInvoice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentConcept.hashCode);
    _$hash = $jc(_$hash, paymentPeriod.hashCode);
    _$hash = $jc(_$hash, paymentPenalty.hashCode);
    _$hash = $jc(_$hash, paymentDiscount.hashCode);
    _$hash = $jc(_$hash, paymentAmount.hashCode);
    _$hash = $jc(_$hash, isInvoice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChargeDetailRequest')
          ..add('paymentConcept', paymentConcept)
          ..add('paymentPeriod', paymentPeriod)
          ..add('paymentPenalty', paymentPenalty)
          ..add('paymentDiscount', paymentDiscount)
          ..add('paymentAmount', paymentAmount)
          ..add('isInvoice', isInvoice))
        .toString();
  }
}

class ChargeDetailRequestBuilder
    implements Builder<ChargeDetailRequest, ChargeDetailRequestBuilder> {
  _$ChargeDetailRequest? _$v;

  String? _paymentConcept;
  String? get paymentConcept => _$this._paymentConcept;
  set paymentConcept(String? paymentConcept) =>
      _$this._paymentConcept = paymentConcept;

  String? _paymentPeriod;
  String? get paymentPeriod => _$this._paymentPeriod;
  set paymentPeriod(String? paymentPeriod) =>
      _$this._paymentPeriod = paymentPeriod;

  String? _paymentPenalty;
  String? get paymentPenalty => _$this._paymentPenalty;
  set paymentPenalty(String? paymentPenalty) =>
      _$this._paymentPenalty = paymentPenalty;

  String? _paymentDiscount;
  String? get paymentDiscount => _$this._paymentDiscount;
  set paymentDiscount(String? paymentDiscount) =>
      _$this._paymentDiscount = paymentDiscount;

  String? _paymentAmount;
  String? get paymentAmount => _$this._paymentAmount;
  set paymentAmount(String? paymentAmount) =>
      _$this._paymentAmount = paymentAmount;

  String? _isInvoice;
  String? get isInvoice => _$this._isInvoice;
  set isInvoice(String? isInvoice) => _$this._isInvoice = isInvoice;

  ChargeDetailRequestBuilder();

  ChargeDetailRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentConcept = $v.paymentConcept;
      _paymentPeriod = $v.paymentPeriod;
      _paymentPenalty = $v.paymentPenalty;
      _paymentDiscount = $v.paymentDiscount;
      _paymentAmount = $v.paymentAmount;
      _isInvoice = $v.isInvoice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChargeDetailRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChargeDetailRequest;
  }

  @override
  void update(void Function(ChargeDetailRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChargeDetailRequest build() => _build();

  _$ChargeDetailRequest _build() {
    final _$result = _$v ??
        new _$ChargeDetailRequest._(
            paymentConcept: BuiltValueNullFieldError.checkNotNull(
                paymentConcept, r'ChargeDetailRequest', 'paymentConcept'),
            paymentPeriod: BuiltValueNullFieldError.checkNotNull(
                paymentPeriod, r'ChargeDetailRequest', 'paymentPeriod'),
            paymentPenalty: BuiltValueNullFieldError.checkNotNull(
                paymentPenalty, r'ChargeDetailRequest', 'paymentPenalty'),
            paymentDiscount: BuiltValueNullFieldError.checkNotNull(
                paymentDiscount, r'ChargeDetailRequest', 'paymentDiscount'),
            paymentAmount: BuiltValueNullFieldError.checkNotNull(
                paymentAmount, r'ChargeDetailRequest', 'paymentAmount'),
            isInvoice: BuiltValueNullFieldError.checkNotNull(
                isInvoice, r'ChargeDetailRequest', 'isInvoice'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
