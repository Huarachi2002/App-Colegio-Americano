import 'dart:ffi';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:colegio_americano/src/data/remote/request/ChargeDetailRequest.dart';
import 'package:colegio_americano/src/data/remote/request/InvoiceDetailRequest.dart';

part 'DebtInformationRequest.g.dart';

abstract class DebtInformationRequest
    implements Built<DebtInformationRequest, DebtInformationRequestBuilder> {

  DebtInformationRequest._();

  @BuiltValueField(wireName: 'idProceso')
  String get processId;

  @BuiltValueField(wireName: 'idTransaccion')
  String get transactionId;

  @BuiltValueField(wireName: 'NombreDeudor')
  String get debtorName;

  @BuiltValueField(wireName: 'MonedaDelCobro')
  String get currency;

  @BuiltValueField(wireName: 'MontoDelCobro')
  String get amount;

  @BuiltValueField(wireName: 'DetalleDelCobro')
  ChargeDetailRequest get chargeDetail;

  @BuiltValueField(wireName: 'DatosFactura')
  InvoiceDetailRequest get invoiceDetail;

  factory DebtInformationRequest([updates(
      DebtInformationRequestBuilder debtInformationRequestBuilder)]) = _$DebtInformationRequest;

  static Serializer<DebtInformationRequest> get serializer =>
      _$debtInformationRequestSerializer;
}