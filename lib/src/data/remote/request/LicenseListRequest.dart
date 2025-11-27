import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'LicenseListRequest.g.dart';

abstract class LicenseListRequest
    implements Built<LicenseListRequest, LicenseListRequestBuilder> {

  @BuiltValueField(wireName: 'buscar')
  String get search;

  @BuiltValueField(wireName: 'posicion')
  int get position;

  @BuiltValueField(wireName: 'cantidad')
  int get quantity;


  LicenseListRequest._();

  factory LicenseListRequest([updates(LicenseListRequestBuilder licenseListRequestBuilder)]) =
      _$LicenseListRequest;

  static Serializer<LicenseListRequest> get serializer => _$licenseListRequestSerializer;
}