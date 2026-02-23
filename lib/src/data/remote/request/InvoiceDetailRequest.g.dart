// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InvoiceDetailRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvoiceDetailRequest> _$invoiceDetailRequestSerializer =
    new _$InvoiceDetailRequestSerializer();

class _$InvoiceDetailRequestSerializer
    implements StructuredSerializer<InvoiceDetailRequest> {
  @override
  final Iterable<Type> types = const [
    InvoiceDetailRequest,
    _$InvoiceDetailRequest
  ];
  @override
  final String wireName = 'InvoiceDetailRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InvoiceDetailRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.idGenerateInvoice;
    if (value != null) {
      result
        ..add('IdGeneraFact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nitCiFact;
    if (value != null) {
      result
        ..add('NITCIFact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.invoiceName;
    if (value != null) {
      result
        ..add('NombreFact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.modifyInvoiceData;
    if (value != null) {
      result
        ..add('ModDatosFact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.documentType;
    if (value != null) {
      result
        ..add('DocumentType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.complement;
    if (value != null) {
      result
        ..add('Complement')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InvoiceDetailRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoiceDetailRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'IdGeneraFact':
          result.idGenerateInvoice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'NITCIFact':
          result.nitCiFact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'NombreFact':
          result.invoiceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ModDatosFact':
          result.modifyInvoiceData = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'DocumentType':
          result.documentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Complement':
          result.complement = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$InvoiceDetailRequest extends InvoiceDetailRequest {
  @override
  final String? idGenerateInvoice;
  @override
  final String? nitCiFact;
  @override
  final String? invoiceName;
  @override
  final String? modifyInvoiceData;
  @override
  final String? documentType;
  @override
  final String? complement;

  factory _$InvoiceDetailRequest(
          [void Function(InvoiceDetailRequestBuilder)? updates]) =>
      (new InvoiceDetailRequestBuilder()..update(updates))._build();

  _$InvoiceDetailRequest._(
      {this.idGenerateInvoice,
      this.nitCiFact,
      this.invoiceName,
      this.modifyInvoiceData,
      this.documentType,
      this.complement})
      : super._();

  @override
  InvoiceDetailRequest rebuild(
          void Function(InvoiceDetailRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoiceDetailRequestBuilder toBuilder() =>
      new InvoiceDetailRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvoiceDetailRequest &&
        idGenerateInvoice == other.idGenerateInvoice &&
        nitCiFact == other.nitCiFact &&
        invoiceName == other.invoiceName &&
        modifyInvoiceData == other.modifyInvoiceData &&
        documentType == other.documentType &&
        complement == other.complement;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idGenerateInvoice.hashCode);
    _$hash = $jc(_$hash, nitCiFact.hashCode);
    _$hash = $jc(_$hash, invoiceName.hashCode);
    _$hash = $jc(_$hash, modifyInvoiceData.hashCode);
    _$hash = $jc(_$hash, documentType.hashCode);
    _$hash = $jc(_$hash, complement.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvoiceDetailRequest')
          ..add('idGenerateInvoice', idGenerateInvoice)
          ..add('nitCiFact', nitCiFact)
          ..add('invoiceName', invoiceName)
          ..add('modifyInvoiceData', modifyInvoiceData)
          ..add('documentType', documentType)
          ..add('complement', complement))
        .toString();
  }
}

class InvoiceDetailRequestBuilder
    implements Builder<InvoiceDetailRequest, InvoiceDetailRequestBuilder> {
  _$InvoiceDetailRequest? _$v;

  String? _idGenerateInvoice;
  String? get idGenerateInvoice => _$this._idGenerateInvoice;
  set idGenerateInvoice(String? idGenerateInvoice) =>
      _$this._idGenerateInvoice = idGenerateInvoice;

  String? _nitCiFact;
  String? get nitCiFact => _$this._nitCiFact;
  set nitCiFact(String? nitCiFact) => _$this._nitCiFact = nitCiFact;

  String? _invoiceName;
  String? get invoiceName => _$this._invoiceName;
  set invoiceName(String? invoiceName) => _$this._invoiceName = invoiceName;

  String? _modifyInvoiceData;
  String? get modifyInvoiceData => _$this._modifyInvoiceData;
  set modifyInvoiceData(String? modifyInvoiceData) =>
      _$this._modifyInvoiceData = modifyInvoiceData;

  String? _documentType;
  String? get documentType => _$this._documentType;
  set documentType(String? documentType) => _$this._documentType = documentType;

  String? _complement;
  String? get complement => _$this._complement;
  set complement(String? complement) => _$this._complement = complement;

  InvoiceDetailRequestBuilder();

  InvoiceDetailRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idGenerateInvoice = $v.idGenerateInvoice;
      _nitCiFact = $v.nitCiFact;
      _invoiceName = $v.invoiceName;
      _modifyInvoiceData = $v.modifyInvoiceData;
      _documentType = $v.documentType;
      _complement = $v.complement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvoiceDetailRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvoiceDetailRequest;
  }

  @override
  void update(void Function(InvoiceDetailRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvoiceDetailRequest build() => _build();

  _$InvoiceDetailRequest _build() {
    final _$result = _$v ??
        new _$InvoiceDetailRequest._(
            idGenerateInvoice: idGenerateInvoice,
            nitCiFact: nitCiFact,
            invoiceName: invoiceName,
            modifyInvoiceData: modifyInvoiceData,
            documentType: documentType,
            complement: complement);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
