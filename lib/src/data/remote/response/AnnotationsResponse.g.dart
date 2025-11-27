// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnnotationsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnnotationsResponse> _$annotationsResponseSerializer =
    new _$AnnotationsResponseSerializer();

class _$AnnotationsResponseSerializer
    implements StructuredSerializer<AnnotationsResponse> {
  @override
  final Iterable<Type> types = const [
    AnnotationsResponse,
    _$AnnotationsResponse
  ];
  @override
  final String wireName = 'AnnotationsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AnnotationsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'subject',
      serializers.serialize(object.subject,
          specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AnnotationsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnotationsResponseBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AnnotationsResponse extends AnnotationsResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final String type;
  @override
  final String subject;
  @override
  final String text;
  @override
  final String createdAt;

  factory _$AnnotationsResponse(
          [void Function(AnnotationsResponseBuilder)? updates]) =>
      (new AnnotationsResponseBuilder()..update(updates))._build();

  _$AnnotationsResponse._(
      {required this.id,
      required this.date,
      required this.type,
      required this.subject,
      required this.text,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AnnotationsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(date, r'AnnotationsResponse', 'date');
    BuiltValueNullFieldError.checkNotNull(type, r'AnnotationsResponse', 'type');
    BuiltValueNullFieldError.checkNotNull(
        subject, r'AnnotationsResponse', 'subject');
    BuiltValueNullFieldError.checkNotNull(text, r'AnnotationsResponse', 'text');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'AnnotationsResponse', 'createdAt');
  }

  @override
  AnnotationsResponse rebuild(
          void Function(AnnotationsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnotationsResponseBuilder toBuilder() =>
      new AnnotationsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnotationsResponse &&
        id == other.id &&
        date == other.date &&
        type == other.type &&
        subject == other.subject &&
        text == other.text &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnotationsResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('type', type)
          ..add('subject', subject)
          ..add('text', text)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class AnnotationsResponseBuilder
    implements Builder<AnnotationsResponse, AnnotationsResponseBuilder> {
  _$AnnotationsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  AnnotationsResponseBuilder();

  AnnotationsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _type = $v.type;
      _subject = $v.subject;
      _text = $v.text;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnotationsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnotationsResponse;
  }

  @override
  void update(void Function(AnnotationsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnotationsResponse build() => _build();

  _$AnnotationsResponse _build() {
    final _$result = _$v ??
        new _$AnnotationsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AnnotationsResponse', 'id'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'AnnotationsResponse', 'date'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'AnnotationsResponse', 'type'),
            subject: BuiltValueNullFieldError.checkNotNull(
                subject, r'AnnotationsResponse', 'subject'),
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'AnnotationsResponse', 'text'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AnnotationsResponse', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
