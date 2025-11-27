import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'LicenseRequest.g.dart';

abstract class LicenseRequest
    implements Built<LicenseRequest, LicenseRequestBuilder> {

  @BuiltValueField(wireName: 'entity')
  String get entity;

  LicenseRequest._();

  factory LicenseRequest([updates(LicenseRequestBuilder licenseRequestBuilder)]) =
      _$LicenseRequest;

  static Serializer<LicenseRequest> get serializer => _$licenseRequestSerializer;
}