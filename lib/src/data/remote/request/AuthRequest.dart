import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AuthRequest.g.dart';

abstract class AuthRequest implements Built<AuthRequest, AuthRequestBuilder> {
  AuthRequest._();

  @BuiltValueField(wireName: 'username')
  String? get username;

  @BuiltValueField(wireName: 'password')
  String? get password;

  @BuiltValueField(wireName: 'codeParent')
  String? get codeParent;

  factory AuthRequest([updates(AuthRequestBuilder authRequestBuilder)]) =
      _$AuthRequest;

  static Serializer<AuthRequest> get serializer => _$authRequestSerializer;
}
