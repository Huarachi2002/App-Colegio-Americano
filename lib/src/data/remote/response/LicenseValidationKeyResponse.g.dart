// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LicenseValidationKeyResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LicenseValidationKeyResponse>
    _$licenseValidationKeyResponseSerializer =
    new _$LicenseValidationKeyResponseSerializer();

class _$LicenseValidationKeyResponseSerializer
    implements StructuredSerializer<LicenseValidationKeyResponse> {
  @override
  final Iterable<Type> types = const [
    LicenseValidationKeyResponse,
    _$LicenseValidationKeyResponse
  ];
  @override
  final String wireName = 'LicenseValidationKeyResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LicenseValidationKeyResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'llaveValidacion',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LicenseValidationKeyResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LicenseValidationKeyResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'llaveValidacion':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LicenseValidationKeyResponse extends LicenseValidationKeyResponse {
  @override
  final String key;

  factory _$LicenseValidationKeyResponse(
          [void Function(LicenseValidationKeyResponseBuilder)? updates]) =>
      (new LicenseValidationKeyResponseBuilder()..update(updates))._build();

  _$LicenseValidationKeyResponse._({required this.key}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        key, r'LicenseValidationKeyResponse', 'key');
  }

  @override
  LicenseValidationKeyResponse rebuild(
          void Function(LicenseValidationKeyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LicenseValidationKeyResponseBuilder toBuilder() =>
      new LicenseValidationKeyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LicenseValidationKeyResponse && key == other.key;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LicenseValidationKeyResponse')
          ..add('key', key))
        .toString();
  }
}

class LicenseValidationKeyResponseBuilder
    implements
        Builder<LicenseValidationKeyResponse,
            LicenseValidationKeyResponseBuilder> {
  _$LicenseValidationKeyResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  LicenseValidationKeyResponseBuilder();

  LicenseValidationKeyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LicenseValidationKeyResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LicenseValidationKeyResponse;
  }

  @override
  void update(void Function(LicenseValidationKeyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LicenseValidationKeyResponse build() => _build();

  _$LicenseValidationKeyResponse _build() {
    final _$result = _$v ??
        new _$LicenseValidationKeyResponse._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'LicenseValidationKeyResponse', 'key'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
