import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ChargeDetailRequest.g.dart';

abstract class ChargeDetailRequest
    implements Built<ChargeDetailRequest, ChargeDetailRequestBuilder> {

  ChargeDetailRequest._();

  @BuiltValueField(wireName: 'ConceptoPago')
  String get paymentConcept;

  @BuiltValueField(wireName: 'PeriodoPago')
  String get paymentPeriod;

  @BuiltValueField(wireName: 'MultaPago')
  String get paymentPenalty;

  @BuiltValueField(wireName: 'DescuentoPago')
  String get paymentDiscount;

  @BuiltValueField(wireName: 'MontoPago')
  String get paymentAmount;

  @BuiltValueField(wireName: 'Facturable')
  String get isInvoice;


  factory ChargeDetailRequest([updates(
      ChargeDetailRequestBuilder chargeDetailRequestBuilder)]) = _$ChargeDetailRequest;

  static Serializer<ChargeDetailRequest> get serializer =>
      _$chargeDetailRequestSerializer;
}