import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'RegisterDeviceResponse.g.dart';

abstract class RegisterDeviceResponse
    implements Built<RegisterDeviceResponse, RegisterDeviceResponseBuilder> {

  RegisterDeviceResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'token')
  String? get deviceId;

  factory RegisterDeviceResponse([updates(
      RegisterDeviceResponseBuilder registerDeviceResponseBuilder)]) = _$RegisterDeviceResponse;

  static Serializer<RegisterDeviceResponse> get serializer =>
      _$registerDeviceResponseSerializer;
}