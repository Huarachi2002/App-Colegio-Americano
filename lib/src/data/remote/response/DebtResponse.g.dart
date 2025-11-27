// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DebtResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DebtResponse> _$debtResponseSerializer =
    new _$DebtResponseSerializer();

class _$DebtResponseSerializer implements StructuredSerializer<DebtResponse> {
  @override
  final Iterable<Type> types = const [DebtResponse, _$DebtResponse];
  @override
  final String wireName = 'DebtResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, DebtResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'idProceso',
      serializers.serialize(object.processId,
          specifiedType: const FullType(String)),
      'NombreDeudor',
      serializers.serialize(object.nameDebtor,
          specifiedType: const FullType(String)),
      'MonedaDeuda',
      serializers.serialize(object.debtCurrency,
          specifiedType: const FullType(String)),
      'MontoDeuda',
      serializers.serialize(object.debtAmount,
          specifiedType: const FullType(String)),
      'DetalleDeuda',
      serializers.serialize(object.details,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DebtDetailResponse)])),
    ];

    return result;
  }

  @override
  DebtResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DebtResponseBuilder();

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
        case 'NombreDeudor':
          result.nameDebtor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MonedaDeuda':
          result.debtCurrency = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MontoDeuda':
          result.debtAmount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'DetalleDeuda':
          result.details.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DebtDetailResponse)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DebtResponse extends DebtResponse {
  @override
  final String processId;
  @override
  final String nameDebtor;
  @override
  final String debtCurrency;
  @override
  final String debtAmount;
  @override
  final BuiltList<DebtDetailResponse> details;

  factory _$DebtResponse([void Function(DebtResponseBuilder)? updates]) =>
      (new DebtResponseBuilder()..update(updates))._build();

  _$DebtResponse._(
      {required this.processId,
      required this.nameDebtor,
      required this.debtCurrency,
      required this.debtAmount,
      required this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        processId, r'DebtResponse', 'processId');
    BuiltValueNullFieldError.checkNotNull(
        nameDebtor, r'DebtResponse', 'nameDebtor');
    BuiltValueNullFieldError.checkNotNull(
        debtCurrency, r'DebtResponse', 'debtCurrency');
    BuiltValueNullFieldError.checkNotNull(
        debtAmount, r'DebtResponse', 'debtAmount');
    BuiltValueNullFieldError.checkNotNull(details, r'DebtResponse', 'details');
  }

  @override
  DebtResponse rebuild(void Function(DebtResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DebtResponseBuilder toBuilder() => new DebtResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DebtResponse &&
        processId == other.processId &&
        nameDebtor == other.nameDebtor &&
        debtCurrency == other.debtCurrency &&
        debtAmount == other.debtAmount &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processId.hashCode);
    _$hash = $jc(_$hash, nameDebtor.hashCode);
    _$hash = $jc(_$hash, debtCurrency.hashCode);
    _$hash = $jc(_$hash, debtAmount.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DebtResponse')
          ..add('processId', processId)
          ..add('nameDebtor', nameDebtor)
          ..add('debtCurrency', debtCurrency)
          ..add('debtAmount', debtAmount)
          ..add('details', details))
        .toString();
  }
}

class DebtResponseBuilder
    implements Builder<DebtResponse, DebtResponseBuilder> {
  _$DebtResponse? _$v;

  String? _processId;
  String? get processId => _$this._processId;
  set processId(String? processId) => _$this._processId = processId;

  String? _nameDebtor;
  String? get nameDebtor => _$this._nameDebtor;
  set nameDebtor(String? nameDebtor) => _$this._nameDebtor = nameDebtor;

  String? _debtCurrency;
  String? get debtCurrency => _$this._debtCurrency;
  set debtCurrency(String? debtCurrency) => _$this._debtCurrency = debtCurrency;

  String? _debtAmount;
  String? get debtAmount => _$this._debtAmount;
  set debtAmount(String? debtAmount) => _$this._debtAmount = debtAmount;

  ListBuilder<DebtDetailResponse>? _details;
  ListBuilder<DebtDetailResponse> get details =>
      _$this._details ??= new ListBuilder<DebtDetailResponse>();
  set details(ListBuilder<DebtDetailResponse>? details) =>
      _$this._details = details;

  DebtResponseBuilder();

  DebtResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processId = $v.processId;
      _nameDebtor = $v.nameDebtor;
      _debtCurrency = $v.debtCurrency;
      _debtAmount = $v.debtAmount;
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DebtResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DebtResponse;
  }

  @override
  void update(void Function(DebtResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DebtResponse build() => _build();

  _$DebtResponse _build() {
    _$DebtResponse _$result;
    try {
      _$result = _$v ??
          new _$DebtResponse._(
              processId: BuiltValueNullFieldError.checkNotNull(
                  processId, r'DebtResponse', 'processId'),
              nameDebtor: BuiltValueNullFieldError.checkNotNull(
                  nameDebtor, r'DebtResponse', 'nameDebtor'),
              debtCurrency: BuiltValueNullFieldError.checkNotNull(
                  debtCurrency, r'DebtResponse', 'debtCurrency'),
              debtAmount: BuiltValueNullFieldError.checkNotNull(
                  debtAmount, r'DebtResponse', 'debtAmount'),
              details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DebtResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
