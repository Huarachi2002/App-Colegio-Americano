// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EquipmentListsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EquipmentListsResponse> _$equipmentListsResponseSerializer =
    new _$EquipmentListsResponseSerializer();

class _$EquipmentListsResponseSerializer
    implements StructuredSerializer<EquipmentListsResponse> {
  @override
  final Iterable<Type> types = const [
    EquipmentListsResponse,
    _$EquipmentListsResponse
  ];
  @override
  final String wireName = 'EquipmentListsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EquipmentListsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'header',
      serializers.serialize(object.header,
          specifiedType: const FullType(HeaderEquipmentListsResponse)),
      'details',
      serializers.serialize(object.details,
          specifiedType: const FullType(BuiltList,
              const [const FullType(DetailsEquipmentListsResponse)])),
    ];

    return result;
  }

  @override
  EquipmentListsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EquipmentListsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'header':
          result.header.replace(serializers.deserialize(value,
                  specifiedType: const FullType(HeaderEquipmentListsResponse))!
              as HeaderEquipmentListsResponse);
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(DetailsEquipmentListsResponse)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EquipmentListsResponse extends EquipmentListsResponse {
  @override
  final HeaderEquipmentListsResponse header;
  @override
  final BuiltList<DetailsEquipmentListsResponse> details;

  factory _$EquipmentListsResponse(
          [void Function(EquipmentListsResponseBuilder)? updates]) =>
      (new EquipmentListsResponseBuilder()..update(updates))._build();

  _$EquipmentListsResponse._({required this.header, required this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        header, r'EquipmentListsResponse', 'header');
    BuiltValueNullFieldError.checkNotNull(
        details, r'EquipmentListsResponse', 'details');
  }

  @override
  EquipmentListsResponse rebuild(
          void Function(EquipmentListsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipmentListsResponseBuilder toBuilder() =>
      new EquipmentListsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipmentListsResponse &&
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
    return (newBuiltValueToStringHelper(r'EquipmentListsResponse')
          ..add('header', header)
          ..add('details', details))
        .toString();
  }
}

class EquipmentListsResponseBuilder
    implements Builder<EquipmentListsResponse, EquipmentListsResponseBuilder> {
  _$EquipmentListsResponse? _$v;

  HeaderEquipmentListsResponseBuilder? _header;
  HeaderEquipmentListsResponseBuilder get header =>
      _$this._header ??= new HeaderEquipmentListsResponseBuilder();
  set header(HeaderEquipmentListsResponseBuilder? header) =>
      _$this._header = header;

  ListBuilder<DetailsEquipmentListsResponse>? _details;
  ListBuilder<DetailsEquipmentListsResponse> get details =>
      _$this._details ??= new ListBuilder<DetailsEquipmentListsResponse>();
  set details(ListBuilder<DetailsEquipmentListsResponse>? details) =>
      _$this._details = details;

  EquipmentListsResponseBuilder();

  EquipmentListsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _header = $v.header.toBuilder();
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipmentListsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipmentListsResponse;
  }

  @override
  void update(void Function(EquipmentListsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipmentListsResponse build() => _build();

  _$EquipmentListsResponse _build() {
    _$EquipmentListsResponse _$result;
    try {
      _$result = _$v ??
          new _$EquipmentListsResponse._(
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
            r'EquipmentListsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
