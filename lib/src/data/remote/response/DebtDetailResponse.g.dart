// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DebtDetailResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DebtDetailResponse> _$debtDetailResponseSerializer =
    new _$DebtDetailResponseSerializer();

class _$DebtDetailResponseSerializer
    implements StructuredSerializer<DebtDetailResponse> {
  @override
  final Iterable<Type> types = const [DebtDetailResponse, _$DebtDetailResponse];
  @override
  final String wireName = 'DebtDetailResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DebtDetailResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ConceptoDeuda',
      serializers.serialize(object.debtConcept,
          specifiedType: const FullType(String)),
      'PeriodoDeuda',
      serializers.serialize(object.period,
          specifiedType: const FullType(String)),
      'MultaDeuda',
      serializers.serialize(object.penalty,
          specifiedType: const FullType(String)),
      'DescuentoDeuda',
      serializers.serialize(object.discount,
          specifiedType: const FullType(String)),
      'MontoDeuda',
      serializers.serialize(object.amount,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DebtDetailResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DebtDetailResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ConceptoDeuda':
          result.debtConcept = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'PeriodoDeuda':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MultaDeuda':
          result.penalty = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'DescuentoDeuda':
          result.discount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MontoDeuda':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DebtDetailResponse extends DebtDetailResponse {
  @override
  final String debtConcept;
  @override
  final String period;
  @override
  final String penalty;
  @override
  final String discount;
  @override
  final String amount;

  factory _$DebtDetailResponse(
          [void Function(DebtDetailResponseBuilder)? updates]) =>
      (new DebtDetailResponseBuilder()..update(updates))._build();

  _$DebtDetailResponse._(
      {required this.debtConcept,
      required this.period,
      required this.penalty,
      required this.discount,
      required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        debtConcept, r'DebtDetailResponse', 'debtConcept');
    BuiltValueNullFieldError.checkNotNull(
        period, r'DebtDetailResponse', 'period');
    BuiltValueNullFieldError.checkNotNull(
        penalty, r'DebtDetailResponse', 'penalty');
    BuiltValueNullFieldError.checkNotNull(
        discount, r'DebtDetailResponse', 'discount');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'DebtDetailResponse', 'amount');
  }

  @override
  DebtDetailResponse rebuild(
          void Function(DebtDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DebtDetailResponseBuilder toBuilder() =>
      new DebtDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DebtDetailResponse &&
        debtConcept == other.debtConcept &&
        period == other.period &&
        penalty == other.penalty &&
        discount == other.discount &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, debtConcept.hashCode);
    _$hash = $jc(_$hash, period.hashCode);
    _$hash = $jc(_$hash, penalty.hashCode);
    _$hash = $jc(_$hash, discount.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DebtDetailResponse')
          ..add('debtConcept', debtConcept)
          ..add('period', period)
          ..add('penalty', penalty)
          ..add('discount', discount)
          ..add('amount', amount))
        .toString();
  }
}

class DebtDetailResponseBuilder
    implements Builder<DebtDetailResponse, DebtDetailResponseBuilder> {
  _$DebtDetailResponse? _$v;

  String? _debtConcept;
  String? get debtConcept => _$this._debtConcept;
  set debtConcept(String? debtConcept) => _$this._debtConcept = debtConcept;

  String? _period;
  String? get period => _$this._period;
  set period(String? period) => _$this._period = period;

  String? _penalty;
  String? get penalty => _$this._penalty;
  set penalty(String? penalty) => _$this._penalty = penalty;

  String? _discount;
  String? get discount => _$this._discount;
  set discount(String? discount) => _$this._discount = discount;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  DebtDetailResponseBuilder();

  DebtDetailResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _debtConcept = $v.debtConcept;
      _period = $v.period;
      _penalty = $v.penalty;
      _discount = $v.discount;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DebtDetailResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DebtDetailResponse;
  }

  @override
  void update(void Function(DebtDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DebtDetailResponse build() => _build();

  _$DebtDetailResponse _build() {
    final _$result = _$v ??
        new _$DebtDetailResponse._(
            debtConcept: BuiltValueNullFieldError.checkNotNull(
                debtConcept, r'DebtDetailResponse', 'debtConcept'),
            period: BuiltValueNullFieldError.checkNotNull(
                period, r'DebtDetailResponse', 'period'),
            penalty: BuiltValueNullFieldError.checkNotNull(
                penalty, r'DebtDetailResponse', 'penalty'),
            discount: BuiltValueNullFieldError.checkNotNull(
                discount, r'DebtDetailResponse', 'discount'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'DebtDetailResponse', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
