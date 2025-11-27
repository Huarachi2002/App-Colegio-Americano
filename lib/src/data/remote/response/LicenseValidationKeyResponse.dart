import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'LicenseValidationKeyResponse.g.dart';

abstract class LicenseValidationKeyResponse
    implements
        Built<LicenseValidationKeyResponse,
            LicenseValidationKeyResponseBuilder> {
  @BuiltValueField(wireName: 'llaveValidacion')
  String get key;

  LicenseValidationKeyResponse._();

  factory LicenseValidationKeyResponse(
          [updates(
              LicenseValidationKeyResponseBuilder
                  licenseValidationKeyResponseBuilder)]) =
      _$LicenseValidationKeyResponse;

  static Serializer<LicenseValidationKeyResponse> get serializer =>
      _$licenseValidationKeyResponseSerializer;
}
