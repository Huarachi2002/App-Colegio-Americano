// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentRequestResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentRequestResponse> _$equipmentRequestResponseSerializer =
    new _$EquipmentRequestResponseSerializer();

class _$EquipmentRequestResponseSerializer
    implements StructuredSerializer<EquipmentRequestResponse> {
  @override
  final Iterable<Type> types = const [
    EquipmentRequestResponse,
    _$EquipmentRequestResponse
  ];
  @override
  final String wireName = 'EquipmentRequestResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentRequestResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'header',
      serializers.serialize(object.header,
          specifiedType: const FullType(EquipmentRequestHeaderResponse)),
      'details',
      serializers.serialize(object.details,
          specifiedType: const FullType(BuiltList,
              const [const FullType(EquipmentRequestDetailResponse)])),
    ];

    return result;
  }

  @override
  EquipmentRequestResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentRequestResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'header':
          result.header.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(EquipmentRequestHeaderResponse))!
              as EquipmentRequestHeaderResponse);
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(EquipmentRequestDetailResponse)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EquipmentRequestResponse extends EquipmentRequestResponse {
  @override
  final EquipmentRequestHeaderResponse header;
  @override
  final BuiltList<EquipmentRequestDetailResponse> details;

  factory _$EquipmentRequestResponse(
          [void Function(EquipmentRequestResponseBuilder)? updates]) =>
      (new EquipmentRequestResponseBuilder()..update(updates))._build();

  _$EquipmentRequestResponse._({required this.header, required this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        header, r'EquipmentRequestResponse', 'header');
    BuiltValueNullFieldError.checkNotNull(
        details, r'EquipmentRequestResponse', 'details');
  }

  @override
  EquipmentRequestResponse rebuild(
          void Function(EquipmentRequestResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentRequestResponseBuilder toBuilder() =>
      new EquipmentRequestResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentRequestResponse &&
        header == other.header &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, header.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipmentRequestResponse')
          ..add('header', header)
          ..add('details', details))
        .toString();
  }
}

class EquipmentRequestResponseBuilder
    implements
        Builder<EquipmentRequestResponse, EquipmentRequestResponseBuilder> {
  _$EquipmentRequestResponse? _$v;

  EquipmentRequestHeaderResponseBuilder? _header;
  EquipmentRequestHeaderResponseBuilder get header =>
      _$this._header ??= new EquipmentRequestHeaderResponseBuilder();
  set header(EquipmentRequestHeaderResponseBuilder? header) =>
      _$this._header = header;

  ListBuilder<EquipmentRequestDetailResponse>? _details;
  ListBuilder<EquipmentRequestDetailResponse> get details =>
      _$this._details ??= new ListBuilder<EquipmentRequestDetailResponse>();
  set details(ListBuilder<EquipmentRequestDetailResponse>? details) =>
      _$this._details = details;

  EquipmentRequestResponseBuilder();

  EquipmentRequestResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _header = $v.header.toBuilder();
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentRequestResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentRequestResponse;
  }

  @override
  void update(void Function(EquipmentRequestResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentRequestResponse build() => _build();

  _$EquipmentRequestResponse _build() {
    _$EquipmentRequestResponse _$result;
    try {
      _$result = _$v ??
          new _$EquipmentRequestResponse._(
              header: header.build(), details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'header';
        header.build();
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EquipmentRequestResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
