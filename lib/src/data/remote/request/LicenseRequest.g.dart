// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LicenseRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LicenseRequest> _$licenseRequestSerializer =
    new _$LicenseRequestSerializer();

class _$LicenseRequestSerializer
    implements StructuredSerializer<LicenseRequest> {
  @override
  final Iterable<Type> types = const [LicenseRequest, _$LicenseRequest];
  @override
  final String wireName = 'LicenseRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, LicenseRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entity',
      serializers.serialize(object.entity,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LicenseRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LicenseRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entity':
          result.entity = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LicenseRequest extends LicenseRequest {
  @override
  final String entity;

  factory _$LicenseRequest([void Function(LicenseRequestBuilder)? updates]) =>
      (new LicenseRequestBuilder()..update(updates))._build();

  _$LicenseRequest._({required this.entity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(entity, r'LicenseRequest', 'entity');
  }

  @override
  LicenseRequest rebuild(void Function(LicenseRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LicenseRequestBuilder toBuilder() =>
      new LicenseRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LicenseRequest && entity == other.entity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, entity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LicenseRequest')
          ..add('entity', entity))
        .toString();
  }
}

class LicenseRequestBuilder
    implements Builder<LicenseRequest, LicenseRequestBuilder> {
  _$LicenseRequest? _$v;

  String? _entity;
  String? get entity => _$this._entity;
  set entity(String? entity) => _$this._entity = entity;

  LicenseRequestBuilder();

  LicenseRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entity = $v.entity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LicenseRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LicenseRequest;
  }

  @override
  void update(void Function(LicenseRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LicenseRequest build() => _build();

  _$LicenseRequest _build() {
    final _$result = _$v ??
        new _$LicenseRequest._(
            entity: BuiltValueNullFieldError.checkNotNull(
                entity, r'LicenseRequest', 'entity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
