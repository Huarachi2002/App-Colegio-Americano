// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const [LoginResponse, _$LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'entity_type',
      serializers.serialize(object.entityType,
          specifiedType: const FullType(String)),
      'entity_id',
      serializers.serialize(object.entityId,
          specifiedType: const FullType(int)),
      'api_token',
      serializers.serialize(object.apiToken,
          specifiedType: const FullType(String)),
      'user_type',
      serializers.serialize(object.userType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'entity_type':
          result.entityType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'entity_id':
          result.entityId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'api_token':
          result.apiToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponse extends LoginResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final String entityType;
  @override
  final int entityId;
  @override
  final String apiToken;
  @override
  final String userType;

  factory _$LoginResponse([void Function(LoginResponseBuilder)? updates]) =>
      (new LoginResponseBuilder()..update(updates))._build();

  _$LoginResponse._(
      {required this.id,
      required this.name,
      required this.entityType,
      required this.entityId,
      required this.apiToken,
      required this.userType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'LoginResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'LoginResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        entityType, r'LoginResponse', 'entityType');
    BuiltValueNullFieldError.checkNotNull(
        entityId, r'LoginResponse', 'entityId');
    BuiltValueNullFieldError.checkNotNull(
        apiToken, r'LoginResponse', 'apiToken');
    BuiltValueNullFieldError.checkNotNull(
        userType, r'LoginResponse', 'userType');
  }

  @override
  LoginResponse rebuild(void Function(LoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse &&
        id == other.id &&
        name == other.name &&
        entityType == other.entityType &&
        entityId == other.entityId &&
        apiToken == other.apiToken &&
        userType == other.userType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, entityType.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, apiToken.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('entityType', entityType)
          ..add('entityId', entityId)
          ..add('apiToken', apiToken)
          ..add('userType', userType))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _entityType;
  String? get entityType => _$this._entityType;
  set entityType(String? entityType) => _$this._entityType = entityType;

  int? _entityId;
  int? get entityId => _$this._entityId;
  set entityId(int? entityId) => _$this._entityId = entityId;

  String? _apiToken;
  String? get apiToken => _$this._apiToken;
  set apiToken(String? apiToken) => _$this._apiToken = apiToken;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  LoginResponseBuilder();

  LoginResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _entityType = $v.entityType;
      _entityId = $v.entityId;
      _apiToken = $v.apiToken;
      _userType = $v.userType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void Function(LoginResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginResponse build() => _build();

  _$LoginResponse _build() {
    final _$result = _$v ??
        new _$LoginResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'LoginResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'LoginResponse', 'name'),
            entityType: BuiltValueNullFieldError.checkNotNull(
                entityType, r'LoginResponse', 'entityType'),
            entityId: BuiltValueNullFieldError.checkNotNull(
                entityId, r'LoginResponse', 'entityId'),
            apiToken: BuiltValueNullFieldError.checkNotNull(
                apiToken, r'LoginResponse', 'apiToken'),
            userType: BuiltValueNullFieldError.checkNotNull(
                userType, r'LoginResponse', 'userType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
