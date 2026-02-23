import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:colegio_americano/src/data/remote/request/DebtInformationRequest.dart';

part 'QrGenerationRequest.g.dart';

abstract class QrGenerationRequest
    implements Built<QrGenerationRequest, QrGenerationRequestBuilder> {
  QrGenerationRequest._();

  @BuiltValueField(wireName: 'erp_code')
  String get erpCode;

  @BuiltValueField(wireName: 'debt_information')
  DebtInformationRequest get debtInformation;

  factory QrGenerationRequest(
          [updates(QrGenerationRequestBuilder qrGenerationRequestBuilder)]) =
      _$QrGenerationRequest;

  static Serializer<QrGenerationRequest> get serializer =>
      _$qrGenerationRequestSerializer;
}
