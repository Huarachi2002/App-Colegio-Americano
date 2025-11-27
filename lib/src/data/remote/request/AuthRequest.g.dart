// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthRequest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthRequest> _$authRequestSerializer = new _$AuthRequestSerializer();

class _$AuthRequestSerializer implements StructuredSerializer<AuthRequest> {
  @override
  final Iterable<Type> types = const [AuthRequest, _$AuthRequest];
  @override
  final String wireName = 'AuthRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.codeParent;
    if (value != null) {
      result
        ..add('codeParent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthRequest deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'codeParent':
          result.codeParent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthRequest extends AuthRequest {
  @override
  final String? username;
  @override
  final String? password;
  @override
  final String? codeParent;

  factory _$AuthRequest([void Function(AuthRequestBuilder)? updates]) =>
      (new AuthRequestBuilder()..update(updates))._build();

  _$AuthRequest._({this.username, this.password, this.codeParent}) : super._();

  @override
  AuthRequest rebuild(void Function(AuthRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthRequestBuilder toBuilder() => new AuthRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthRequest &&
        username == other.username &&
        password == other.password &&
        codeParent == other.codeParent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, codeParent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthRequest')
          ..add('username', username)
          ..add('password', password)
          ..add('codeParent', codeParent))
        .toString();
  }
}

class AuthRequestBuilder implements Builder<AuthRequest, AuthRequestBuilder> {
  _$AuthRequest? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _codeParent;
  String? get codeParent => _$this._codeParent;
  set codeParent(String? codeParent) => _$this._codeParent = codeParent;

  AuthRequestBuilder();

  AuthRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _codeParent = $v.codeParent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthRequest;
  }

  @override
  void update(void Function(AuthRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthRequest build() => _build();

  _$AuthRequest _build() {
    final _$result = _$v ??
        new _$AuthRequest._(
            username: username, password: password, codeParent: codeParent);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
