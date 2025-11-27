import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'LoginResponse.g.dart';

abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {

  LoginResponse._();

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'entity_type')
  String get entityType;


  @BuiltValueField(wireName: 'entity_id')
  int get entityId;

  @BuiltValueField(wireName: 'api_token')
  String get apiToken;

  @BuiltValueField(wireName: 'user_type')
  String get userType;


  factory LoginResponse(
      [updates(LoginResponseBuilder loginResponseBuilder)]) = _$LoginResponse;

  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}