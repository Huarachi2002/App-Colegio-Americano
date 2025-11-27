import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'RegisterDeviceRequest.g.dart';

abstract class RegisterDeviceRequest
    implements Built<RegisterDeviceRequest, RegisterDeviceRequestBuilder> {
  RegisterDeviceRequest._();

  @BuiltValueField(wireName: 'token')
  String? get deviceId;

  @BuiltValueField(wireName: 'token_fcm')
  String? get fcmToken;

  factory RegisterDeviceRequest(
          [updates(
              RegisterDeviceRequestBuilder registerDeviceRequestBuilder)]) =
      _$RegisterDeviceRequest;

  static Serializer<RegisterDeviceRequest> get serializer =>
      _$registerDeviceRequestSerializer;
}
