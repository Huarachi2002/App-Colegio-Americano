// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttachmentResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AttachmentResponse> _$attachmentResponseSerializer =
    new _$AttachmentResponseSerializer();

class _$AttachmentResponseSerializer
    implements StructuredSerializer<AttachmentResponse> {
  @override
  final Iterable<Type> types = const [AttachmentResponse, _$AttachmentResponse];
  @override
  final String wireName = 'AttachmentResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AttachmentResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'fileName',
      serializers.serialize(object.fileName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AttachmentResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AttachmentResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'fileName':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AttachmentResponse extends AttachmentResponse {
  @override
  final int id;
  @override
  final String fileName;

  factory _$AttachmentResponse(
          [void Function(AttachmentResponseBuilder)? updates]) =>
      (new AttachmentResponseBuilder()..update(updates))._build();

  _$AttachmentResponse._({required this.id, required this.fileName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AttachmentResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        fileName, r'AttachmentResponse', 'fileName');
  }

  @override
  AttachmentResponse rebuild(
          void Function(AttachmentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttachmentResponseBuilder toBuilder() =>
      new AttachmentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttachmentResponse &&
        id == other.id &&
        fileName == other.fileName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttachmentResponse')
          ..add('id', id)
          ..add('fileName', fileName))
        .toString();
  }
}

class AttachmentResponseBuilder
    implements Builder<AttachmentResponse, AttachmentResponseBuilder> {
  _$AttachmentResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  AttachmentResponseBuilder();

  AttachmentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fileName = $v.fileName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttachmentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AttachmentResponse;
  }

  @override
  void update(void Function(AttachmentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttachmentResponse build() => _build();

  _$AttachmentResponse _build() {
    final _$result = _$v ??
        new _$AttachmentResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AttachmentResponse', 'id'),
            fileName: BuiltValueNullFieldError.checkNotNull(
                fileName, r'AttachmentResponse', 'fileName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
