// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnnotationResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnnotationResponse> _$annotationResponseSerializer =
    new _$AnnotationResponseSerializer();

class _$AnnotationResponseSerializer
    implements StructuredSerializer<AnnotationResponse> {
  @override
  final Iterable<Type> types = const [AnnotationResponse, _$AnnotationResponse];
  @override
  final String wireName = 'AnnotationResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AnnotationResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'annotations',
      serializers.serialize(object.annotations,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AnnotationsResponse)])),
      'absences',
      serializers.serialize(object.absences,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AbsencesResponse)])),
    ];

    return result;
  }

  @override
  AnnotationResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnotationResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'annotations':
          result.annotations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnnotationsResponse)]))!
              as BuiltList<Object?>);
          break;
        case 'absences':
          result.absences.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AbsencesResponse)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AnnotationResponse extends AnnotationResponse {
  @override
  final BuiltList<AnnotationsResponse> annotations;
  @override
  final BuiltList<AbsencesResponse> absences;

  factory _$AnnotationResponse(
          [void Function(AnnotationResponseBuilder)? updates]) =>
      (new AnnotationResponseBuilder()..update(updates))._build();

  _$AnnotationResponse._({required this.annotations, required this.absences})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        annotations, r'AnnotationResponse', 'annotations');
    BuiltValueNullFieldError.checkNotNull(
        absences, r'AnnotationResponse', 'absences');
  }

  @override
  AnnotationResponse rebuild(
          void Function(AnnotationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnotationResponseBuilder toBuilder() =>
      new AnnotationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnotationResponse &&
        annotations == other.annotations &&
        absences == other.absences;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, annotations.hashCode);
    _$hash = $jc(_$hash, absences.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnotationResponse')
          ..add('annotations', annotations)
          ..add('absences', absences))
        .toString();
  }
}

class AnnotationResponseBuilder
    implements Builder<AnnotationResponse, AnnotationResponseBuilder> {
  _$AnnotationResponse? _$v;

  ListBuilder<AnnotationsResponse>? _annotations;
  ListBuilder<AnnotationsResponse> get annotations =>
      _$this._annotations ??= new ListBuilder<AnnotationsResponse>();
  set annotations(ListBuilder<AnnotationsResponse>? annotations) =>
      _$this._annotations = annotations;

  ListBuilder<AbsencesResponse>? _absences;
  ListBuilder<AbsencesResponse> get absences =>
      _$this._absences ??= new ListBuilder<AbsencesResponse>();
  set absences(ListBuilder<AbsencesResponse>? absences) =>
      _$this._absences = absences;

  AnnotationResponseBuilder();

  AnnotationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _annotations = $v.annotations.toBuilder();
      _absences = $v.absences.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnotationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnotationResponse;
  }

  @override
  void update(void Function(AnnotationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnotationResponse build() => _build();

  _$AnnotationResponse _build() {
    _$AnnotationResponse _$result;
    try {
      _$result = _$v ??
          new _$AnnotationResponse._(
              annotations: annotations.build(), absences: absences.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'annotations';
        annotations.build();
        _$failedField = 'absences';
        absences.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AnnotationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
