// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StudentRequest> _$studentRequestSerializer =
    new _$StudentRequestSerializer();

class _$StudentRequestSerializer
    implements StructuredSerializer<StudentRequest> {
  @override
  final Iterable<Type> types = const [StudentRequest, _$StudentRequest];
  @override
  final String wireName = 'StudentRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudentRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'student_id',
      serializers.serialize(object.studentId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  StudentRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'student_id':
          result.studentId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StudentRequest extends StudentRequest {
  @override
  final String studentId;

  factory _$StudentRequest([void Function(StudentRequestBuilder)? updates]) =>
      (new StudentRequestBuilder()..update(updates))._build();

  _$StudentRequest._({required this.studentId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        studentId, r'StudentRequest', 'studentId');
  }

  @override
  StudentRequest rebuild(void Function(StudentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentRequestBuilder toBuilder() =>
      new StudentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentRequest && studentId == other.studentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, studentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudentRequest')
          ..add('studentId', studentId))
        .toString();
  }
}

class StudentRequestBuilder
    implements Builder<StudentRequest, StudentRequestBuilder> {
  _$StudentRequest? _$v;

  String? _studentId;
  String? get studentId => _$this._studentId;
  set studentId(String? studentId) => _$this._studentId = studentId;

  StudentRequestBuilder();

  StudentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _studentId = $v.studentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentRequest;
  }

  @override
  void update(void Function(StudentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudentRequest build() => _build();

  _$StudentRequest _build() {
    final _$result = _$v ??
        new _$StudentRequest._(
            studentId: BuiltValueNullFieldError.checkNotNull(
                studentId, r'StudentRequest', 'studentId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
