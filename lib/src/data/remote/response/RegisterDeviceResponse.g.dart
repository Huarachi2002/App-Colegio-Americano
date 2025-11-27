// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterDeviceResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterDeviceResponse> _$registerDeviceResponseSerializer =
    new _$RegisterDeviceResponseSerializer();

class _$RegisterDeviceResponseSerializer
    implements StructuredSerializer<RegisterDeviceResponse> {
  @override
  final Iterable<Type> types = const [
    RegisterDeviceResponse,
    _$RegisterDeviceResponse
  ];
  @override
  final String wireName = 'RegisterDeviceResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RegisterDeviceResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.deviceId;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RegisterDeviceResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterDeviceResponseBuilder();

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
        case 'token':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterDeviceResponse extends RegisterDeviceResponse {
  @override
  final int id;
  @override
  final String? deviceId;

  factory _$RegisterDeviceResponse(
          [void Function(RegisterDeviceResponseBuilder)? updates]) =>
      (new RegisterDeviceResponseBuilder()..update(updates))._build();

  _$RegisterDeviceResponse._({required this.id, this.deviceId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'RegisterDeviceResponse', 'id');
  }

  @override
  RegisterDeviceResponse rebuild(
          void Function(RegisterDeviceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterDeviceResponseBuilder toBuilder() =>
      new RegisterDeviceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterDeviceResponse &&
        id == other.id &&
        deviceId == other.deviceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterDeviceResponse')
          ..add('id', id)
          ..add('deviceId', deviceId))
        .toString();
  }
}

class RegisterDeviceResponseBuilder
    implements Builder<RegisterDeviceResponse, RegisterDeviceResponseBuilder> {
  _$RegisterDeviceResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  RegisterDeviceResponseBuilder();

  RegisterDeviceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _deviceId = $v.deviceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterDeviceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterDeviceResponse;
  }

  @override
  void update(void Function(RegisterDeviceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterDeviceResponse build() => _build();

  _$RegisterDeviceResponse _build() {
    final _$result = _$v ??
        new _$RegisterDeviceResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'RegisterDeviceResponse', 'id'),
            deviceId: deviceId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
