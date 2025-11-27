import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'LoginRequest.g.dart';

abstract class LoginRequest
    implements Built<LoginRequest, LoginRequestBuilder> {
  LoginRequest._();

  @BuiltValueField(wireName: 'username')
  String get username;

  @BuiltValueField(wireName: 'password')
  String get password;

  @BuiltValueField(wireName: 'device_token')
  String? get deviceToken;

  factory LoginRequest([updates(LoginRequestBuilder loginRequestBuilder)]) =
      _$LoginRequest;

  static Serializer<LoginRequest> get serializer => _$loginRequestSerializer;
}
