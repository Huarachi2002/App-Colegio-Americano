import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:colegio_americano/src/data/remote/response/DebtDetailResponse.dart';

part 'DebtResponse.g.dart';

abstract class DebtResponse
    implements Built<DebtResponse, DebtResponseBuilder> {

  DebtResponse._();

  @BuiltValueField(wireName: 'idProceso')
  String get processId;

  @BuiltValueField(wireName: 'NombreDeudor')
  String get nameDebtor;

  @BuiltValueField(wireName: 'MonedaDeuda')
  String get debtCurrency;

  @BuiltValueField(wireName: 'MontoDeuda')
  String get debtAmount;

  @BuiltValueField(wireName: 'DetalleDeuda')
  BuiltList<DebtDetailResponse> get details;

  factory DebtResponse(
      [updates(DebtResponseBuilder debtResponseBuilder)]) = _$DebtResponse;

  static Serializer<DebtResponse> get serializer => _$debtResponseSerializer;
}