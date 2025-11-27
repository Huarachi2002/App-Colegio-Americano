import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'VersionResponse.g.dart';

abstract class VersionResponse
    implements Built<VersionResponse, VersionResponseBuilder> {

  VersionResponse._();

  @BuiltValueField(wireName: 'apk_version')
  String get apkVersion;

  @BuiltValueField(wireName: 'ipa_version')
  String get ipaVersion;

  factory VersionResponse([updates(
      VersionResponseBuilder versionResponseBuilder)]) = _$VersionResponse;

  static Serializer<VersionResponse> get serializer =>
      _$versionResponseSerializer;
}