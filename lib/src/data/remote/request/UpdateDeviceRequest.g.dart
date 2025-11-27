// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateDeviceRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateDeviceRequest> _$updateDeviceRequestSerializer =
    new _$UpdateDeviceRequestSerializer();

class _$UpdateDeviceRequestSerializer
    implements StructuredSerializer<UpdateDeviceRequest> {
  @override
  final Iterable<Type> types = const [
    UpdateDeviceRequest,
    _$UpdateDeviceRequest
  ];
  @override
  final String wireName = 'UpdateDeviceRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UpdateDeviceRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deviceId;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fcmToken;
    if (value != null) {
      result
        ..add('token_fcm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UpdateDeviceRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateDeviceRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token_fcm':
          result.fcmToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateDeviceRequest extends UpdateDeviceRequest {
  @override
  final String? id;
  @override
  final String? deviceId;
  @override
  final String? fcmToken;

  factory _$UpdateDeviceRequest(
          [void Function(UpdateDeviceRequestBuilder)? updates]) =>
      (new UpdateDeviceRequestBuilder()..update(updates))._build();

  _$UpdateDeviceRequest._({this.id, this.deviceId, this.fcmToken}) : super._();

  @override
  UpdateDeviceRequest rebuild(
          void Function(UpdateDeviceRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateDeviceRequestBuilder toBuilder() =>
      new UpdateDeviceRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateDeviceRequest &&
        id == other.id &&
        deviceId == other.deviceId &&
        fcmToken == other.fcmToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateDeviceRequest')
          ..add('id', id)
          ..add('deviceId', deviceId)
          ..add('fcmToken', fcmToken))
        .toString();
  }
}

class UpdateDeviceRequestBuilder
    implements Builder<UpdateDeviceRequest, UpdateDeviceRequestBuilder> {
  _$UpdateDeviceRequest? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  UpdateDeviceRequestBuilder();

  UpdateDeviceRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _deviceId = $v.deviceId;
      _fcmToken = $v.fcmToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateDeviceRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateDeviceRequest;
  }

  @override
  void update(void Function(UpdateDeviceRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateDeviceRequest build() => _build();

  _$UpdateDeviceRequest _build() {
    final _$result = _$v ??
        new _$UpdateDeviceRequest._(
            id: id, deviceId: deviceId, fcmToken: fcmToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
