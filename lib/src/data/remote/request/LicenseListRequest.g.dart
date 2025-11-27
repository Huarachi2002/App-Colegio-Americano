// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LicenseListRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LicenseListRequest> _$licenseListRequestSerializer =
    new _$LicenseListRequestSerializer();

class _$LicenseListRequestSerializer
    implements StructuredSerializer<LicenseListRequest> {
  @override
  final Iterable<Type> types = const [LicenseListRequest, _$LicenseListRequest];
  @override
  final String wireName = 'LicenseListRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LicenseListRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'buscar',
      serializers.serialize(object.search,
          specifiedType: const FullType(String)),
      'posicion',
      serializers.serialize(object.position,
          specifiedType: const FullType(int)),
      'cantidad',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  LicenseListRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LicenseListRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'buscar':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'posicion':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'cantidad':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$LicenseListRequest extends LicenseListRequest {
  @override
  final String search;
  @override
  final int position;
  @override
  final int quantity;

  factory _$LicenseListRequest(
          [void Function(LicenseListRequestBuilder)? updates]) =>
      (new LicenseListRequestBuilder()..update(updates))._build();

  _$LicenseListRequest._(
      {required this.search, required this.position, required this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        search, r'LicenseListRequest', 'search');
    BuiltValueNullFieldError.checkNotNull(
        position, r'LicenseListRequest', 'position');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'LicenseListRequest', 'quantity');
  }

  @override
  LicenseListRequest rebuild(
          void Function(LicenseListRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LicenseListRequestBuilder toBuilder() =>
      new LicenseListRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LicenseListRequest &&
        search == other.search &&
        position == other.position &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LicenseListRequest')
          ..add('search', search)
          ..add('position', position)
          ..add('quantity', quantity))
        .toString();
  }
}

class LicenseListRequestBuilder
    implements Builder<LicenseListRequest, LicenseListRequestBuilder> {
  _$LicenseListRequest? _$v;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  LicenseListRequestBuilder();

  LicenseListRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _search = $v.search;
      _position = $v.position;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LicenseListRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LicenseListRequest;
  }

  @override
  void update(void Function(LicenseListRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LicenseListRequest build() => _build();

  _$LicenseListRequest _build() {
    final _$result = _$v ??
        new _$LicenseListRequest._(
            search: BuiltValueNullFieldError.checkNotNull(
                search, r'LicenseListRequest', 'search'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'LicenseListRequest', 'position'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'LicenseListRequest', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
