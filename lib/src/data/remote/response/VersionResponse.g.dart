// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VersionResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VersionResponse> _$versionResponseSerializer =
    new _$VersionResponseSerializer();

class _$VersionResponseSerializer
    implements StructuredSerializer<VersionResponse> {
  @override
  final Iterable<Type> types = const [VersionResponse, _$VersionResponse];
  @override
  final String wireName = 'VersionResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, VersionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'apk_version',
      serializers.serialize(object.apkVersion,
          specifiedType: const FullType(String)),
      'ipa_version',
      serializers.serialize(object.ipaVersion,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VersionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VersionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'apk_version':
          result.apkVersion = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ipa_version':
          result.ipaVersion = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VersionResponse extends VersionResponse {
  @override
  final String apkVersion;
  @override
  final String ipaVersion;

  factory _$VersionResponse([void Function(VersionResponseBuilder)? updates]) =>
      (new VersionResponseBuilder()..update(updates))._build();

  _$VersionResponse._({required this.apkVersion, required this.ipaVersion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        apkVersion, r'VersionResponse', 'apkVersion');
    BuiltValueNullFieldError.checkNotNull(
        ipaVersion, r'VersionResponse', 'ipaVersion');
  }

  @override
  VersionResponse rebuild(void Function(VersionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VersionResponseBuilder toBuilder() =>
      new VersionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VersionResponse &&
        apkVersion == other.apkVersion &&
        ipaVersion == other.ipaVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apkVersion.hashCode);
    _$hash = $jc(_$hash, ipaVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VersionResponse')
          ..add('apkVersion', apkVersion)
          ..add('ipaVersion', ipaVersion))
        .toString();
  }
}

class VersionResponseBuilder
    implements Builder<VersionResponse, VersionResponseBuilder> {
  _$VersionResponse? _$v;

  String? _apkVersion;
  String? get apkVersion => _$this._apkVersion;
  set apkVersion(String? apkVersion) => _$this._apkVersion = apkVersion;

  String? _ipaVersion;
  String? get ipaVersion => _$this._ipaVersion;
  set ipaVersion(String? ipaVersion) => _$this._ipaVersion = ipaVersion;

  VersionResponseBuilder();

  VersionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apkVersion = $v.apkVersion;
      _ipaVersion = $v.ipaVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VersionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VersionResponse;
  }

  @override
  void update(void Function(VersionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VersionResponse build() => _build();

  _$VersionResponse _build() {
    final _$result = _$v ??
        new _$VersionResponse._(
            apkVersion: BuiltValueNullFieldError.checkNotNull(
                apkVersion, r'VersionResponse', 'apkVersion'),
            ipaVersion: BuiltValueNullFieldError.checkNotNull(
                ipaVersion, r'VersionResponse', 'ipaVersion'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
