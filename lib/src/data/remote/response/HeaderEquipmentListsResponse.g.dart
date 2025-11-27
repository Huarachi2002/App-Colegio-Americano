// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HeaderEquipmentListsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HeaderEquipmentListsResponse>
    _$headerEquipmentListsResponseSerializer =
    new _$HeaderEquipmentListsResponseSerializer();

class _$HeaderEquipmentListsResponseSerializer
    implements StructuredSerializer<HeaderEquipmentListsResponse> {
  @override
  final Iterable<Type> types = const [
    HeaderEquipmentListsResponse,
    _$HeaderEquipmentListsResponse
  ];
  @override
  final String wireName = 'HeaderEquipmentListsResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HeaderEquipmentListsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'academic_management_id',
      serializers.serialize(object.academicManagementId,
          specifiedType: const FullType(int)),
      'grade_id',
      serializers.serialize(object.gradeId, specifiedType: const FullType(int)),
      'created_by',
      serializers.serialize(object.createdBy,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HeaderEquipmentListsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HeaderEquipmentListsResponseBuilder();

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
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'academic_management_id':
          result.academicManagementId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'grade_id':
          result.gradeId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HeaderEquipmentListsResponse extends HeaderEquipmentListsResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final String state;
  @override
  final int academicManagementId;
  @override
  final int gradeId;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$HeaderEquipmentListsResponse(
          [void Function(HeaderEquipmentListsResponseBuilder)? updates]) =>
      (new HeaderEquipmentListsResponseBuilder()..update(updates))._build();

  _$HeaderEquipmentListsResponse._(
      {required this.id,
      required this.name,
      required this.state,
      required this.academicManagementId,
      required this.gradeId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'HeaderEquipmentListsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'HeaderEquipmentListsResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        state, r'HeaderEquipmentListsResponse', 'state');
    BuiltValueNullFieldError.checkNotNull(academicManagementId,
        r'HeaderEquipmentListsResponse', 'academicManagementId');
    BuiltValueNullFieldError.checkNotNull(
        gradeId, r'HeaderEquipmentListsResponse', 'gradeId');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'HeaderEquipmentListsResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'HeaderEquipmentListsResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'HeaderEquipmentListsResponse', 'updatedAt');
  }

  @override
  HeaderEquipmentListsResponse rebuild(
          void Function(HeaderEquipmentListsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HeaderEquipmentListsResponseBuilder toBuilder() =>
      new HeaderEquipmentListsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HeaderEquipmentListsResponse &&
        id == other.id &&
        name == other.name &&
        state == other.state &&
        academicManagementId == other.academicManagementId &&
        gradeId == other.gradeId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, academicManagementId.hashCode);
    _$hash = $jc(_$hash, gradeId.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HeaderEquipmentListsResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('state', state)
          ..add('academicManagementId', academicManagementId)
          ..add('gradeId', gradeId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class HeaderEquipmentListsResponseBuilder
    implements
        Builder<HeaderEquipmentListsResponse,
            HeaderEquipmentListsResponseBuilder> {
  _$HeaderEquipmentListsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  int? _academicManagementId;
  int? get academicManagementId => _$this._academicManagementId;
  set academicManagementId(int? academicManagementId) =>
      _$this._academicManagementId = academicManagementId;

  int? _gradeId;
  int? get gradeId => _$this._gradeId;
  set gradeId(int? gradeId) => _$this._gradeId = gradeId;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  HeaderEquipmentListsResponseBuilder();

  HeaderEquipmentListsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _state = $v.state;
      _academicManagementId = $v.academicManagementId;
      _gradeId = $v.gradeId;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HeaderEquipmentListsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HeaderEquipmentListsResponse;
  }

  @override
  void update(void Function(HeaderEquipmentListsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HeaderEquipmentListsResponse build() => _build();

  _$HeaderEquipmentListsResponse _build() {
    final _$result = _$v ??
        new _$HeaderEquipmentListsResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'HeaderEquipmentListsResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'HeaderEquipmentListsResponse', 'name'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, r'HeaderEquipmentListsResponse', 'state'),
            academicManagementId: BuiltValueNullFieldError.checkNotNull(
                academicManagementId, r'HeaderEquipmentListsResponse', 'academicManagementId'),
            gradeId: BuiltValueNullFieldError.checkNotNull(
                gradeId, r'HeaderEquipmentListsResponse', 'gradeId'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'HeaderEquipmentListsResponse', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'HeaderEquipmentListsResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'HeaderEquipmentListsResponse', 'updatedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
