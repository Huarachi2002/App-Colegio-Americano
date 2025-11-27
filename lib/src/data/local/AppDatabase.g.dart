// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// ignore_for_file: type=lint
class $TypesTable extends Types with TableInfo<$TypesTable, Type> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, createdBy, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'types';
  @override
  VerificationContext validateIntegrity(Insertable<Type> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Type map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Type(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $TypesTable createAlias(String alias) {
    return $TypesTable(attachedDatabase, alias);
  }
}

class Type extends DataClass implements Insertable<Type> {
  final int id;
  final String? name;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const Type(
      {required this.id,
      this.name,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  TypesCompanion toCompanion(bool nullToAbsent) {
    return TypesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Type.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Type(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  Type copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      Type(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Type(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdBy, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Type &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TypesCompanion extends UpdateCompanion<Type> {
  final Value<int> id;
  final Value<String?> name;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const TypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TypesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<Type> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TypesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return TypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NewsTable extends News with TableInfo<$NewsTable, New> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notifiableMeta =
      const VerificationMeta('notifiable');
  @override
  late final GeneratedColumn<bool> notifiable = GeneratedColumn<bool>(
      'notifiable', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("notifiable" IN (0, 1))'));
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _newsTypeIdMeta =
      const VerificationMeta('newsTypeId');
  @override
  late final GeneratedColumn<int> newsTypeId = GeneratedColumn<int>(
      'news_type_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        path,
        notifiable,
        state,
        newsTypeId,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news';
  @override
  VerificationContext validateIntegrity(Insertable<New> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    }
    if (data.containsKey('notifiable')) {
      context.handle(
          _notifiableMeta,
          notifiable.isAcceptableOrUnknown(
              data['notifiable']!, _notifiableMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('news_type_id')) {
      context.handle(
          _newsTypeIdMeta,
          newsTypeId.isAcceptableOrUnknown(
              data['news_type_id']!, _newsTypeIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  New map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return New(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path']),
      notifiable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}notifiable']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      newsTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}news_type_id']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $NewsTable createAlias(String alias) {
    return $NewsTable(attachedDatabase, alias);
  }
}

class New extends DataClass implements Insertable<New> {
  final int id;
  final String? title;
  final String? description;
  final String? path;
  final bool? notifiable;
  final String? state;
  final int? newsTypeId;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const New(
      {required this.id,
      this.title,
      this.description,
      this.path,
      this.notifiable,
      this.state,
      this.newsTypeId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    if (!nullToAbsent || notifiable != null) {
      map['notifiable'] = Variable<bool>(notifiable);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || newsTypeId != null) {
      map['news_type_id'] = Variable<int>(newsTypeId);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  NewsCompanion toCompanion(bool nullToAbsent) {
    return NewsCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      notifiable: notifiable == null && nullToAbsent
          ? const Value.absent()
          : Value(notifiable),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      newsTypeId: newsTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(newsTypeId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory New.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return New(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      path: serializer.fromJson<String?>(json['path']),
      notifiable: serializer.fromJson<bool?>(json['notifiable']),
      state: serializer.fromJson<String?>(json['state']),
      newsTypeId: serializer.fromJson<int?>(json['newsTypeId']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'path': serializer.toJson<String?>(path),
      'notifiable': serializer.toJson<bool?>(notifiable),
      'state': serializer.toJson<String?>(state),
      'newsTypeId': serializer.toJson<int?>(newsTypeId),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  New copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> path = const Value.absent(),
          Value<bool?> notifiable = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<int?> newsTypeId = const Value.absent(),
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      New(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        path: path.present ? path.value : this.path,
        notifiable: notifiable.present ? notifiable.value : this.notifiable,
        state: state.present ? state.value : this.state,
        newsTypeId: newsTypeId.present ? newsTypeId.value : this.newsTypeId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('New(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('path: $path, ')
          ..write('notifiable: $notifiable, ')
          ..write('state: $state, ')
          ..write('newsTypeId: $newsTypeId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, path, notifiable,
      state, newsTypeId, createdBy, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is New &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.path == this.path &&
          other.notifiable == this.notifiable &&
          other.state == this.state &&
          other.newsTypeId == this.newsTypeId &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NewsCompanion extends UpdateCompanion<New> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> path;
  final Value<bool?> notifiable;
  final Value<String?> state;
  final Value<int?> newsTypeId;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.path = const Value.absent(),
    this.notifiable = const Value.absent(),
    this.state = const Value.absent(),
    this.newsTypeId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.path = const Value.absent(),
    this.notifiable = const Value.absent(),
    this.state = const Value.absent(),
    this.newsTypeId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<New> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? path,
    Expression<bool>? notifiable,
    Expression<String>? state,
    Expression<int>? newsTypeId,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (path != null) 'path': path,
      if (notifiable != null) 'notifiable': notifiable,
      if (state != null) 'state': state,
      if (newsTypeId != null) 'news_type_id': newsTypeId,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NewsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? path,
      Value<bool?>? notifiable,
      Value<String?>? state,
      Value<int?>? newsTypeId,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return NewsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      path: path ?? this.path,
      notifiable: notifiable ?? this.notifiable,
      state: state ?? this.state,
      newsTypeId: newsTypeId ?? this.newsTypeId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (notifiable.present) {
      map['notifiable'] = Variable<bool>(notifiable.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (newsTypeId.present) {
      map['news_type_id'] = Variable<int>(newsTypeId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('path: $path, ')
          ..write('notifiable: $notifiable, ')
          ..write('state: $state, ')
          ..write('newsTypeId: $newsTypeId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NewsImagesTable extends NewsImages
    with TableInfo<$NewsImagesTable, NewImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _newIdMeta = const VerificationMeta('newId');
  @override
  late final GeneratedColumn<int> newId = GeneratedColumn<int>(
      'new_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, path, newId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_images';
  @override
  VerificationContext validateIntegrity(Insertable<NewImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    }
    if (data.containsKey('new_id')) {
      context.handle(
          _newIdMeta, newId.isAcceptableOrUnknown(data['new_id']!, _newIdMeta));
    } else if (isInserting) {
      context.missing(_newIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewImage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path']),
      newId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}new_id'])!,
    );
  }

  @override
  $NewsImagesTable createAlias(String alias) {
    return $NewsImagesTable(attachedDatabase, alias);
  }
}

class NewImage extends DataClass implements Insertable<NewImage> {
  final int id;
  final String? path;
  final int newId;
  const NewImage({required this.id, this.path, required this.newId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    map['new_id'] = Variable<int>(newId);
    return map;
  }

  NewsImagesCompanion toCompanion(bool nullToAbsent) {
    return NewsImagesCompanion(
      id: Value(id),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      newId: Value(newId),
    );
  }

  factory NewImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewImage(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String?>(json['path']),
      newId: serializer.fromJson<int>(json['newId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String?>(path),
      'newId': serializer.toJson<int>(newId),
    };
  }

  NewImage copyWith(
          {int? id, Value<String?> path = const Value.absent(), int? newId}) =>
      NewImage(
        id: id ?? this.id,
        path: path.present ? path.value : this.path,
        newId: newId ?? this.newId,
      );
  @override
  String toString() {
    return (StringBuffer('NewImage(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('newId: $newId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, newId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewImage &&
          other.id == this.id &&
          other.path == this.path &&
          other.newId == this.newId);
}

class NewsImagesCompanion extends UpdateCompanion<NewImage> {
  final Value<int> id;
  final Value<String?> path;
  final Value<int> newId;
  const NewsImagesCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.newId = const Value.absent(),
  });
  NewsImagesCompanion.insert({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    required int newId,
  }) : newId = Value(newId);
  static Insertable<NewImage> custom({
    Expression<int>? id,
    Expression<String>? path,
    Expression<int>? newId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (newId != null) 'new_id': newId,
    });
  }

  NewsImagesCompanion copyWith(
      {Value<int>? id, Value<String?>? path, Value<int>? newId}) {
    return NewsImagesCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      newId: newId ?? this.newId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (newId.present) {
      map['new_id'] = Variable<int>(newId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsImagesCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('newId: $newId')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
      'code', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, code, title, message, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(Insertable<Notification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}code']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final int id;
  final int? code;
  final String? title;
  final String? message;
  final String? url;
  const Notification(
      {required this.id, this.code, this.title, this.message, this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<int>(code);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<int?>(json['code']),
      title: serializer.fromJson<String?>(json['title']),
      message: serializer.fromJson<String?>(json['message']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<int?>(code),
      'title': serializer.toJson<String?>(title),
      'message': serializer.toJson<String?>(message),
      'url': serializer.toJson<String?>(url),
    };
  }

  Notification copyWith(
          {int? id,
          Value<int?> code = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> message = const Value.absent(),
          Value<String?> url = const Value.absent()}) =>
      Notification(
        id: id ?? this.id,
        code: code.present ? code.value : this.code,
        title: title.present ? title.value : this.title,
        message: message.present ? message.value : this.message,
        url: url.present ? url.value : this.url,
      );
  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, title, message, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.code == this.code &&
          other.title == this.title &&
          other.message == this.message &&
          other.url == this.url);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<int> id;
  final Value<int?> code;
  final Value<String?> title;
  final Value<String?> message;
  final Value<String?> url;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.url = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.url = const Value.absent(),
  });
  static Insertable<Notification> custom({
    Expression<int>? id,
    Expression<int>? code,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (url != null) 'url': url,
    });
  }

  NotificationsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? code,
      Value<String?>? title,
      Value<String?>? message,
      Value<String?>? url}) {
    return NotificationsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
      message: message ?? this.message,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
      'entity_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userTypeMeta =
      const VerificationMeta('userType');
  @override
  late final GeneratedColumn<String> userType = GeneratedColumn<String>(
      'user_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _apiTokenMeta =
      const VerificationMeta('apiToken');
  @override
  late final GeneratedColumn<String> apiToken = GeneratedColumn<String>(
      'api_token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, entityType, entityId, userType, apiToken];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    }
    if (data.containsKey('user_type')) {
      context.handle(_userTypeMeta,
          userType.isAcceptableOrUnknown(data['user_type']!, _userTypeMeta));
    }
    if (data.containsKey('api_token')) {
      context.handle(_apiTokenMeta,
          apiToken.isAcceptableOrUnknown(data['api_token']!, _apiTokenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type']),
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entity_id']),
      userType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_type']),
      apiToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_token']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String? name;
  final String? entityType;
  final int? entityId;
  final String? userType;
  final String? apiToken;
  const User(
      {required this.id,
      this.name,
      this.entityType,
      this.entityId,
      this.userType,
      this.apiToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || entityType != null) {
      map['entity_type'] = Variable<String>(entityType);
    }
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    if (!nullToAbsent || userType != null) {
      map['user_type'] = Variable<String>(userType);
    }
    if (!nullToAbsent || apiToken != null) {
      map['api_token'] = Variable<String>(apiToken);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      entityType: entityType == null && nullToAbsent
          ? const Value.absent()
          : Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      userType: userType == null && nullToAbsent
          ? const Value.absent()
          : Value(userType),
      apiToken: apiToken == null && nullToAbsent
          ? const Value.absent()
          : Value(apiToken),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      entityType: serializer.fromJson<String?>(json['entityType']),
      entityId: serializer.fromJson<int?>(json['entityId']),
      userType: serializer.fromJson<String?>(json['userType']),
      apiToken: serializer.fromJson<String?>(json['apiToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'entityType': serializer.toJson<String?>(entityType),
      'entityId': serializer.toJson<int?>(entityId),
      'userType': serializer.toJson<String?>(userType),
      'apiToken': serializer.toJson<String?>(apiToken),
    };
  }

  User copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> entityType = const Value.absent(),
          Value<int?> entityId = const Value.absent(),
          Value<String?> userType = const Value.absent(),
          Value<String?> apiToken = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        entityType: entityType.present ? entityType.value : this.entityType,
        entityId: entityId.present ? entityId.value : this.entityId,
        userType: userType.present ? userType.value : this.userType,
        apiToken: apiToken.present ? apiToken.value : this.apiToken,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('userType: $userType, ')
          ..write('apiToken: $apiToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, entityType, entityId, userType, apiToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.userType == this.userType &&
          other.apiToken == this.apiToken);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> entityType;
  final Value<int?> entityId;
  final Value<String?> userType;
  final Value<String?> apiToken;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.userType = const Value.absent(),
    this.apiToken = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.userType = const Value.absent(),
    this.apiToken = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? userType,
    Expression<String>? apiToken,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (userType != null) 'user_type': userType,
      if (apiToken != null) 'api_token': apiToken,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? entityType,
      Value<int?>? entityId,
      Value<String?>? userType,
      Value<String?>? apiToken}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      userType: userType ?? this.userType,
      apiToken: apiToken ?? this.apiToken,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (userType.present) {
      map['user_type'] = Variable<String>(userType.value);
    }
    if (apiToken.present) {
      map['api_token'] = Variable<String>(apiToken.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('userType: $userType, ')
          ..write('apiToken: $apiToken')
          ..write(')'))
        .toString();
  }
}

class $GradesTable extends Grades with TableInfo<$GradesTable, Grade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grades';
  @override
  VerificationContext validateIntegrity(Insertable<Grade> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Grade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Grade(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
    );
  }

  @override
  $GradesTable createAlias(String alias) {
    return $GradesTable(attachedDatabase, alias);
  }
}

class Grade extends DataClass implements Insertable<Grade> {
  final int id;
  final String? name;
  const Grade({required this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  GradesCompanion toCompanion(bool nullToAbsent) {
    return GradesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Grade.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Grade(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  Grade copyWith({int? id, Value<String?> name = const Value.absent()}) =>
      Grade(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Grade(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Grade && other.id == this.id && other.name == this.name);
}

class GradesCompanion extends UpdateCompanion<Grade> {
  final Value<int> id;
  final Value<String?> name;
  const GradesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GradesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<Grade> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GradesCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return GradesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ParallelsTable extends Parallels
    with TableInfo<$ParallelsTable, Parallel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParallelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parallels';
  @override
  VerificationContext validateIntegrity(Insertable<Parallel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Parallel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Parallel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
    );
  }

  @override
  $ParallelsTable createAlias(String alias) {
    return $ParallelsTable(attachedDatabase, alias);
  }
}

class Parallel extends DataClass implements Insertable<Parallel> {
  final int id;
  final String? name;
  const Parallel({required this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  ParallelsCompanion toCompanion(bool nullToAbsent) {
    return ParallelsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Parallel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Parallel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  Parallel copyWith({int? id, Value<String?> name = const Value.absent()}) =>
      Parallel(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Parallel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Parallel && other.id == this.id && other.name == this.name);
}

class ParallelsCompanion extends UpdateCompanion<Parallel> {
  final Value<int> id;
  final Value<String?> name;
  const ParallelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ParallelsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<Parallel> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ParallelsCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return ParallelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParallelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EquipmentsTable extends Equipments
    with TableInfo<$EquipmentsTable, Equipment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shortNameMeta =
      const VerificationMeta('shortName');
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
      'short_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, shortName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipments';
  @override
  VerificationContext validateIntegrity(Insertable<Equipment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('short_name')) {
      context.handle(_shortNameMeta,
          shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Equipment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Equipment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      shortName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_name']),
    );
  }

  @override
  $EquipmentsTable createAlias(String alias) {
    return $EquipmentsTable(attachedDatabase, alias);
  }
}

class Equipment extends DataClass implements Insertable<Equipment> {
  final int id;
  final String? name;
  final String? shortName;
  const Equipment({required this.id, this.name, this.shortName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || shortName != null) {
      map['short_name'] = Variable<String>(shortName);
    }
    return map;
  }

  EquipmentsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      shortName: shortName == null && nullToAbsent
          ? const Value.absent()
          : Value(shortName),
    );
  }

  factory Equipment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Equipment(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      shortName: serializer.fromJson<String?>(json['shortName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'shortName': serializer.toJson<String?>(shortName),
    };
  }

  Equipment copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> shortName = const Value.absent()}) =>
      Equipment(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        shortName: shortName.present ? shortName.value : this.shortName,
      );
  @override
  String toString() {
    return (StringBuffer('Equipment(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, shortName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Equipment &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortName == this.shortName);
}

class EquipmentsCompanion extends UpdateCompanion<Equipment> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> shortName;
  const EquipmentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
  });
  EquipmentsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
  });
  static Insertable<Equipment> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? shortName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortName != null) 'short_name': shortName,
    });
  }

  EquipmentsCompanion copyWith(
      {Value<int>? id, Value<String?>? name, Value<String?>? shortName}) {
    return EquipmentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }
}

class $PriceListsTable extends PriceLists
    with TableInfo<$PriceListsTable, PriceList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PriceListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'price_lists';
  @override
  VerificationContext validateIntegrity(Insertable<PriceList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PriceList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PriceList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
    );
  }

  @override
  $PriceListsTable createAlias(String alias) {
    return $PriceListsTable(attachedDatabase, alias);
  }
}

class PriceList extends DataClass implements Insertable<PriceList> {
  final int id;
  final String? name;
  const PriceList({required this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  PriceListsCompanion toCompanion(bool nullToAbsent) {
    return PriceListsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory PriceList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PriceList(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  PriceList copyWith({int? id, Value<String?> name = const Value.absent()}) =>
      PriceList(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
      );
  @override
  String toString() {
    return (StringBuffer('PriceList(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PriceList && other.id == this.id && other.name == this.name);
}

class PriceListsCompanion extends UpdateCompanion<PriceList> {
  final Value<int> id;
  final Value<String?> name;
  const PriceListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PriceListsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<PriceList> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PriceListsCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return PriceListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PriceListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EquipmentListsTable extends EquipmentLists
    with TableInfo<$EquipmentListsTable, EquipmentList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _academicManagementIdMeta =
      const VerificationMeta('academicManagementId');
  @override
  late final GeneratedColumn<int> academicManagementId = GeneratedColumn<int>(
      'academic_management_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _gradeIdMeta =
      const VerificationMeta('gradeId');
  @override
  late final GeneratedColumn<int> gradeId = GeneratedColumn<int>(
      'grade_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        state,
        academicManagementId,
        gradeId,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_lists';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('academic_management_id')) {
      context.handle(
          _academicManagementIdMeta,
          academicManagementId.isAcceptableOrUnknown(
              data['academic_management_id']!, _academicManagementIdMeta));
    }
    if (data.containsKey('grade_id')) {
      context.handle(_gradeIdMeta,
          gradeId.isAcceptableOrUnknown(data['grade_id']!, _gradeIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      academicManagementId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}academic_management_id']),
      gradeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade_id']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $EquipmentListsTable createAlias(String alias) {
    return $EquipmentListsTable(attachedDatabase, alias);
  }
}

class EquipmentList extends DataClass implements Insertable<EquipmentList> {
  final int id;
  final String? name;
  final String? state;
  final int? academicManagementId;
  final int? gradeId;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const EquipmentList(
      {required this.id,
      this.name,
      this.state,
      this.academicManagementId,
      this.gradeId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || academicManagementId != null) {
      map['academic_management_id'] = Variable<int>(academicManagementId);
    }
    if (!nullToAbsent || gradeId != null) {
      map['grade_id'] = Variable<int>(gradeId);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  EquipmentListsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentListsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      academicManagementId: academicManagementId == null && nullToAbsent
          ? const Value.absent()
          : Value(academicManagementId),
      gradeId: gradeId == null && nullToAbsent
          ? const Value.absent()
          : Value(gradeId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory EquipmentList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentList(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      state: serializer.fromJson<String?>(json['state']),
      academicManagementId:
          serializer.fromJson<int?>(json['academicManagementId']),
      gradeId: serializer.fromJson<int?>(json['gradeId']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'state': serializer.toJson<String?>(state),
      'academicManagementId': serializer.toJson<int?>(academicManagementId),
      'gradeId': serializer.toJson<int?>(gradeId),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  EquipmentList copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<int?> academicManagementId = const Value.absent(),
          Value<int?> gradeId = const Value.absent(),
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      EquipmentList(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        state: state.present ? state.value : this.state,
        academicManagementId: academicManagementId.present
            ? academicManagementId.value
            : this.academicManagementId,
        gradeId: gradeId.present ? gradeId.value : this.gradeId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentList(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('state: $state, ')
          ..write('academicManagementId: $academicManagementId, ')
          ..write('gradeId: $gradeId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, state, academicManagementId,
      gradeId, createdBy, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentList &&
          other.id == this.id &&
          other.name == this.name &&
          other.state == this.state &&
          other.academicManagementId == this.academicManagementId &&
          other.gradeId == this.gradeId &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EquipmentListsCompanion extends UpdateCompanion<EquipmentList> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> state;
  final Value<int?> academicManagementId;
  final Value<int?> gradeId;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const EquipmentListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.state = const Value.absent(),
    this.academicManagementId = const Value.absent(),
    this.gradeId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EquipmentListsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.state = const Value.absent(),
    this.academicManagementId = const Value.absent(),
    this.gradeId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<EquipmentList> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? state,
    Expression<int>? academicManagementId,
    Expression<int>? gradeId,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state,
      if (academicManagementId != null)
        'academic_management_id': academicManagementId,
      if (gradeId != null) 'grade_id': gradeId,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EquipmentListsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? state,
      Value<int?>? academicManagementId,
      Value<int?>? gradeId,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return EquipmentListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      academicManagementId: academicManagementId ?? this.academicManagementId,
      gradeId: gradeId ?? this.gradeId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (academicManagementId.present) {
      map['academic_management_id'] = Variable<int>(academicManagementId.value);
    }
    if (gradeId.present) {
      map['grade_id'] = Variable<int>(gradeId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('state: $state, ')
          ..write('academicManagementId: $academicManagementId, ')
          ..write('gradeId: $gradeId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _erpCodeMeta =
      const VerificationMeta('erpCode');
  @override
  late final GeneratedColumn<String> erpCode = GeneratedColumn<String>(
      'erp_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _invoiceNameMeta =
      const VerificationMeta('invoiceName');
  @override
  late final GeneratedColumn<String> invoiceName = GeneratedColumn<String>(
      'invoice_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nitMeta = const VerificationMeta('nit');
  @override
  late final GeneratedColumn<String> nit = GeneratedColumn<String>(
      'nit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatherIdMeta =
      const VerificationMeta('fatherId');
  @override
  late final GeneratedColumn<int> fatherId = GeneratedColumn<int>(
      'father_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _gradeIdMeta =
      const VerificationMeta('gradeId');
  @override
  late final GeneratedColumn<int> gradeId = GeneratedColumn<int>(
      'grade_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _parallelIdMeta =
      const VerificationMeta('parallelId');
  @override
  late final GeneratedColumn<int> parallelId = GeneratedColumn<int>(
      'parallel_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceListIdMeta =
      const VerificationMeta('priceListId');
  @override
  late final GeneratedColumn<int> priceListId = GeneratedColumn<int>(
      'price_list_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        erpCode,
        email,
        invoiceName,
        nit,
        state,
        fatherId,
        gradeId,
        parallelId,
        priceListId,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('erp_code')) {
      context.handle(_erpCodeMeta,
          erpCode.isAcceptableOrUnknown(data['erp_code']!, _erpCodeMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('invoice_name')) {
      context.handle(
          _invoiceNameMeta,
          invoiceName.isAcceptableOrUnknown(
              data['invoice_name']!, _invoiceNameMeta));
    }
    if (data.containsKey('nit')) {
      context.handle(
          _nitMeta, nit.isAcceptableOrUnknown(data['nit']!, _nitMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('father_id')) {
      context.handle(_fatherIdMeta,
          fatherId.isAcceptableOrUnknown(data['father_id']!, _fatherIdMeta));
    }
    if (data.containsKey('grade_id')) {
      context.handle(_gradeIdMeta,
          gradeId.isAcceptableOrUnknown(data['grade_id']!, _gradeIdMeta));
    }
    if (data.containsKey('parallel_id')) {
      context.handle(
          _parallelIdMeta,
          parallelId.isAcceptableOrUnknown(
              data['parallel_id']!, _parallelIdMeta));
    }
    if (data.containsKey('price_list_id')) {
      context.handle(
          _priceListIdMeta,
          priceListId.isAcceptableOrUnknown(
              data['price_list_id']!, _priceListIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      erpCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}erp_code']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      invoiceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_name']),
      nit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nit']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      fatherId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}father_id']),
      gradeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade_id']),
      parallelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parallel_id']),
      priceListId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price_list_id']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String? name;
  final String? erpCode;
  final String? email;
  final String? invoiceName;
  final String? nit;
  final String? state;
  final int? fatherId;
  final int? gradeId;
  final int? parallelId;
  final int? priceListId;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const Student(
      {required this.id,
      this.name,
      this.erpCode,
      this.email,
      this.invoiceName,
      this.nit,
      this.state,
      this.fatherId,
      this.gradeId,
      this.parallelId,
      this.priceListId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || erpCode != null) {
      map['erp_code'] = Variable<String>(erpCode);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || invoiceName != null) {
      map['invoice_name'] = Variable<String>(invoiceName);
    }
    if (!nullToAbsent || nit != null) {
      map['nit'] = Variable<String>(nit);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || fatherId != null) {
      map['father_id'] = Variable<int>(fatherId);
    }
    if (!nullToAbsent || gradeId != null) {
      map['grade_id'] = Variable<int>(gradeId);
    }
    if (!nullToAbsent || parallelId != null) {
      map['parallel_id'] = Variable<int>(parallelId);
    }
    if (!nullToAbsent || priceListId != null) {
      map['price_list_id'] = Variable<int>(priceListId);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      erpCode: erpCode == null && nullToAbsent
          ? const Value.absent()
          : Value(erpCode),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      invoiceName: invoiceName == null && nullToAbsent
          ? const Value.absent()
          : Value(invoiceName),
      nit: nit == null && nullToAbsent ? const Value.absent() : Value(nit),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      fatherId: fatherId == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherId),
      gradeId: gradeId == null && nullToAbsent
          ? const Value.absent()
          : Value(gradeId),
      parallelId: parallelId == null && nullToAbsent
          ? const Value.absent()
          : Value(parallelId),
      priceListId: priceListId == null && nullToAbsent
          ? const Value.absent()
          : Value(priceListId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      erpCode: serializer.fromJson<String?>(json['erpCode']),
      email: serializer.fromJson<String?>(json['email']),
      invoiceName: serializer.fromJson<String?>(json['invoiceName']),
      nit: serializer.fromJson<String?>(json['nit']),
      state: serializer.fromJson<String?>(json['state']),
      fatherId: serializer.fromJson<int?>(json['fatherId']),
      gradeId: serializer.fromJson<int?>(json['gradeId']),
      parallelId: serializer.fromJson<int?>(json['parallelId']),
      priceListId: serializer.fromJson<int?>(json['priceListId']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'erpCode': serializer.toJson<String?>(erpCode),
      'email': serializer.toJson<String?>(email),
      'invoiceName': serializer.toJson<String?>(invoiceName),
      'nit': serializer.toJson<String?>(nit),
      'state': serializer.toJson<String?>(state),
      'fatherId': serializer.toJson<int?>(fatherId),
      'gradeId': serializer.toJson<int?>(gradeId),
      'parallelId': serializer.toJson<int?>(parallelId),
      'priceListId': serializer.toJson<int?>(priceListId),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  Student copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> erpCode = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> invoiceName = const Value.absent(),
          Value<String?> nit = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<int?> fatherId = const Value.absent(),
          Value<int?> gradeId = const Value.absent(),
          Value<int?> parallelId = const Value.absent(),
          Value<int?> priceListId = const Value.absent(),
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      Student(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        erpCode: erpCode.present ? erpCode.value : this.erpCode,
        email: email.present ? email.value : this.email,
        invoiceName: invoiceName.present ? invoiceName.value : this.invoiceName,
        nit: nit.present ? nit.value : this.nit,
        state: state.present ? state.value : this.state,
        fatherId: fatherId.present ? fatherId.value : this.fatherId,
        gradeId: gradeId.present ? gradeId.value : this.gradeId,
        parallelId: parallelId.present ? parallelId.value : this.parallelId,
        priceListId: priceListId.present ? priceListId.value : this.priceListId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('erpCode: $erpCode, ')
          ..write('email: $email, ')
          ..write('invoiceName: $invoiceName, ')
          ..write('nit: $nit, ')
          ..write('state: $state, ')
          ..write('fatherId: $fatherId, ')
          ..write('gradeId: $gradeId, ')
          ..write('parallelId: $parallelId, ')
          ..write('priceListId: $priceListId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      erpCode,
      email,
      invoiceName,
      nit,
      state,
      fatherId,
      gradeId,
      parallelId,
      priceListId,
      createdBy,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.name == this.name &&
          other.erpCode == this.erpCode &&
          other.email == this.email &&
          other.invoiceName == this.invoiceName &&
          other.nit == this.nit &&
          other.state == this.state &&
          other.fatherId == this.fatherId &&
          other.gradeId == this.gradeId &&
          other.parallelId == this.parallelId &&
          other.priceListId == this.priceListId &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> erpCode;
  final Value<String?> email;
  final Value<String?> invoiceName;
  final Value<String?> nit;
  final Value<String?> state;
  final Value<int?> fatherId;
  final Value<int?> gradeId;
  final Value<int?> parallelId;
  final Value<int?> priceListId;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.erpCode = const Value.absent(),
    this.email = const Value.absent(),
    this.invoiceName = const Value.absent(),
    this.nit = const Value.absent(),
    this.state = const Value.absent(),
    this.fatherId = const Value.absent(),
    this.gradeId = const Value.absent(),
    this.parallelId = const Value.absent(),
    this.priceListId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.erpCode = const Value.absent(),
    this.email = const Value.absent(),
    this.invoiceName = const Value.absent(),
    this.nit = const Value.absent(),
    this.state = const Value.absent(),
    this.fatherId = const Value.absent(),
    this.gradeId = const Value.absent(),
    this.parallelId = const Value.absent(),
    this.priceListId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? erpCode,
    Expression<String>? email,
    Expression<String>? invoiceName,
    Expression<String>? nit,
    Expression<String>? state,
    Expression<int>? fatherId,
    Expression<int>? gradeId,
    Expression<int>? parallelId,
    Expression<int>? priceListId,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (erpCode != null) 'erp_code': erpCode,
      if (email != null) 'email': email,
      if (invoiceName != null) 'invoice_name': invoiceName,
      if (nit != null) 'nit': nit,
      if (state != null) 'state': state,
      if (fatherId != null) 'father_id': fatherId,
      if (gradeId != null) 'grade_id': gradeId,
      if (parallelId != null) 'parallel_id': parallelId,
      if (priceListId != null) 'price_list_id': priceListId,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? erpCode,
      Value<String?>? email,
      Value<String?>? invoiceName,
      Value<String?>? nit,
      Value<String?>? state,
      Value<int?>? fatherId,
      Value<int?>? gradeId,
      Value<int?>? parallelId,
      Value<int?>? priceListId,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return StudentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      erpCode: erpCode ?? this.erpCode,
      email: email ?? this.email,
      invoiceName: invoiceName ?? this.invoiceName,
      nit: nit ?? this.nit,
      state: state ?? this.state,
      fatherId: fatherId ?? this.fatherId,
      gradeId: gradeId ?? this.gradeId,
      parallelId: parallelId ?? this.parallelId,
      priceListId: priceListId ?? this.priceListId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (erpCode.present) {
      map['erp_code'] = Variable<String>(erpCode.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (invoiceName.present) {
      map['invoice_name'] = Variable<String>(invoiceName.value);
    }
    if (nit.present) {
      map['nit'] = Variable<String>(nit.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (fatherId.present) {
      map['father_id'] = Variable<int>(fatherId.value);
    }
    if (gradeId.present) {
      map['grade_id'] = Variable<int>(gradeId.value);
    }
    if (parallelId.present) {
      map['parallel_id'] = Variable<int>(parallelId.value);
    }
    if (priceListId.present) {
      map['price_list_id'] = Variable<int>(priceListId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('erpCode: $erpCode, ')
          ..write('email: $email, ')
          ..write('invoiceName: $invoiceName, ')
          ..write('nit: $nit, ')
          ..write('state: $state, ')
          ..write('fatherId: $fatherId, ')
          ..write('gradeId: $gradeId, ')
          ..write('parallelId: $parallelId, ')
          ..write('priceListId: $priceListId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EquipmentPriceListsTable extends EquipmentPriceLists
    with TableInfo<$EquipmentPriceListsTable, EquipmentPriceList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentPriceListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceListIdMeta =
      const VerificationMeta('priceListId');
  @override
  late final GeneratedColumn<int> priceListId = GeneratedColumn<int>(
      'price_list_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  @override
  late final GeneratedColumn<int> equipmentId = GeneratedColumn<int>(
      'equipment_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, priceListId, equipmentId, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_price_lists';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentPriceList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('price_list_id')) {
      context.handle(
          _priceListIdMeta,
          priceListId.isAcceptableOrUnknown(
              data['price_list_id']!, _priceListIdMeta));
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id']!, _equipmentIdMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentPriceList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentPriceList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      priceListId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price_list_id']),
      equipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_id']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $EquipmentPriceListsTable createAlias(String alias) {
    return $EquipmentPriceListsTable(attachedDatabase, alias);
  }
}

class EquipmentPriceList extends DataClass
    implements Insertable<EquipmentPriceList> {
  final int id;
  final int? priceListId;
  final int? equipmentId;
  final double? price;
  const EquipmentPriceList(
      {required this.id, this.priceListId, this.equipmentId, this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || priceListId != null) {
      map['price_list_id'] = Variable<int>(priceListId);
    }
    if (!nullToAbsent || equipmentId != null) {
      map['equipment_id'] = Variable<int>(equipmentId);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  EquipmentPriceListsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentPriceListsCompanion(
      id: Value(id),
      priceListId: priceListId == null && nullToAbsent
          ? const Value.absent()
          : Value(priceListId),
      equipmentId: equipmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(equipmentId),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory EquipmentPriceList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentPriceList(
      id: serializer.fromJson<int>(json['id']),
      priceListId: serializer.fromJson<int?>(json['priceListId']),
      equipmentId: serializer.fromJson<int?>(json['equipmentId']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'priceListId': serializer.toJson<int?>(priceListId),
      'equipmentId': serializer.toJson<int?>(equipmentId),
      'price': serializer.toJson<double?>(price),
    };
  }

  EquipmentPriceList copyWith(
          {int? id,
          Value<int?> priceListId = const Value.absent(),
          Value<int?> equipmentId = const Value.absent(),
          Value<double?> price = const Value.absent()}) =>
      EquipmentPriceList(
        id: id ?? this.id,
        priceListId: priceListId.present ? priceListId.value : this.priceListId,
        equipmentId: equipmentId.present ? equipmentId.value : this.equipmentId,
        price: price.present ? price.value : this.price,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentPriceList(')
          ..write('id: $id, ')
          ..write('priceListId: $priceListId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, priceListId, equipmentId, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentPriceList &&
          other.id == this.id &&
          other.priceListId == this.priceListId &&
          other.equipmentId == this.equipmentId &&
          other.price == this.price);
}

class EquipmentPriceListsCompanion extends UpdateCompanion<EquipmentPriceList> {
  final Value<int> id;
  final Value<int?> priceListId;
  final Value<int?> equipmentId;
  final Value<double?> price;
  const EquipmentPriceListsCompanion({
    this.id = const Value.absent(),
    this.priceListId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.price = const Value.absent(),
  });
  EquipmentPriceListsCompanion.insert({
    this.id = const Value.absent(),
    this.priceListId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.price = const Value.absent(),
  });
  static Insertable<EquipmentPriceList> custom({
    Expression<int>? id,
    Expression<int>? priceListId,
    Expression<int>? equipmentId,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (priceListId != null) 'price_list_id': priceListId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (price != null) 'price': price,
    });
  }

  EquipmentPriceListsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? priceListId,
      Value<int?>? equipmentId,
      Value<double?>? price}) {
    return EquipmentPriceListsCompanion(
      id: id ?? this.id,
      priceListId: priceListId ?? this.priceListId,
      equipmentId: equipmentId ?? this.equipmentId,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (priceListId.present) {
      map['price_list_id'] = Variable<int>(priceListId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentPriceListsCompanion(')
          ..write('id: $id, ')
          ..write('priceListId: $priceListId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $AcademicManagementsTable extends AcademicManagements
    with TableInfo<$AcademicManagementsTable, AcademicManagement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AcademicManagementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _registrationStartDateMeta =
      const VerificationMeta('registrationStartDate');
  @override
  late final GeneratedColumn<String> registrationStartDate =
      GeneratedColumn<String>('registration_start_date', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _registrationEndDateMeta =
      const VerificationMeta('registrationEndDate');
  @override
  late final GeneratedColumn<String> registrationEndDate =
      GeneratedColumn<String>('registration_end_date', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        year,
        registrationStartDate,
        registrationEndDate,
        state,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'academic_managements';
  @override
  VerificationContext validateIntegrity(Insertable<AcademicManagement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('registration_start_date')) {
      context.handle(
          _registrationStartDateMeta,
          registrationStartDate.isAcceptableOrUnknown(
              data['registration_start_date']!, _registrationStartDateMeta));
    }
    if (data.containsKey('registration_end_date')) {
      context.handle(
          _registrationEndDateMeta,
          registrationEndDate.isAcceptableOrUnknown(
              data['registration_end_date']!, _registrationEndDateMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AcademicManagement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AcademicManagement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year']),
      registrationStartDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}registration_start_date']),
      registrationEndDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}registration_end_date']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $AcademicManagementsTable createAlias(String alias) {
    return $AcademicManagementsTable(attachedDatabase, alias);
  }
}

class AcademicManagement extends DataClass
    implements Insertable<AcademicManagement> {
  final int id;
  final int? year;
  final String? registrationStartDate;
  final String? registrationEndDate;
  final String? state;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const AcademicManagement(
      {required this.id,
      this.year,
      this.registrationStartDate,
      this.registrationEndDate,
      this.state,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || registrationStartDate != null) {
      map['registration_start_date'] = Variable<String>(registrationStartDate);
    }
    if (!nullToAbsent || registrationEndDate != null) {
      map['registration_end_date'] = Variable<String>(registrationEndDate);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  AcademicManagementsCompanion toCompanion(bool nullToAbsent) {
    return AcademicManagementsCompanion(
      id: Value(id),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      registrationStartDate: registrationStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationStartDate),
      registrationEndDate: registrationEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationEndDate),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory AcademicManagement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AcademicManagement(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<int?>(json['year']),
      registrationStartDate:
          serializer.fromJson<String?>(json['registrationStartDate']),
      registrationEndDate:
          serializer.fromJson<String?>(json['registrationEndDate']),
      state: serializer.fromJson<String?>(json['state']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int?>(year),
      'registrationStartDate':
          serializer.toJson<String?>(registrationStartDate),
      'registrationEndDate': serializer.toJson<String?>(registrationEndDate),
      'state': serializer.toJson<String?>(state),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  AcademicManagement copyWith(
          {int? id,
          Value<int?> year = const Value.absent(),
          Value<String?> registrationStartDate = const Value.absent(),
          Value<String?> registrationEndDate = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      AcademicManagement(
        id: id ?? this.id,
        year: year.present ? year.value : this.year,
        registrationStartDate: registrationStartDate.present
            ? registrationStartDate.value
            : this.registrationStartDate,
        registrationEndDate: registrationEndDate.present
            ? registrationEndDate.value
            : this.registrationEndDate,
        state: state.present ? state.value : this.state,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('AcademicManagement(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('registrationStartDate: $registrationStartDate, ')
          ..write('registrationEndDate: $registrationEndDate, ')
          ..write('state: $state, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, year, registrationStartDate,
      registrationEndDate, state, createdBy, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AcademicManagement &&
          other.id == this.id &&
          other.year == this.year &&
          other.registrationStartDate == this.registrationStartDate &&
          other.registrationEndDate == this.registrationEndDate &&
          other.state == this.state &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AcademicManagementsCompanion extends UpdateCompanion<AcademicManagement> {
  final Value<int> id;
  final Value<int?> year;
  final Value<String?> registrationStartDate;
  final Value<String?> registrationEndDate;
  final Value<String?> state;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const AcademicManagementsCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.registrationStartDate = const Value.absent(),
    this.registrationEndDate = const Value.absent(),
    this.state = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AcademicManagementsCompanion.insert({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.registrationStartDate = const Value.absent(),
    this.registrationEndDate = const Value.absent(),
    this.state = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<AcademicManagement> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<String>? registrationStartDate,
    Expression<String>? registrationEndDate,
    Expression<String>? state,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (registrationStartDate != null)
        'registration_start_date': registrationStartDate,
      if (registrationEndDate != null)
        'registration_end_date': registrationEndDate,
      if (state != null) 'state': state,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AcademicManagementsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? year,
      Value<String?>? registrationStartDate,
      Value<String?>? registrationEndDate,
      Value<String?>? state,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return AcademicManagementsCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      registrationStartDate:
          registrationStartDate ?? this.registrationStartDate,
      registrationEndDate: registrationEndDate ?? this.registrationEndDate,
      state: state ?? this.state,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (registrationStartDate.present) {
      map['registration_start_date'] =
          Variable<String>(registrationStartDate.value);
    }
    if (registrationEndDate.present) {
      map['registration_end_date'] =
          Variable<String>(registrationEndDate.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AcademicManagementsCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('registrationStartDate: $registrationStartDate, ')
          ..write('registrationEndDate: $registrationEndDate, ')
          ..write('state: $state, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EquipmentListDetailsTable extends EquipmentListDetails
    with TableInfo<$EquipmentListDetailsTable, EquipmentListDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentListDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _singlePurchaseMeta =
      const VerificationMeta('singlePurchase');
  @override
  late final GeneratedColumn<String> singlePurchase = GeneratedColumn<String>(
      'single_purchase', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _minQuantityMeta =
      const VerificationMeta('minQuantity');
  @override
  late final GeneratedColumn<double> minQuantity = GeneratedColumn<double>(
      'min_quantity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxQuantityMeta =
      const VerificationMeta('maxQuantity');
  @override
  late final GeneratedColumn<double> maxQuantity = GeneratedColumn<double>(
      'max_quantity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _equipmentListIdMeta =
      const VerificationMeta('equipmentListId');
  @override
  late final GeneratedColumn<int> equipmentListId = GeneratedColumn<int>(
      'equipment_list_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  @override
  late final GeneratedColumn<int> equipmentId = GeneratedColumn<int>(
      'equipment_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        singlePurchase,
        minQuantity,
        maxQuantity,
        equipmentListId,
        equipmentId,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_list_details';
  @override
  VerificationContext validateIntegrity(
      Insertable<EquipmentListDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('single_purchase')) {
      context.handle(
          _singlePurchaseMeta,
          singlePurchase.isAcceptableOrUnknown(
              data['single_purchase']!, _singlePurchaseMeta));
    }
    if (data.containsKey('min_quantity')) {
      context.handle(
          _minQuantityMeta,
          minQuantity.isAcceptableOrUnknown(
              data['min_quantity']!, _minQuantityMeta));
    }
    if (data.containsKey('max_quantity')) {
      context.handle(
          _maxQuantityMeta,
          maxQuantity.isAcceptableOrUnknown(
              data['max_quantity']!, _maxQuantityMeta));
    }
    if (data.containsKey('equipment_list_id')) {
      context.handle(
          _equipmentListIdMeta,
          equipmentListId.isAcceptableOrUnknown(
              data['equipment_list_id']!, _equipmentListIdMeta));
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id']!, _equipmentIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentListDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentListDetail(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      singlePurchase: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}single_purchase']),
      minQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_quantity']),
      maxQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_quantity']),
      equipmentListId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_list_id']),
      equipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_id']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $EquipmentListDetailsTable createAlias(String alias) {
    return $EquipmentListDetailsTable(attachedDatabase, alias);
  }
}

class EquipmentListDetail extends DataClass
    implements Insertable<EquipmentListDetail> {
  final int id;
  final String? singlePurchase;
  final double? minQuantity;
  final double? maxQuantity;
  final int? equipmentListId;
  final int? equipmentId;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const EquipmentListDetail(
      {required this.id,
      this.singlePurchase,
      this.minQuantity,
      this.maxQuantity,
      this.equipmentListId,
      this.equipmentId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || singlePurchase != null) {
      map['single_purchase'] = Variable<String>(singlePurchase);
    }
    if (!nullToAbsent || minQuantity != null) {
      map['min_quantity'] = Variable<double>(minQuantity);
    }
    if (!nullToAbsent || maxQuantity != null) {
      map['max_quantity'] = Variable<double>(maxQuantity);
    }
    if (!nullToAbsent || equipmentListId != null) {
      map['equipment_list_id'] = Variable<int>(equipmentListId);
    }
    if (!nullToAbsent || equipmentId != null) {
      map['equipment_id'] = Variable<int>(equipmentId);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  EquipmentListDetailsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentListDetailsCompanion(
      id: Value(id),
      singlePurchase: singlePurchase == null && nullToAbsent
          ? const Value.absent()
          : Value(singlePurchase),
      minQuantity: minQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(minQuantity),
      maxQuantity: maxQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(maxQuantity),
      equipmentListId: equipmentListId == null && nullToAbsent
          ? const Value.absent()
          : Value(equipmentListId),
      equipmentId: equipmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(equipmentId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory EquipmentListDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentListDetail(
      id: serializer.fromJson<int>(json['id']),
      singlePurchase: serializer.fromJson<String?>(json['singlePurchase']),
      minQuantity: serializer.fromJson<double?>(json['minQuantity']),
      maxQuantity: serializer.fromJson<double?>(json['maxQuantity']),
      equipmentListId: serializer.fromJson<int?>(json['equipmentListId']),
      equipmentId: serializer.fromJson<int?>(json['equipmentId']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'singlePurchase': serializer.toJson<String?>(singlePurchase),
      'minQuantity': serializer.toJson<double?>(minQuantity),
      'maxQuantity': serializer.toJson<double?>(maxQuantity),
      'equipmentListId': serializer.toJson<int?>(equipmentListId),
      'equipmentId': serializer.toJson<int?>(equipmentId),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  EquipmentListDetail copyWith(
          {int? id,
          Value<String?> singlePurchase = const Value.absent(),
          Value<double?> minQuantity = const Value.absent(),
          Value<double?> maxQuantity = const Value.absent(),
          Value<int?> equipmentListId = const Value.absent(),
          Value<int?> equipmentId = const Value.absent(),
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      EquipmentListDetail(
        id: id ?? this.id,
        singlePurchase:
            singlePurchase.present ? singlePurchase.value : this.singlePurchase,
        minQuantity: minQuantity.present ? minQuantity.value : this.minQuantity,
        maxQuantity: maxQuantity.present ? maxQuantity.value : this.maxQuantity,
        equipmentListId: equipmentListId.present
            ? equipmentListId.value
            : this.equipmentListId,
        equipmentId: equipmentId.present ? equipmentId.value : this.equipmentId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentListDetail(')
          ..write('id: $id, ')
          ..write('singlePurchase: $singlePurchase, ')
          ..write('minQuantity: $minQuantity, ')
          ..write('maxQuantity: $maxQuantity, ')
          ..write('equipmentListId: $equipmentListId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, singlePurchase, minQuantity, maxQuantity,
      equipmentListId, equipmentId, createdBy, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentListDetail &&
          other.id == this.id &&
          other.singlePurchase == this.singlePurchase &&
          other.minQuantity == this.minQuantity &&
          other.maxQuantity == this.maxQuantity &&
          other.equipmentListId == this.equipmentListId &&
          other.equipmentId == this.equipmentId &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EquipmentListDetailsCompanion
    extends UpdateCompanion<EquipmentListDetail> {
  final Value<int> id;
  final Value<String?> singlePurchase;
  final Value<double?> minQuantity;
  final Value<double?> maxQuantity;
  final Value<int?> equipmentListId;
  final Value<int?> equipmentId;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const EquipmentListDetailsCompanion({
    this.id = const Value.absent(),
    this.singlePurchase = const Value.absent(),
    this.minQuantity = const Value.absent(),
    this.maxQuantity = const Value.absent(),
    this.equipmentListId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EquipmentListDetailsCompanion.insert({
    this.id = const Value.absent(),
    this.singlePurchase = const Value.absent(),
    this.minQuantity = const Value.absent(),
    this.maxQuantity = const Value.absent(),
    this.equipmentListId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<EquipmentListDetail> custom({
    Expression<int>? id,
    Expression<String>? singlePurchase,
    Expression<double>? minQuantity,
    Expression<double>? maxQuantity,
    Expression<int>? equipmentListId,
    Expression<int>? equipmentId,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (singlePurchase != null) 'single_purchase': singlePurchase,
      if (minQuantity != null) 'min_quantity': minQuantity,
      if (maxQuantity != null) 'max_quantity': maxQuantity,
      if (equipmentListId != null) 'equipment_list_id': equipmentListId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EquipmentListDetailsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? singlePurchase,
      Value<double?>? minQuantity,
      Value<double?>? maxQuantity,
      Value<int?>? equipmentListId,
      Value<int?>? equipmentId,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return EquipmentListDetailsCompanion(
      id: id ?? this.id,
      singlePurchase: singlePurchase ?? this.singlePurchase,
      minQuantity: minQuantity ?? this.minQuantity,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      equipmentListId: equipmentListId ?? this.equipmentListId,
      equipmentId: equipmentId ?? this.equipmentId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (singlePurchase.present) {
      map['single_purchase'] = Variable<String>(singlePurchase.value);
    }
    if (minQuantity.present) {
      map['min_quantity'] = Variable<double>(minQuantity.value);
    }
    if (maxQuantity.present) {
      map['max_quantity'] = Variable<double>(maxQuantity.value);
    }
    if (equipmentListId.present) {
      map['equipment_list_id'] = Variable<int>(equipmentListId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentListDetailsCompanion(')
          ..write('id: $id, ')
          ..write('singlePurchase: $singlePurchase, ')
          ..write('minQuantity: $minQuantity, ')
          ..write('maxQuantity: $maxQuantity, ')
          ..write('equipmentListId: $equipmentListId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AnnotationsTable extends Annotations
    with TableInfo<$AnnotationsTable, Annotation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnnotationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, type, subject, description, studentId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'annotations';
  @override
  VerificationContext validateIntegrity(Insertable<Annotation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    if (data.containsKey('text')) {
      context.handle(_descriptionMeta,
          description.isAcceptableOrUnknown(data['text']!, _descriptionMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Annotation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Annotation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text']),
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $AnnotationsTable createAlias(String alias) {
    return $AnnotationsTable(attachedDatabase, alias);
  }
}

class Annotation extends DataClass implements Insertable<Annotation> {
  final int id;
  final String? date;
  final String? type;
  final String? subject;
  final String? description;
  final int? studentId;
  final String? createdAt;
  const Annotation(
      {required this.id,
      this.date,
      this.type,
      this.subject,
      this.description,
      this.studentId,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    if (!nullToAbsent || description != null) {
      map['text'] = Variable<String>(description);
    }
    if (!nullToAbsent || studentId != null) {
      map['student_id'] = Variable<int>(studentId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  AnnotationsCompanion toCompanion(bool nullToAbsent) {
    return AnnotationsCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Annotation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Annotation(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String?>(json['date']),
      type: serializer.fromJson<String?>(json['type']),
      subject: serializer.fromJson<String?>(json['subject']),
      description: serializer.fromJson<String?>(json['description']),
      studentId: serializer.fromJson<int?>(json['studentId']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String?>(date),
      'type': serializer.toJson<String?>(type),
      'subject': serializer.toJson<String?>(subject),
      'description': serializer.toJson<String?>(description),
      'studentId': serializer.toJson<int?>(studentId),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  Annotation copyWith(
          {int? id,
          Value<String?> date = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<String?> subject = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<int?> studentId = const Value.absent(),
          Value<String?> createdAt = const Value.absent()}) =>
      Annotation(
        id: id ?? this.id,
        date: date.present ? date.value : this.date,
        type: type.present ? type.value : this.type,
        subject: subject.present ? subject.value : this.subject,
        description: description.present ? description.value : this.description,
        studentId: studentId.present ? studentId.value : this.studentId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Annotation(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('subject: $subject, ')
          ..write('description: $description, ')
          ..write('studentId: $studentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, type, subject, description, studentId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Annotation &&
          other.id == this.id &&
          other.date == this.date &&
          other.type == this.type &&
          other.subject == this.subject &&
          other.description == this.description &&
          other.studentId == this.studentId &&
          other.createdAt == this.createdAt);
}

class AnnotationsCompanion extends UpdateCompanion<Annotation> {
  final Value<int> id;
  final Value<String?> date;
  final Value<String?> type;
  final Value<String?> subject;
  final Value<String?> description;
  final Value<int?> studentId;
  final Value<String?> createdAt;
  const AnnotationsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.subject = const Value.absent(),
    this.description = const Value.absent(),
    this.studentId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AnnotationsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.subject = const Value.absent(),
    this.description = const Value.absent(),
    this.studentId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Annotation> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<String>? type,
    Expression<String>? subject,
    Expression<String>? description,
    Expression<int>? studentId,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (subject != null) 'subject': subject,
      if (description != null) 'text': description,
      if (studentId != null) 'student_id': studentId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AnnotationsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? date,
      Value<String?>? type,
      Value<String?>? subject,
      Value<String?>? description,
      Value<int?>? studentId,
      Value<String?>? createdAt}) {
    return AnnotationsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      studentId: studentId ?? this.studentId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (description.present) {
      map['text'] = Variable<String>(description.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnnotationsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('subject: $subject, ')
          ..write('description: $description, ')
          ..write('studentId: $studentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AbsencesTable extends Absences with TableInfo<$AbsencesTable, Absence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbsencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _absenceGroupMeta =
      const VerificationMeta('absenceGroup');
  @override
  late final GeneratedColumn<String> absenceGroup = GeneratedColumn<String>(
      'absence_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        startTime,
        endTime,
        type,
        time,
        absenceGroup,
        studentId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'absences';
  @override
  VerificationContext validateIntegrity(Insertable<Absence> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    if (data.containsKey('absence_group')) {
      context.handle(
          _absenceGroupMeta,
          absenceGroup.isAcceptableOrUnknown(
              data['absence_group']!, _absenceGroupMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Absence map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Absence(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time']),
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time']),
      absenceGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}absence_group']),
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $AbsencesTable createAlias(String alias) {
    return $AbsencesTable(attachedDatabase, alias);
  }
}

class Absence extends DataClass implements Insertable<Absence> {
  final int id;
  final String? date;
  final int? startTime;
  final int? endTime;
  final String? type;
  final int? time;
  final String? absenceGroup;
  final int? studentId;
  final String? createdAt;
  const Absence(
      {required this.id,
      this.date,
      this.startTime,
      this.endTime,
      this.type,
      this.time,
      this.absenceGroup,
      this.studentId,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<int>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<int>(endTime);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<int>(time);
    }
    if (!nullToAbsent || absenceGroup != null) {
      map['absence_group'] = Variable<String>(absenceGroup);
    }
    if (!nullToAbsent || studentId != null) {
      map['student_id'] = Variable<int>(studentId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  AbsencesCompanion toCompanion(bool nullToAbsent) {
    return AbsencesCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      absenceGroup: absenceGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(absenceGroup),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Absence.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Absence(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String?>(json['date']),
      startTime: serializer.fromJson<int?>(json['startTime']),
      endTime: serializer.fromJson<int?>(json['endTime']),
      type: serializer.fromJson<String?>(json['type']),
      time: serializer.fromJson<int?>(json['time']),
      absenceGroup: serializer.fromJson<String?>(json['absenceGroup']),
      studentId: serializer.fromJson<int?>(json['studentId']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String?>(date),
      'startTime': serializer.toJson<int?>(startTime),
      'endTime': serializer.toJson<int?>(endTime),
      'type': serializer.toJson<String?>(type),
      'time': serializer.toJson<int?>(time),
      'absenceGroup': serializer.toJson<String?>(absenceGroup),
      'studentId': serializer.toJson<int?>(studentId),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  Absence copyWith(
          {int? id,
          Value<String?> date = const Value.absent(),
          Value<int?> startTime = const Value.absent(),
          Value<int?> endTime = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<int?> time = const Value.absent(),
          Value<String?> absenceGroup = const Value.absent(),
          Value<int?> studentId = const Value.absent(),
          Value<String?> createdAt = const Value.absent()}) =>
      Absence(
        id: id ?? this.id,
        date: date.present ? date.value : this.date,
        startTime: startTime.present ? startTime.value : this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        type: type.present ? type.value : this.type,
        time: time.present ? time.value : this.time,
        absenceGroup:
            absenceGroup.present ? absenceGroup.value : this.absenceGroup,
        studentId: studentId.present ? studentId.value : this.studentId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Absence(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('type: $type, ')
          ..write('time: $time, ')
          ..write('absenceGroup: $absenceGroup, ')
          ..write('studentId: $studentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, startTime, endTime, type, time,
      absenceGroup, studentId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Absence &&
          other.id == this.id &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.type == this.type &&
          other.time == this.time &&
          other.absenceGroup == this.absenceGroup &&
          other.studentId == this.studentId &&
          other.createdAt == this.createdAt);
}

class AbsencesCompanion extends UpdateCompanion<Absence> {
  final Value<int> id;
  final Value<String?> date;
  final Value<int?> startTime;
  final Value<int?> endTime;
  final Value<String?> type;
  final Value<int?> time;
  final Value<String?> absenceGroup;
  final Value<int?> studentId;
  final Value<String?> createdAt;
  const AbsencesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.type = const Value.absent(),
    this.time = const Value.absent(),
    this.absenceGroup = const Value.absent(),
    this.studentId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AbsencesCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.type = const Value.absent(),
    this.time = const Value.absent(),
    this.absenceGroup = const Value.absent(),
    this.studentId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Absence> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? type,
    Expression<int>? time,
    Expression<String>? absenceGroup,
    Expression<int>? studentId,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (type != null) 'type': type,
      if (time != null) 'time': time,
      if (absenceGroup != null) 'absence_group': absenceGroup,
      if (studentId != null) 'student_id': studentId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AbsencesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? date,
      Value<int?>? startTime,
      Value<int?>? endTime,
      Value<String?>? type,
      Value<int?>? time,
      Value<String?>? absenceGroup,
      Value<int?>? studentId,
      Value<String?>? createdAt}) {
    return AbsencesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      type: type ?? this.type,
      time: time ?? this.time,
      absenceGroup: absenceGroup ?? this.absenceGroup,
      studentId: studentId ?? this.studentId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (absenceGroup.present) {
      map['absence_group'] = Variable<String>(absenceGroup.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbsencesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('type: $type, ')
          ..write('time: $time, ')
          ..write('absenceGroup: $absenceGroup, ')
          ..write('studentId: $studentId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $EquipmentRequestsTable extends EquipmentRequests
    with TableInfo<$EquipmentRequestsTable, EquipmentRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _erpCodeMeta =
      const VerificationMeta('erpCode');
  @override
  late final GeneratedColumn<String> erpCode = GeneratedColumn<String>(
      'erp_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceListIdMeta =
      const VerificationMeta('priceListId');
  @override
  late final GeneratedColumn<int> priceListId = GeneratedColumn<int>(
      'price_list_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _equipmentListIdMeta =
      const VerificationMeta('equipmentListId');
  @override
  late final GeneratedColumn<int> equipmentListId = GeneratedColumn<int>(
      'equipment_list_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _academicManagementIdMeta =
      const VerificationMeta('academicManagementId');
  @override
  late final GeneratedColumn<int> academicManagementId = GeneratedColumn<int>(
      'academic_management_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        erpCode,
        state,
        date,
        token,
        total,
        priceListId,
        equipmentListId,
        studentId,
        employeeId,
        academicManagementId,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_requests';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('erp_code')) {
      context.handle(_erpCodeMeta,
          erpCode.isAcceptableOrUnknown(data['erp_code']!, _erpCodeMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('price_list_id')) {
      context.handle(
          _priceListIdMeta,
          priceListId.isAcceptableOrUnknown(
              data['price_list_id']!, _priceListIdMeta));
    } else if (isInserting) {
      context.missing(_priceListIdMeta);
    }
    if (data.containsKey('equipment_list_id')) {
      context.handle(
          _equipmentListIdMeta,
          equipmentListId.isAcceptableOrUnknown(
              data['equipment_list_id']!, _equipmentListIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentListIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    }
    if (data.containsKey('academic_management_id')) {
      context.handle(
          _academicManagementIdMeta,
          academicManagementId.isAcceptableOrUnknown(
              data['academic_management_id']!, _academicManagementIdMeta));
    } else if (isInserting) {
      context.missing(_academicManagementIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      erpCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}erp_code']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token']),
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      priceListId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price_list_id'])!,
      equipmentListId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_list_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id']),
      academicManagementId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}academic_management_id'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $EquipmentRequestsTable createAlias(String alias) {
    return $EquipmentRequestsTable(attachedDatabase, alias);
  }
}

class EquipmentRequest extends DataClass
    implements Insertable<EquipmentRequest> {
  final int id;
  final String? erpCode;
  final String state;
  final String? date;
  final String? token;
  final double total;
  final int priceListId;
  final int equipmentListId;
  final int studentId;
  final int? employeeId;
  final int academicManagementId;
  final int? createdBy;
  final String createdAt;
  final String updatedAt;
  const EquipmentRequest(
      {required this.id,
      this.erpCode,
      required this.state,
      this.date,
      this.token,
      required this.total,
      required this.priceListId,
      required this.equipmentListId,
      required this.studentId,
      this.employeeId,
      required this.academicManagementId,
      this.createdBy,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || erpCode != null) {
      map['erp_code'] = Variable<String>(erpCode);
    }
    map['state'] = Variable<String>(state);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    map['total'] = Variable<double>(total);
    map['price_list_id'] = Variable<int>(priceListId);
    map['equipment_list_id'] = Variable<int>(equipmentListId);
    map['student_id'] = Variable<int>(studentId);
    if (!nullToAbsent || employeeId != null) {
      map['employee_id'] = Variable<int>(employeeId);
    }
    map['academic_management_id'] = Variable<int>(academicManagementId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  EquipmentRequestsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentRequestsCompanion(
      id: Value(id),
      erpCode: erpCode == null && nullToAbsent
          ? const Value.absent()
          : Value(erpCode),
      state: Value(state),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      total: Value(total),
      priceListId: Value(priceListId),
      equipmentListId: Value(equipmentListId),
      studentId: Value(studentId),
      employeeId: employeeId == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeId),
      academicManagementId: Value(academicManagementId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EquipmentRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentRequest(
      id: serializer.fromJson<int>(json['id']),
      erpCode: serializer.fromJson<String?>(json['erpCode']),
      state: serializer.fromJson<String>(json['state']),
      date: serializer.fromJson<String?>(json['date']),
      token: serializer.fromJson<String?>(json['token']),
      total: serializer.fromJson<double>(json['total']),
      priceListId: serializer.fromJson<int>(json['priceListId']),
      equipmentListId: serializer.fromJson<int>(json['equipmentListId']),
      studentId: serializer.fromJson<int>(json['studentId']),
      employeeId: serializer.fromJson<int?>(json['employeeId']),
      academicManagementId:
          serializer.fromJson<int>(json['academicManagementId']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'erpCode': serializer.toJson<String?>(erpCode),
      'state': serializer.toJson<String>(state),
      'date': serializer.toJson<String?>(date),
      'token': serializer.toJson<String?>(token),
      'total': serializer.toJson<double>(total),
      'priceListId': serializer.toJson<int>(priceListId),
      'equipmentListId': serializer.toJson<int>(equipmentListId),
      'studentId': serializer.toJson<int>(studentId),
      'employeeId': serializer.toJson<int?>(employeeId),
      'academicManagementId': serializer.toJson<int>(academicManagementId),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  EquipmentRequest copyWith(
          {int? id,
          Value<String?> erpCode = const Value.absent(),
          String? state,
          Value<String?> date = const Value.absent(),
          Value<String?> token = const Value.absent(),
          double? total,
          int? priceListId,
          int? equipmentListId,
          int? studentId,
          Value<int?> employeeId = const Value.absent(),
          int? academicManagementId,
          Value<int?> createdBy = const Value.absent(),
          String? createdAt,
          String? updatedAt}) =>
      EquipmentRequest(
        id: id ?? this.id,
        erpCode: erpCode.present ? erpCode.value : this.erpCode,
        state: state ?? this.state,
        date: date.present ? date.value : this.date,
        token: token.present ? token.value : this.token,
        total: total ?? this.total,
        priceListId: priceListId ?? this.priceListId,
        equipmentListId: equipmentListId ?? this.equipmentListId,
        studentId: studentId ?? this.studentId,
        employeeId: employeeId.present ? employeeId.value : this.employeeId,
        academicManagementId: academicManagementId ?? this.academicManagementId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentRequest(')
          ..write('id: $id, ')
          ..write('erpCode: $erpCode, ')
          ..write('state: $state, ')
          ..write('date: $date, ')
          ..write('token: $token, ')
          ..write('total: $total, ')
          ..write('priceListId: $priceListId, ')
          ..write('equipmentListId: $equipmentListId, ')
          ..write('studentId: $studentId, ')
          ..write('employeeId: $employeeId, ')
          ..write('academicManagementId: $academicManagementId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      erpCode,
      state,
      date,
      token,
      total,
      priceListId,
      equipmentListId,
      studentId,
      employeeId,
      academicManagementId,
      createdBy,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentRequest &&
          other.id == this.id &&
          other.erpCode == this.erpCode &&
          other.state == this.state &&
          other.date == this.date &&
          other.token == this.token &&
          other.total == this.total &&
          other.priceListId == this.priceListId &&
          other.equipmentListId == this.equipmentListId &&
          other.studentId == this.studentId &&
          other.employeeId == this.employeeId &&
          other.academicManagementId == this.academicManagementId &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EquipmentRequestsCompanion extends UpdateCompanion<EquipmentRequest> {
  final Value<int> id;
  final Value<String?> erpCode;
  final Value<String> state;
  final Value<String?> date;
  final Value<String?> token;
  final Value<double> total;
  final Value<int> priceListId;
  final Value<int> equipmentListId;
  final Value<int> studentId;
  final Value<int?> employeeId;
  final Value<int> academicManagementId;
  final Value<int?> createdBy;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const EquipmentRequestsCompanion({
    this.id = const Value.absent(),
    this.erpCode = const Value.absent(),
    this.state = const Value.absent(),
    this.date = const Value.absent(),
    this.token = const Value.absent(),
    this.total = const Value.absent(),
    this.priceListId = const Value.absent(),
    this.equipmentListId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.academicManagementId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EquipmentRequestsCompanion.insert({
    this.id = const Value.absent(),
    this.erpCode = const Value.absent(),
    required String state,
    this.date = const Value.absent(),
    this.token = const Value.absent(),
    required double total,
    required int priceListId,
    required int equipmentListId,
    required int studentId,
    this.employeeId = const Value.absent(),
    required int academicManagementId,
    this.createdBy = const Value.absent(),
    required String createdAt,
    required String updatedAt,
  })  : state = Value(state),
        total = Value(total),
        priceListId = Value(priceListId),
        equipmentListId = Value(equipmentListId),
        studentId = Value(studentId),
        academicManagementId = Value(academicManagementId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<EquipmentRequest> custom({
    Expression<int>? id,
    Expression<String>? erpCode,
    Expression<String>? state,
    Expression<String>? date,
    Expression<String>? token,
    Expression<double>? total,
    Expression<int>? priceListId,
    Expression<int>? equipmentListId,
    Expression<int>? studentId,
    Expression<int>? employeeId,
    Expression<int>? academicManagementId,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (erpCode != null) 'erp_code': erpCode,
      if (state != null) 'state': state,
      if (date != null) 'date': date,
      if (token != null) 'token': token,
      if (total != null) 'total': total,
      if (priceListId != null) 'price_list_id': priceListId,
      if (equipmentListId != null) 'equipment_list_id': equipmentListId,
      if (studentId != null) 'student_id': studentId,
      if (employeeId != null) 'employee_id': employeeId,
      if (academicManagementId != null)
        'academic_management_id': academicManagementId,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EquipmentRequestsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? erpCode,
      Value<String>? state,
      Value<String?>? date,
      Value<String?>? token,
      Value<double>? total,
      Value<int>? priceListId,
      Value<int>? equipmentListId,
      Value<int>? studentId,
      Value<int?>? employeeId,
      Value<int>? academicManagementId,
      Value<int?>? createdBy,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return EquipmentRequestsCompanion(
      id: id ?? this.id,
      erpCode: erpCode ?? this.erpCode,
      state: state ?? this.state,
      date: date ?? this.date,
      token: token ?? this.token,
      total: total ?? this.total,
      priceListId: priceListId ?? this.priceListId,
      equipmentListId: equipmentListId ?? this.equipmentListId,
      studentId: studentId ?? this.studentId,
      employeeId: employeeId ?? this.employeeId,
      academicManagementId: academicManagementId ?? this.academicManagementId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (erpCode.present) {
      map['erp_code'] = Variable<String>(erpCode.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (priceListId.present) {
      map['price_list_id'] = Variable<int>(priceListId.value);
    }
    if (equipmentListId.present) {
      map['equipment_list_id'] = Variable<int>(equipmentListId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (academicManagementId.present) {
      map['academic_management_id'] = Variable<int>(academicManagementId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentRequestsCompanion(')
          ..write('id: $id, ')
          ..write('erpCode: $erpCode, ')
          ..write('state: $state, ')
          ..write('date: $date, ')
          ..write('token: $token, ')
          ..write('total: $total, ')
          ..write('priceListId: $priceListId, ')
          ..write('equipmentListId: $equipmentListId, ')
          ..write('studentId: $studentId, ')
          ..write('employeeId: $employeeId, ')
          ..write('academicManagementId: $academicManagementId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EquipmentRequestDetailsTable extends EquipmentRequestDetails
    with TableInfo<$EquipmentRequestDetailsTable, EquipmentRequestDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentRequestDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _subTotalMeta =
      const VerificationMeta('subTotal');
  @override
  late final GeneratedColumn<double> subTotal = GeneratedColumn<double>(
      'sub_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  @override
  late final GeneratedColumn<int> equipmentId = GeneratedColumn<int>(
      'equipment_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _equipmentRequestIdMeta =
      const VerificationMeta('equipmentRequestId');
  @override
  late final GeneratedColumn<int> equipmentRequestId = GeneratedColumn<int>(
      'equipment_request_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
      'created_by', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        quantity,
        price,
        subTotal,
        equipmentId,
        equipmentRequestId,
        createdBy,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_request_details';
  @override
  VerificationContext validateIntegrity(
      Insertable<EquipmentRequestDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('sub_total')) {
      context.handle(_subTotalMeta,
          subTotal.isAcceptableOrUnknown(data['sub_total']!, _subTotalMeta));
    } else if (isInserting) {
      context.missing(_subTotalMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id']!, _equipmentIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('equipment_request_id')) {
      context.handle(
          _equipmentRequestIdMeta,
          equipmentRequestId.isAcceptableOrUnknown(
              data['equipment_request_id']!, _equipmentRequestIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentRequestIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentRequestDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentRequestDetail(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      subTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sub_total'])!,
      equipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_id'])!,
      equipmentRequestId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}equipment_request_id'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $EquipmentRequestDetailsTable createAlias(String alias) {
    return $EquipmentRequestDetailsTable(attachedDatabase, alias);
  }
}

class EquipmentRequestDetail extends DataClass
    implements Insertable<EquipmentRequestDetail> {
  final int id;
  final double quantity;
  final double price;
  final double subTotal;
  final int equipmentId;
  final int equipmentRequestId;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;
  const EquipmentRequestDetail(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.subTotal,
      required this.equipmentId,
      required this.equipmentRequestId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quantity'] = Variable<double>(quantity);
    map['price'] = Variable<double>(price);
    map['sub_total'] = Variable<double>(subTotal);
    map['equipment_id'] = Variable<int>(equipmentId);
    map['equipment_request_id'] = Variable<int>(equipmentRequestId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  EquipmentRequestDetailsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentRequestDetailsCompanion(
      id: Value(id),
      quantity: Value(quantity),
      price: Value(price),
      subTotal: Value(subTotal),
      equipmentId: Value(equipmentId),
      equipmentRequestId: Value(equipmentRequestId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory EquipmentRequestDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentRequestDetail(
      id: serializer.fromJson<int>(json['id']),
      quantity: serializer.fromJson<double>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      subTotal: serializer.fromJson<double>(json['subTotal']),
      equipmentId: serializer.fromJson<int>(json['equipmentId']),
      equipmentRequestId: serializer.fromJson<int>(json['equipmentRequestId']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantity': serializer.toJson<double>(quantity),
      'price': serializer.toJson<double>(price),
      'subTotal': serializer.toJson<double>(subTotal),
      'equipmentId': serializer.toJson<int>(equipmentId),
      'equipmentRequestId': serializer.toJson<int>(equipmentRequestId),
      'createdBy': serializer.toJson<int?>(createdBy),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  EquipmentRequestDetail copyWith(
          {int? id,
          double? quantity,
          double? price,
          double? subTotal,
          int? equipmentId,
          int? equipmentRequestId,
          Value<int?> createdBy = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> updatedAt = const Value.absent()}) =>
      EquipmentRequestDetail(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        subTotal: subTotal ?? this.subTotal,
        equipmentId: equipmentId ?? this.equipmentId,
        equipmentRequestId: equipmentRequestId ?? this.equipmentRequestId,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentRequestDetail(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('subTotal: $subTotal, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('equipmentRequestId: $equipmentRequestId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quantity, price, subTotal, equipmentId,
      equipmentRequestId, createdBy, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentRequestDetail &&
          other.id == this.id &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.subTotal == this.subTotal &&
          other.equipmentId == this.equipmentId &&
          other.equipmentRequestId == this.equipmentRequestId &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EquipmentRequestDetailsCompanion
    extends UpdateCompanion<EquipmentRequestDetail> {
  final Value<int> id;
  final Value<double> quantity;
  final Value<double> price;
  final Value<double> subTotal;
  final Value<int> equipmentId;
  final Value<int> equipmentRequestId;
  final Value<int?> createdBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const EquipmentRequestDetailsCompanion({
    this.id = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.subTotal = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.equipmentRequestId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EquipmentRequestDetailsCompanion.insert({
    this.id = const Value.absent(),
    required double quantity,
    required double price,
    required double subTotal,
    required int equipmentId,
    required int equipmentRequestId,
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : quantity = Value(quantity),
        price = Value(price),
        subTotal = Value(subTotal),
        equipmentId = Value(equipmentId),
        equipmentRequestId = Value(equipmentRequestId);
  static Insertable<EquipmentRequestDetail> custom({
    Expression<int>? id,
    Expression<double>? quantity,
    Expression<double>? price,
    Expression<double>? subTotal,
    Expression<int>? equipmentId,
    Expression<int>? equipmentRequestId,
    Expression<int>? createdBy,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (subTotal != null) 'sub_total': subTotal,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (equipmentRequestId != null)
        'equipment_request_id': equipmentRequestId,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EquipmentRequestDetailsCompanion copyWith(
      {Value<int>? id,
      Value<double>? quantity,
      Value<double>? price,
      Value<double>? subTotal,
      Value<int>? equipmentId,
      Value<int>? equipmentRequestId,
      Value<int?>? createdBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return EquipmentRequestDetailsCompanion(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      subTotal: subTotal ?? this.subTotal,
      equipmentId: equipmentId ?? this.equipmentId,
      equipmentRequestId: equipmentRequestId ?? this.equipmentRequestId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (subTotal.present) {
      map['sub_total'] = Variable<double>(subTotal.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (equipmentRequestId.present) {
      map['equipment_request_id'] = Variable<int>(equipmentRequestId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentRequestDetailsCompanion(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('subTotal: $subTotal, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('equipmentRequestId: $equipmentRequestId, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LicenseRequestsTable extends LicenseRequests
    with TableInfo<$LicenseRequestsTable, LicenseRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LicenseRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _studentCodeMeta =
      const VerificationMeta('studentCode');
  @override
  late final GeneratedColumn<String> studentCode = GeneratedColumn<String>(
      'student_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _testMeta = const VerificationMeta('test');
  @override
  late final GeneratedColumn<bool> test = GeneratedColumn<bool>(
      'test', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("test" IN (0, 1))'));
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requesterNameMeta =
      const VerificationMeta('requesterName');
  @override
  late final GeneratedColumn<String> requesterName = GeneratedColumn<String>(
      'requester_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requesterPhoneMeta =
      const VerificationMeta('requesterPhone');
  @override
  late final GeneratedColumn<int> requesterPhone = GeneratedColumn<int>(
      'requester_phone', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _requesterEmailMeta =
      const VerificationMeta('requesterEmail');
  @override
  late final GeneratedColumn<String> requesterEmail = GeneratedColumn<String>(
      'requester_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<String> attachment = GeneratedColumn<String>(
      'attachment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _gradeIdMeta =
      const VerificationMeta('gradeId');
  @override
  late final GeneratedColumn<int> gradeId = GeneratedColumn<int>(
      'grade_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parallelIdMeta =
      const VerificationMeta('parallelId');
  @override
  late final GeneratedColumn<int> parallelId = GeneratedColumn<int>(
      'parallel_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _academicManagementIdMeta =
      const VerificationMeta('academicManagementId');
  @override
  late final GeneratedColumn<int> academicManagementId = GeneratedColumn<int>(
      'academic_management_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        studentCode,
        date,
        startDate,
        endDate,
        status,
        test,
        reason,
        requesterName,
        requesterPhone,
        requesterEmail,
        attachment,
        studentId,
        gradeId,
        parallelId,
        academicManagementId,
        subjectId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'license_requests';
  @override
  VerificationContext validateIntegrity(Insertable<LicenseRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_code')) {
      context.handle(
          _studentCodeMeta,
          studentCode.isAcceptableOrUnknown(
              data['student_code']!, _studentCodeMeta));
    } else if (isInserting) {
      context.missing(_studentCodeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('test')) {
      context.handle(
          _testMeta, test.isAcceptableOrUnknown(data['test']!, _testMeta));
    } else if (isInserting) {
      context.missing(_testMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('requester_name')) {
      context.handle(
          _requesterNameMeta,
          requesterName.isAcceptableOrUnknown(
              data['requester_name']!, _requesterNameMeta));
    } else if (isInserting) {
      context.missing(_requesterNameMeta);
    }
    if (data.containsKey('requester_phone')) {
      context.handle(
          _requesterPhoneMeta,
          requesterPhone.isAcceptableOrUnknown(
              data['requester_phone']!, _requesterPhoneMeta));
    }
    if (data.containsKey('requester_email')) {
      context.handle(
          _requesterEmailMeta,
          requesterEmail.isAcceptableOrUnknown(
              data['requester_email']!, _requesterEmailMeta));
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    } else if (isInserting) {
      context.missing(_attachmentMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('grade_id')) {
      context.handle(_gradeIdMeta,
          gradeId.isAcceptableOrUnknown(data['grade_id']!, _gradeIdMeta));
    } else if (isInserting) {
      context.missing(_gradeIdMeta);
    }
    if (data.containsKey('parallel_id')) {
      context.handle(
          _parallelIdMeta,
          parallelId.isAcceptableOrUnknown(
              data['parallel_id']!, _parallelIdMeta));
    } else if (isInserting) {
      context.missing(_parallelIdMeta);
    }
    if (data.containsKey('academic_management_id')) {
      context.handle(
          _academicManagementIdMeta,
          academicManagementId.isAcceptableOrUnknown(
              data['academic_management_id']!, _academicManagementIdMeta));
    } else if (isInserting) {
      context.missing(_academicManagementIdMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LicenseRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LicenseRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      studentCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_code'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      test: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}test'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      requesterName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requester_name'])!,
      requesterPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}requester_phone']),
      requesterEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requester_email']),
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      gradeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade_id'])!,
      parallelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parallel_id'])!,
      academicManagementId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}academic_management_id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id'])!,
    );
  }

  @override
  $LicenseRequestsTable createAlias(String alias) {
    return $LicenseRequestsTable(attachedDatabase, alias);
  }
}

class LicenseRequest extends DataClass implements Insertable<LicenseRequest> {
  final int id;
  final String studentCode;
  final DateTime date;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final bool test;
  final String reason;
  final String requesterName;
  final int? requesterPhone;
  final String? requesterEmail;
  final String attachment;
  final int studentId;
  final int gradeId;
  final int parallelId;
  final int academicManagementId;
  final int subjectId;
  const LicenseRequest(
      {required this.id,
      required this.studentCode,
      required this.date,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.test,
      required this.reason,
      required this.requesterName,
      this.requesterPhone,
      this.requesterEmail,
      required this.attachment,
      required this.studentId,
      required this.gradeId,
      required this.parallelId,
      required this.academicManagementId,
      required this.subjectId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_code'] = Variable<String>(studentCode);
    map['date'] = Variable<DateTime>(date);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['status'] = Variable<String>(status);
    map['test'] = Variable<bool>(test);
    map['reason'] = Variable<String>(reason);
    map['requester_name'] = Variable<String>(requesterName);
    if (!nullToAbsent || requesterPhone != null) {
      map['requester_phone'] = Variable<int>(requesterPhone);
    }
    if (!nullToAbsent || requesterEmail != null) {
      map['requester_email'] = Variable<String>(requesterEmail);
    }
    map['attachment'] = Variable<String>(attachment);
    map['student_id'] = Variable<int>(studentId);
    map['grade_id'] = Variable<int>(gradeId);
    map['parallel_id'] = Variable<int>(parallelId);
    map['academic_management_id'] = Variable<int>(academicManagementId);
    map['subject_id'] = Variable<int>(subjectId);
    return map;
  }

  LicenseRequestsCompanion toCompanion(bool nullToAbsent) {
    return LicenseRequestsCompanion(
      id: Value(id),
      studentCode: Value(studentCode),
      date: Value(date),
      startDate: Value(startDate),
      endDate: Value(endDate),
      status: Value(status),
      test: Value(test),
      reason: Value(reason),
      requesterName: Value(requesterName),
      requesterPhone: requesterPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(requesterPhone),
      requesterEmail: requesterEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(requesterEmail),
      attachment: Value(attachment),
      studentId: Value(studentId),
      gradeId: Value(gradeId),
      parallelId: Value(parallelId),
      academicManagementId: Value(academicManagementId),
      subjectId: Value(subjectId),
    );
  }

  factory LicenseRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LicenseRequest(
      id: serializer.fromJson<int>(json['id']),
      studentCode: serializer.fromJson<String>(json['studentCode']),
      date: serializer.fromJson<DateTime>(json['date']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      status: serializer.fromJson<String>(json['status']),
      test: serializer.fromJson<bool>(json['test']),
      reason: serializer.fromJson<String>(json['reason']),
      requesterName: serializer.fromJson<String>(json['requesterName']),
      requesterPhone: serializer.fromJson<int?>(json['requesterPhone']),
      requesterEmail: serializer.fromJson<String?>(json['requesterEmail']),
      attachment: serializer.fromJson<String>(json['attachment']),
      studentId: serializer.fromJson<int>(json['studentId']),
      gradeId: serializer.fromJson<int>(json['gradeId']),
      parallelId: serializer.fromJson<int>(json['parallelId']),
      academicManagementId:
          serializer.fromJson<int>(json['academicManagementId']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentCode': serializer.toJson<String>(studentCode),
      'date': serializer.toJson<DateTime>(date),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'status': serializer.toJson<String>(status),
      'test': serializer.toJson<bool>(test),
      'reason': serializer.toJson<String>(reason),
      'requesterName': serializer.toJson<String>(requesterName),
      'requesterPhone': serializer.toJson<int?>(requesterPhone),
      'requesterEmail': serializer.toJson<String?>(requesterEmail),
      'attachment': serializer.toJson<String>(attachment),
      'studentId': serializer.toJson<int>(studentId),
      'gradeId': serializer.toJson<int>(gradeId),
      'parallelId': serializer.toJson<int>(parallelId),
      'academicManagementId': serializer.toJson<int>(academicManagementId),
      'subjectId': serializer.toJson<int>(subjectId),
    };
  }

  LicenseRequest copyWith(
          {int? id,
          String? studentCode,
          DateTime? date,
          DateTime? startDate,
          DateTime? endDate,
          String? status,
          bool? test,
          String? reason,
          String? requesterName,
          Value<int?> requesterPhone = const Value.absent(),
          Value<String?> requesterEmail = const Value.absent(),
          String? attachment,
          int? studentId,
          int? gradeId,
          int? parallelId,
          int? academicManagementId,
          int? subjectId}) =>
      LicenseRequest(
        id: id ?? this.id,
        studentCode: studentCode ?? this.studentCode,
        date: date ?? this.date,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        test: test ?? this.test,
        reason: reason ?? this.reason,
        requesterName: requesterName ?? this.requesterName,
        requesterPhone:
            requesterPhone.present ? requesterPhone.value : this.requesterPhone,
        requesterEmail:
            requesterEmail.present ? requesterEmail.value : this.requesterEmail,
        attachment: attachment ?? this.attachment,
        studentId: studentId ?? this.studentId,
        gradeId: gradeId ?? this.gradeId,
        parallelId: parallelId ?? this.parallelId,
        academicManagementId: academicManagementId ?? this.academicManagementId,
        subjectId: subjectId ?? this.subjectId,
      );
  @override
  String toString() {
    return (StringBuffer('LicenseRequest(')
          ..write('id: $id, ')
          ..write('studentCode: $studentCode, ')
          ..write('date: $date, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('test: $test, ')
          ..write('reason: $reason, ')
          ..write('requesterName: $requesterName, ')
          ..write('requesterPhone: $requesterPhone, ')
          ..write('requesterEmail: $requesterEmail, ')
          ..write('attachment: $attachment, ')
          ..write('studentId: $studentId, ')
          ..write('gradeId: $gradeId, ')
          ..write('parallelId: $parallelId, ')
          ..write('academicManagementId: $academicManagementId, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      studentCode,
      date,
      startDate,
      endDate,
      status,
      test,
      reason,
      requesterName,
      requesterPhone,
      requesterEmail,
      attachment,
      studentId,
      gradeId,
      parallelId,
      academicManagementId,
      subjectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LicenseRequest &&
          other.id == this.id &&
          other.studentCode == this.studentCode &&
          other.date == this.date &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.test == this.test &&
          other.reason == this.reason &&
          other.requesterName == this.requesterName &&
          other.requesterPhone == this.requesterPhone &&
          other.requesterEmail == this.requesterEmail &&
          other.attachment == this.attachment &&
          other.studentId == this.studentId &&
          other.gradeId == this.gradeId &&
          other.parallelId == this.parallelId &&
          other.academicManagementId == this.academicManagementId &&
          other.subjectId == this.subjectId);
}

class LicenseRequestsCompanion extends UpdateCompanion<LicenseRequest> {
  final Value<int> id;
  final Value<String> studentCode;
  final Value<DateTime> date;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> status;
  final Value<bool> test;
  final Value<String> reason;
  final Value<String> requesterName;
  final Value<int?> requesterPhone;
  final Value<String?> requesterEmail;
  final Value<String> attachment;
  final Value<int> studentId;
  final Value<int> gradeId;
  final Value<int> parallelId;
  final Value<int> academicManagementId;
  final Value<int> subjectId;
  const LicenseRequestsCompanion({
    this.id = const Value.absent(),
    this.studentCode = const Value.absent(),
    this.date = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.test = const Value.absent(),
    this.reason = const Value.absent(),
    this.requesterName = const Value.absent(),
    this.requesterPhone = const Value.absent(),
    this.requesterEmail = const Value.absent(),
    this.attachment = const Value.absent(),
    this.studentId = const Value.absent(),
    this.gradeId = const Value.absent(),
    this.parallelId = const Value.absent(),
    this.academicManagementId = const Value.absent(),
    this.subjectId = const Value.absent(),
  });
  LicenseRequestsCompanion.insert({
    this.id = const Value.absent(),
    required String studentCode,
    required DateTime date,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
    required bool test,
    required String reason,
    required String requesterName,
    this.requesterPhone = const Value.absent(),
    this.requesterEmail = const Value.absent(),
    required String attachment,
    required int studentId,
    required int gradeId,
    required int parallelId,
    required int academicManagementId,
    required int subjectId,
  })  : studentCode = Value(studentCode),
        date = Value(date),
        startDate = Value(startDate),
        endDate = Value(endDate),
        status = Value(status),
        test = Value(test),
        reason = Value(reason),
        requesterName = Value(requesterName),
        attachment = Value(attachment),
        studentId = Value(studentId),
        gradeId = Value(gradeId),
        parallelId = Value(parallelId),
        academicManagementId = Value(academicManagementId),
        subjectId = Value(subjectId);
  static Insertable<LicenseRequest> custom({
    Expression<int>? id,
    Expression<String>? studentCode,
    Expression<DateTime>? date,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<bool>? test,
    Expression<String>? reason,
    Expression<String>? requesterName,
    Expression<int>? requesterPhone,
    Expression<String>? requesterEmail,
    Expression<String>? attachment,
    Expression<int>? studentId,
    Expression<int>? gradeId,
    Expression<int>? parallelId,
    Expression<int>? academicManagementId,
    Expression<int>? subjectId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentCode != null) 'student_code': studentCode,
      if (date != null) 'date': date,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (test != null) 'test': test,
      if (reason != null) 'reason': reason,
      if (requesterName != null) 'requester_name': requesterName,
      if (requesterPhone != null) 'requester_phone': requesterPhone,
      if (requesterEmail != null) 'requester_email': requesterEmail,
      if (attachment != null) 'attachment': attachment,
      if (studentId != null) 'student_id': studentId,
      if (gradeId != null) 'grade_id': gradeId,
      if (parallelId != null) 'parallel_id': parallelId,
      if (academicManagementId != null)
        'academic_management_id': academicManagementId,
      if (subjectId != null) 'subject_id': subjectId,
    });
  }

  LicenseRequestsCompanion copyWith(
      {Value<int>? id,
      Value<String>? studentCode,
      Value<DateTime>? date,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<String>? status,
      Value<bool>? test,
      Value<String>? reason,
      Value<String>? requesterName,
      Value<int?>? requesterPhone,
      Value<String?>? requesterEmail,
      Value<String>? attachment,
      Value<int>? studentId,
      Value<int>? gradeId,
      Value<int>? parallelId,
      Value<int>? academicManagementId,
      Value<int>? subjectId}) {
    return LicenseRequestsCompanion(
      id: id ?? this.id,
      studentCode: studentCode ?? this.studentCode,
      date: date ?? this.date,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      test: test ?? this.test,
      reason: reason ?? this.reason,
      requesterName: requesterName ?? this.requesterName,
      requesterPhone: requesterPhone ?? this.requesterPhone,
      requesterEmail: requesterEmail ?? this.requesterEmail,
      attachment: attachment ?? this.attachment,
      studentId: studentId ?? this.studentId,
      gradeId: gradeId ?? this.gradeId,
      parallelId: parallelId ?? this.parallelId,
      academicManagementId: academicManagementId ?? this.academicManagementId,
      subjectId: subjectId ?? this.subjectId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentCode.present) {
      map['student_code'] = Variable<String>(studentCode.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (test.present) {
      map['test'] = Variable<bool>(test.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (requesterName.present) {
      map['requester_name'] = Variable<String>(requesterName.value);
    }
    if (requesterPhone.present) {
      map['requester_phone'] = Variable<int>(requesterPhone.value);
    }
    if (requesterEmail.present) {
      map['requester_email'] = Variable<String>(requesterEmail.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<String>(attachment.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (gradeId.present) {
      map['grade_id'] = Variable<int>(gradeId.value);
    }
    if (parallelId.present) {
      map['parallel_id'] = Variable<int>(parallelId.value);
    }
    if (academicManagementId.present) {
      map['academic_management_id'] = Variable<int>(academicManagementId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LicenseRequestsCompanion(')
          ..write('id: $id, ')
          ..write('studentCode: $studentCode, ')
          ..write('date: $date, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('test: $test, ')
          ..write('reason: $reason, ')
          ..write('requesterName: $requesterName, ')
          ..write('requesterPhone: $requesterPhone, ')
          ..write('requesterEmail: $requesterEmail, ')
          ..write('attachment: $attachment, ')
          ..write('studentId: $studentId, ')
          ..write('gradeId: $gradeId, ')
          ..write('parallelId: $parallelId, ')
          ..write('academicManagementId: $academicManagementId, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(Insertable<Subject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String? name;
  const Subject({required this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  Subject copyWith({int? id, Value<String?> name = const Value.absent()}) =>
      Subject(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject && other.id == this.id && other.name == this.name);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String?> name;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SubjectsCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GradesSubjectsTable extends GradesSubjects
    with TableInfo<$GradesSubjectsTable, GradeSubject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradesSubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _gradeIdMeta =
      const VerificationMeta('gradeId');
  @override
  late final GeneratedColumn<int> gradeId = GeneratedColumn<int>(
      'grade_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, gradeId, subjectId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grades_subjects';
  @override
  VerificationContext validateIntegrity(Insertable<GradeSubject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('grade_id')) {
      context.handle(_gradeIdMeta,
          gradeId.isAcceptableOrUnknown(data['grade_id']!, _gradeIdMeta));
    } else if (isInserting) {
      context.missing(_gradeIdMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GradeSubject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradeSubject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gradeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade_id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id'])!,
    );
  }

  @override
  $GradesSubjectsTable createAlias(String alias) {
    return $GradesSubjectsTable(attachedDatabase, alias);
  }
}

class GradeSubject extends DataClass implements Insertable<GradeSubject> {
  final int id;
  final int gradeId;
  final int subjectId;
  const GradeSubject(
      {required this.id, required this.gradeId, required this.subjectId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['grade_id'] = Variable<int>(gradeId);
    map['subject_id'] = Variable<int>(subjectId);
    return map;
  }

  GradesSubjectsCompanion toCompanion(bool nullToAbsent) {
    return GradesSubjectsCompanion(
      id: Value(id),
      gradeId: Value(gradeId),
      subjectId: Value(subjectId),
    );
  }

  factory GradeSubject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradeSubject(
      id: serializer.fromJson<int>(json['id']),
      gradeId: serializer.fromJson<int>(json['gradeId']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gradeId': serializer.toJson<int>(gradeId),
      'subjectId': serializer.toJson<int>(subjectId),
    };
  }

  GradeSubject copyWith({int? id, int? gradeId, int? subjectId}) =>
      GradeSubject(
        id: id ?? this.id,
        gradeId: gradeId ?? this.gradeId,
        subjectId: subjectId ?? this.subjectId,
      );
  @override
  String toString() {
    return (StringBuffer('GradeSubject(')
          ..write('id: $id, ')
          ..write('gradeId: $gradeId, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gradeId, subjectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradeSubject &&
          other.id == this.id &&
          other.gradeId == this.gradeId &&
          other.subjectId == this.subjectId);
}

class GradesSubjectsCompanion extends UpdateCompanion<GradeSubject> {
  final Value<int> id;
  final Value<int> gradeId;
  final Value<int> subjectId;
  const GradesSubjectsCompanion({
    this.id = const Value.absent(),
    this.gradeId = const Value.absent(),
    this.subjectId = const Value.absent(),
  });
  GradesSubjectsCompanion.insert({
    this.id = const Value.absent(),
    required int gradeId,
    required int subjectId,
  })  : gradeId = Value(gradeId),
        subjectId = Value(subjectId);
  static Insertable<GradeSubject> custom({
    Expression<int>? id,
    Expression<int>? gradeId,
    Expression<int>? subjectId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gradeId != null) 'grade_id': gradeId,
      if (subjectId != null) 'subject_id': subjectId,
    });
  }

  GradesSubjectsCompanion copyWith(
      {Value<int>? id, Value<int>? gradeId, Value<int>? subjectId}) {
    return GradesSubjectsCompanion(
      id: id ?? this.id,
      gradeId: gradeId ?? this.gradeId,
      subjectId: subjectId ?? this.subjectId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gradeId.present) {
      map['grade_id'] = Variable<int>(gradeId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradesSubjectsCompanion(')
          ..write('id: $id, ')
          ..write('gradeId: $gradeId, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TypesTable types = $TypesTable(this);
  late final $NewsTable news = $NewsTable(this);
  late final $NewsImagesTable newsImages = $NewsImagesTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $GradesTable grades = $GradesTable(this);
  late final $ParallelsTable parallels = $ParallelsTable(this);
  late final $EquipmentsTable equipments = $EquipmentsTable(this);
  late final $PriceListsTable priceLists = $PriceListsTable(this);
  late final $EquipmentListsTable equipmentLists = $EquipmentListsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $EquipmentPriceListsTable equipmentPriceLists =
      $EquipmentPriceListsTable(this);
  late final $AcademicManagementsTable academicManagements =
      $AcademicManagementsTable(this);
  late final $EquipmentListDetailsTable equipmentListDetails =
      $EquipmentListDetailsTable(this);
  late final $AnnotationsTable annotations = $AnnotationsTable(this);
  late final $AbsencesTable absences = $AbsencesTable(this);
  late final $EquipmentRequestsTable equipmentRequests =
      $EquipmentRequestsTable(this);
  late final $EquipmentRequestDetailsTable equipmentRequestDetails =
      $EquipmentRequestDetailsTable(this);
  late final $LicenseRequestsTable licenseRequests =
      $LicenseRequestsTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $GradesSubjectsTable gradesSubjects = $GradesSubjectsTable(this);
  late final TypeDao typeDao = TypeDao(this as AppDatabase);
  late final NewDao newDao = NewDao(this as AppDatabase);
  late final NewImageDao newImageDao = NewImageDao(this as AppDatabase);
  late final NotificationDao notificationDao =
      NotificationDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final GradeDao gradeDao = GradeDao(this as AppDatabase);
  late final ParallelDao parallelDao = ParallelDao(this as AppDatabase);
  late final EquipmentDao equipmentDao = EquipmentDao(this as AppDatabase);
  late final PriceListDao priceListDao = PriceListDao(this as AppDatabase);
  late final EquipmentListDao equipmentListDao =
      EquipmentListDao(this as AppDatabase);
  late final StudentDao studentDao = StudentDao(this as AppDatabase);
  late final EquipmentPriceListDao equipmentPriceListDao =
      EquipmentPriceListDao(this as AppDatabase);
  late final AcademicManagementDao academicManagementDao =
      AcademicManagementDao(this as AppDatabase);
  late final EquipmentListDetailDao equipmentListDetailDao =
      EquipmentListDetailDao(this as AppDatabase);
  late final AnnotationDao annotationDao = AnnotationDao(this as AppDatabase);
  late final AbsenceDao absenceDao = AbsenceDao(this as AppDatabase);
  late final EquipmentRequestDao equipmentRequestDao =
      EquipmentRequestDao(this as AppDatabase);
  late final EquipmentRequestDetailDao equipmentRequestDetailDao =
      EquipmentRequestDetailDao(this as AppDatabase);
  late final LicenseRequestDao licenseRequestDao =
      LicenseRequestDao(this as AppDatabase);
  late final SubjectDao subjectDao = SubjectDao(this as AppDatabase);
  late final GradeSubjectDao gradeSubjectDao =
      GradeSubjectDao(this as AppDatabase);
  Selectable<StudentEquipmentListResult> studentEquipmentList(
      int studentId, int? year) {
    return customSelect(
        'SELECT equipments.id AS id, equipments.name AS name, equipments.short_name AS short_name, equipment_list_details.min_quantity AS min, equipment_list_details.max_quantity AS max, equipment_list_details.single_purchase AS single, equipment_price_lists.price AS price, academic_managements.id AS academic_management_id, equipment_lists.id AS equipment_list_id FROM equipments INNER JOIN equipment_list_details ON equipment_list_details.equipment_id = equipments.id INNER JOIN equipment_lists ON equipment_list_details.equipment_list_id = equipment_lists.id INNER JOIN academic_managements ON academic_managements.id = equipment_lists.academic_management_id INNER JOIN grades ON equipment_lists.grade_id = grades.id INNER JOIN students ON students.grade_id = grades.id INNER JOIN equipment_price_lists ON equipment_price_lists.equipment_id = equipments.id INNER JOIN price_lists ON equipment_price_lists.price_list_id = price_lists.id AND students.price_list_id = price_lists.id WHERE students.id = ?1 AND academic_managements.year = ?2',
        variables: [
          Variable<int>(studentId),
          Variable<int>(year)
        ],
        readsFrom: {
          equipments,
          equipmentListDetails,
          equipmentPriceLists,
          academicManagements,
          equipmentLists,
          grades,
          students,
          priceLists,
        }).map((QueryRow row) => StudentEquipmentListResult(
          id: row.read<int>('id'),
          name: row.readNullable<String>('name'),
          shortName: row.readNullable<String>('short_name'),
          min: row.readNullable<double>('min'),
          max: row.readNullable<double>('max'),
          single: row.readNullable<String>('single'),
          price: row.readNullable<double>('price'),
          academicManagementId: row.read<int>('academic_management_id'),
          equipmentListId: row.read<int>('equipment_list_id'),
        ));
  }

  Selectable<StudentHistoricalEquipmentRequestResult>
      studentHistoricalEquipmentRequest(
          int studentId, int? year, String state) {
    return customSelect(
        'SELECT equipments.id AS id, equipments.name AS name, SUM(equipment_request_details.quantity) AS quantity, equipment_request_details.price AS price, round(SUM(equipment_request_details.sub_total), 2) AS sub_total, equipment_list_details.min_quantity AS min, equipment_list_details.max_quantity AS max FROM equipment_requests INNER JOIN academic_managements ON academic_managements.id = equipment_requests.academic_management_id INNER JOIN students ON students.id = equipment_requests.student_id INNER JOIN equipment_request_details ON equipment_request_details.equipment_request_id = equipment_requests.id INNER JOIN equipments ON equipments.id = equipment_request_details.equipment_id INNER JOIN equipment_list_details ON equipment_list_details.equipment_id = equipments.id INNER JOIN equipment_lists ON equipment_lists.id = equipment_list_details.equipment_list_id INNER JOIN grades ON grades.id = equipment_lists.grade_id AND grades.id = students.grade_id WHERE students.id = ?1 AND academic_managements.year = ?2 AND equipment_requests.state != ?3 GROUP BY equipments.id',
        variables: [
          Variable<int>(studentId),
          Variable<int>(year),
          Variable<String>(state)
        ],
        readsFrom: {
          equipments,
          equipmentRequestDetails,
          equipmentListDetails,
          equipmentRequests,
          academicManagements,
          students,
          equipmentLists,
          grades,
        }).map((QueryRow row) => StudentHistoricalEquipmentRequestResult(
          id: row.read<int>('id'),
          name: row.readNullable<String>('name'),
          quantity: row.read<double>('quantity'),
          price: row.read<double>('price'),
          subTotal: row.read<double>('sub_total'),
          min: row.readNullable<double>('min'),
          max: row.readNullable<double>('max'),
        ));
  }

  Selectable<DetailEquipmentRequestResult> detailEquipmentRequest(
      int idRequest) {
    return customSelect(
        'SELECT equipment_request_details.id AS id, equipments.name AS name, equipment_request_details.quantity AS quantity, equipment_request_details.price AS price, equipment_request_details.sub_total AS subtotal FROM equipment_request_details INNER JOIN equipments ON equipment_request_details.equipment_id = equipments.id WHERE equipment_request_details.equipment_request_id = ?1',
        variables: [
          Variable<int>(idRequest)
        ],
        readsFrom: {
          equipmentRequestDetails,
          equipments,
        }).map((QueryRow row) => DetailEquipmentRequestResult(
          id: row.read<int>('id'),
          name: row.readNullable<String>('name'),
          quantity: row.read<double>('quantity'),
          price: row.read<double>('price'),
          subtotal: row.read<double>('subtotal'),
        ));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        types,
        news,
        newsImages,
        notifications,
        users,
        grades,
        parallels,
        equipments,
        priceLists,
        equipmentLists,
        students,
        equipmentPriceLists,
        academicManagements,
        equipmentListDetails,
        annotations,
        absences,
        equipmentRequests,
        equipmentRequestDetails,
        licenseRequests,
        subjects,
        gradesSubjects
      ];
}

class StudentEquipmentListResult {
  final int id;
  final String? name;
  final String? shortName;
  final double? min;
  final double? max;
  final String? single;
  final double? price;
  final int academicManagementId;
  final int equipmentListId;
  StudentEquipmentListResult({
    required this.id,
    this.name,
    this.shortName,
    this.min,
    this.max,
    this.single,
    this.price,
    required this.academicManagementId,
    required this.equipmentListId,
  });
}

class StudentHistoricalEquipmentRequestResult {
  final int id;
  final String? name;
  final double quantity;
  final double price;
  final double subTotal;
  final double? min;
  final double? max;
  StudentHistoricalEquipmentRequestResult({
    required this.id,
    this.name,
    required this.quantity,
    required this.price,
    required this.subTotal,
    this.min,
    this.max,
  });
}

class DetailEquipmentRequestResult {
  final int id;
  final String? name;
  final double quantity;
  final double price;
  final double subtotal;
  DetailEquipmentRequestResult({
    required this.id,
    this.name,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });
}
