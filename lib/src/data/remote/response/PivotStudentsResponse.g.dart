// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PivotStudentsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PivotStudentsResponse> _$pivotStudentsResponseSerializer =
    new _$PivotStudentsResponseSerializer();

class _$PivotStudentsResponseSerializer
    implements StructuredSerializer<PivotStudentsResponse> {
  @override
  final Iterable<Type> types = const [
    PivotStudentsResponse,
    _$PivotStudentsResponse
  ];
  @override
  final String wireName = 'PivotStudentsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PivotStudentsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'father_id',
      serializers.serialize(object.fatherId,
          specifiedType: const FullType(int)),
      'student_id',
      serializers.serialize(object.studentId,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PivotStudentsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PivotStudentsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'father_id':
          result.fatherId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'student_id':
          result.studentId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PivotStudentsResponse extends PivotStudentsResponse {
  @override
  final int fatherId;
  @override
  final int studentId;

  factory _$PivotStudentsResponse(
          [void Function(PivotStudentsResponseBuilder)? updates]) =>
      (new PivotStudentsResponseBuilder()..update(updates))._build();

  _$PivotStudentsResponse._({required this.fatherId, required this.studentId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fatherId, r'PivotStudentsResponse', 'fatherId');
    BuiltValueNullFieldError.checkNotNull(
        studentId, r'PivotStudentsResponse', 'studentId');
  }

  @override
  PivotStudentsResponse rebuild(
          void Function(PivotStudentsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PivotStudentsResponseBuilder toBuilder() =>
      new PivotStudentsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PivotStudentsResponse &&
        fatherId == other.fatherId &&
        studentId == other.studentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fatherId.hashCode);
    _$hash = $jc(_$hash, studentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PivotStudentsResponse')
          ..add('fatherId', fatherId)
          ..add('studentId', studentId))
        .toString();
  }
}

class PivotStudentsResponseBuilder
    implements Builder<PivotStudentsResponse, PivotStudentsResponseBuilder> {
  _$PivotStudentsResponse? _$v;

  int? _fatherId;
  int? get fatherId => _$this._fatherId;
  set fatherId(int? fatherId) => _$this._fatherId = fatherId;

  int? _studentId;
  int? get studentId => _$this._studentId;
  set studentId(int? studentId) => _$this._studentId = studentId;

  PivotStudentsResponseBuilder();

  PivotStudentsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fatherId = $v.fatherId;
      _studentId = $v.studentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PivotStudentsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PivotStudentsResponse;
  }

  @override
  void update(void Function(PivotStudentsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PivotStudentsResponse build() => _build();

  _$PivotStudentsResponse _build() {
    final _$result = _$v ??
        new _$PivotStudentsResponse._(
            fatherId: BuiltValueNullFieldError.checkNotNull(
                fatherId, r'PivotStudentsResponse', 'fatherId'),
            studentId: BuiltValueNullFieldError.checkNotNull(
                studentId, r'PivotStudentsResponse', 'studentId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
