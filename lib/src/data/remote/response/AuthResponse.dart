import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AuthResponse.g.dart';

abstract class AuthResponse
    implements Built<AuthResponse, AuthResponseBuilder> {
  AuthResponse._();

  @BuiltValueField(wireName: 'authorization')
  String? get authorization;

  factory AuthResponse([updates(AuthResponseBuilder authResponseBuilder)]) =
  _$AuthResponse;

  static Serializer<AuthResponse> get serializer => _$authResponseSerializer;
}
