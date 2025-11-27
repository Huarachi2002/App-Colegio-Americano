import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'UpdateDeviceRequest.g.dart';

abstract class UpdateDeviceRequest
    implements Built<UpdateDeviceRequest, UpdateDeviceRequestBuilder> {

  UpdateDeviceRequest._();
  
  @BuiltValueField(wireName: 'id')
  String? get id;
  
  @BuiltValueField(wireName: 'token')
  String? get deviceId;
  
  @BuiltValueField(wireName: 'token_fcm')
  String? get fcmToken;

  factory UpdateDeviceRequest([updates(
      UpdateDeviceRequestBuilder updateDeviceRequestBuilder)]) = _$UpdateDeviceRequest;

  static Serializer<UpdateDeviceRequest> get serializer =>
      _$updateDeviceRequestSerializer;
}