import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'InvoiceDetailRequest.g.dart';

abstract class InvoiceDetailRequest
    implements Built<InvoiceDetailRequest, InvoiceDetailRequestBuilder> {

  InvoiceDetailRequest._();

  @BuiltValueField(wireName: 'IdGeneraFact')
  String? get idGenerateInvoice;

  @BuiltValueField(wireName: 'NITCIFact')
  String? get nitCiFact;

  @BuiltValueField(wireName: 'NombreFact')
  String? get invoiceName;

  @BuiltValueField(wireName: 'ModDatosFact')
  String? get modifyInvoiceData;

  //TODO: Adicional Campos
  @BuiltValueField(wireName: 'DocumentType')
  String? get documentType; // Number 1 - 5

  @BuiltValueField(wireName: 'Complement')
  String? get complement;

  factory InvoiceDetailRequest([updates(
      InvoiceDetailRequestBuilder invoiceDetailRequestBuilder)]) = _$InvoiceDetailRequest;

  static Serializer<InvoiceDetailRequest> get serializer =>
      _$invoiceDetailRequestSerializer;
}