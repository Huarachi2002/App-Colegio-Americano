import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'DebtDetailResponse.g.dart';

abstract class DebtDetailResponse
    implements Built<DebtDetailResponse, DebtDetailResponseBuilder> {

  DebtDetailResponse._();

  @BuiltValueField(wireName: 'ConceptoDeuda')
  String get debtConcept;

  @BuiltValueField(wireName: 'PeriodoDeuda')
  String get period;

  @BuiltValueField(wireName: 'MultaDeuda')
  String get penalty;

  @BuiltValueField(wireName: 'DescuentoDeuda')
  String get discount;

  @BuiltValueField(wireName: 'MontoDeuda')
  String get amount;

  factory DebtDetailResponse([updates(
      DebtDetailResponseBuilder debtDetailResponseBuilder)]) = _$DebtDetailResponse;

  static Serializer<DebtDetailResponse> get serializer =>
      _$debtDetailResponseSerializer;
}