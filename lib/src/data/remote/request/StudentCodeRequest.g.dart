// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentCodeRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StudentCodeRequest> _$studentCodeRequestSerializer =
    new _$StudentCodeRequestSerializer();

class _$StudentCodeRequestSerializer
    implements StructuredSerializer<StudentCodeRequest> {
  @override
  final Iterable<Type> types = const [StudentCodeRequest, _$StudentCodeRequest];
  @override
  final String wireName = 'StudentCodeRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, StudentCodeRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'studentErpCode',
      serializers.serialize(object.studentErpCode,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  StudentCodeRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentCodeRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'studentErpCode':
          result.studentErpCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StudentCodeRequest extends StudentCodeRequest {
  @override
  final String studentErpCode;

  factory _$StudentCodeRequest(
          [void Function(StudentCodeRequestBuilder)? updates]) =>
      (new StudentCodeRequestBuilder()..update(updates))._build();

  _$StudentCodeRequest._({required this.studentErpCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        studentErpCode, r'StudentCodeRequest', 'studentErpCode');
  }

  @override
  StudentCodeRequest rebuild(
          void Function(StudentCodeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentCodeRequestBuilder toBuilder() =>
      new StudentCodeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentCodeRequest &&
        studentErpCode == other.studentErpCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, studentErpCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudentCodeRequest')
          ..add('studentErpCode', studentErpCode))
        .toString();
  }
}

class StudentCodeRequestBuilder
    implements Builder<StudentCodeRequest, StudentCodeRequestBuilder> {
  _$StudentCodeRequest? _$v;

  String? _studentErpCode;
  String? get studentErpCode => _$this._studentErpCode;
  set studentErpCode(String? studentErpCode) =>
      _$this._studentErpCode = studentErpCode;

  StudentCodeRequestBuilder();

  StudentCodeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _studentErpCode = $v.studentErpCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentCodeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentCodeRequest;
  }

  @override
  void update(void Function(StudentCodeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudentCodeRequest build() => _build();

  _$StudentCodeRequest _build() {
    final _$result = _$v ??
        new _$StudentCodeRequest._(
            studentErpCode: BuiltValueNullFieldError.checkNotNull(
                studentErpCode, r'StudentCodeRequest', 'studentErpCode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
