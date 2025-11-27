// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsResponse.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsResponse> _$newsResponseSerializer =
    new _$NewsResponseSerializer();

class _$NewsResponseSerializer implements StructuredSerializer<NewsResponse> {
  @override
  final Iterable<Type> types = const [NewsResponse, _$NewsResponse];
  @override
  final String wireName = 'NewsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'title_german',
      serializers.serialize(object.titleGerman,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'description_german',
      serializers.serialize(object.descriptionGerman,
          specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'notifiable',
      serializers.serialize(object.notifiable,
          specifiedType: const FullType(bool)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'news_type_id',
      serializers.serialize(object.newsTypeId,
          specifiedType: const FullType(int)),
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
    Object? value;
    value = object.erpCode;
    if (value != null) {
      result
        ..add('erp_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.erpCode2;
    if (value != null) {
      result
        ..add('erp_code2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PathResponse)])));
    }
    return result;
  }

  @override
  NewsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsResponseBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title_german':
          result.titleGerman = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description_german':
          result.descriptionGerman = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'erp_code':
          result.erpCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'erp_code2':
          result.erpCode2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'notifiable':
          result.notifiable = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'news_type_id':
          result.newsTypeId = serializers.deserialize(value,
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
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PathResponse)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsResponse extends NewsResponse {
  @override
  final int id;
  @override
  final String title;
  @override
  final String titleGerman;
  @override
  final String description;
  @override
  final String descriptionGerman;
  @override
  final String? erpCode;
  @override
  final String? erpCode2;
  @override
  final String path;
  @override
  final bool notifiable;
  @override
  final String state;
  @override
  final int newsTypeId;
  @override
  final int createdBy;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final BuiltList<PathResponse>? images;

  factory _$NewsResponse([void Function(NewsResponseBuilder)? updates]) =>
      (new NewsResponseBuilder()..update(updates))._build();

  _$NewsResponse._(
      {required this.id,
      required this.title,
      required this.titleGerman,
      required this.description,
      required this.descriptionGerman,
      this.erpCode,
      this.erpCode2,
      required this.path,
      required this.notifiable,
      required this.state,
      required this.newsTypeId,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NewsResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'NewsResponse', 'title');
    BuiltValueNullFieldError.checkNotNull(
        titleGerman, r'NewsResponse', 'titleGerman');
    BuiltValueNullFieldError.checkNotNull(
        description, r'NewsResponse', 'description');
    BuiltValueNullFieldError.checkNotNull(
        descriptionGerman, r'NewsResponse', 'descriptionGerman');
    BuiltValueNullFieldError.checkNotNull(path, r'NewsResponse', 'path');
    BuiltValueNullFieldError.checkNotNull(
        notifiable, r'NewsResponse', 'notifiable');
    BuiltValueNullFieldError.checkNotNull(state, r'NewsResponse', 'state');
    BuiltValueNullFieldError.checkNotNull(
        newsTypeId, r'NewsResponse', 'newsTypeId');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'NewsResponse', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'NewsResponse', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'NewsResponse', 'updatedAt');
  }

  @override
  NewsResponse rebuild(void Function(NewsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsResponseBuilder toBuilder() => new NewsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsResponse &&
        id == other.id &&
        title == other.title &&
        titleGerman == other.titleGerman &&
        description == other.description &&
        descriptionGerman == other.descriptionGerman &&
        erpCode == other.erpCode &&
        erpCode2 == other.erpCode2 &&
        path == other.path &&
        notifiable == other.notifiable &&
        state == other.state &&
        newsTypeId == other.newsTypeId &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, titleGerman.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, descriptionGerman.hashCode);
    _$hash = $jc(_$hash, erpCode.hashCode);
    _$hash = $jc(_$hash, erpCode2.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, notifiable.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, newsTypeId.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsResponse')
          ..add('id', id)
          ..add('title', title)
          ..add('titleGerman', titleGerman)
          ..add('description', description)
          ..add('descriptionGerman', descriptionGerman)
          ..add('erpCode', erpCode)
          ..add('erpCode2', erpCode2)
          ..add('path', path)
          ..add('notifiable', notifiable)
          ..add('state', state)
          ..add('newsTypeId', newsTypeId)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('images', images))
        .toString();
  }
}

class NewsResponseBuilder
    implements Builder<NewsResponse, NewsResponseBuilder> {
  _$NewsResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _titleGerman;
  String? get titleGerman => _$this._titleGerman;
  set titleGerman(String? titleGerman) => _$this._titleGerman = titleGerman;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _descriptionGerman;
  String? get descriptionGerman => _$this._descriptionGerman;
  set descriptionGerman(String? descriptionGerman) =>
      _$this._descriptionGerman = descriptionGerman;

  String? _erpCode;
  String? get erpCode => _$this._erpCode;
  set erpCode(String? erpCode) => _$this._erpCode = erpCode;

  String? _erpCode2;
  String? get erpCode2 => _$this._erpCode2;
  set erpCode2(String? erpCode2) => _$this._erpCode2 = erpCode2;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  bool? _notifiable;
  bool? get notifiable => _$this._notifiable;
  set notifiable(bool? notifiable) => _$this._notifiable = notifiable;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  int? _newsTypeId;
  int? get newsTypeId => _$this._newsTypeId;
  set newsTypeId(int? newsTypeId) => _$this._newsTypeId = newsTypeId;

  int? _createdBy;
  int? get createdBy => _$this._createdBy;
  set createdBy(int? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<PathResponse>? _images;
  ListBuilder<PathResponse> get images =>
      _$this._images ??= new ListBuilder<PathResponse>();
  set images(ListBuilder<PathResponse>? images) => _$this._images = images;

  NewsResponseBuilder();

  NewsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _titleGerman = $v.titleGerman;
      _description = $v.description;
      _descriptionGerman = $v.descriptionGerman;
      _erpCode = $v.erpCode;
      _erpCode2 = $v.erpCode2;
      _path = $v.path;
      _notifiable = $v.notifiable;
      _state = $v.state;
      _newsTypeId = $v.newsTypeId;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _images = $v.images?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsResponse;
  }

  @override
  void update(void Function(NewsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsResponse build() => _build();

  _$NewsResponse _build() {
    _$NewsResponse _$result;
    try {
      _$result = _$v ??
          new _$NewsResponse._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'NewsResponse', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'NewsResponse', 'title'),
              titleGerman: BuiltValueNullFieldError.checkNotNull(
                  titleGerman, r'NewsResponse', 'titleGerman'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'NewsResponse', 'description'),
              descriptionGerman: BuiltValueNullFieldError.checkNotNull(
                  descriptionGerman, r'NewsResponse', 'descriptionGerman'),
              erpCode: erpCode,
              erpCode2: erpCode2,
              path: BuiltValueNullFieldError.checkNotNull(
                  path, r'NewsResponse', 'path'),
              notifiable: BuiltValueNullFieldError.checkNotNull(
                  notifiable, r'NewsResponse', 'notifiable'),
              state: BuiltValueNullFieldError.checkNotNull(
                  state, r'NewsResponse', 'state'),
              newsTypeId: BuiltValueNullFieldError.checkNotNull(
                  newsTypeId, r'NewsResponse', 'newsTypeId'),
              createdBy: BuiltValueNullFieldError.checkNotNull(createdBy, r'NewsResponse', 'createdBy'),
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt, r'NewsResponse', 'createdAt'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'NewsResponse', 'updatedAt'),
              images: _images?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NewsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
