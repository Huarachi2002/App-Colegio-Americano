import 'package:drift/drift.dart';

@DataClassName("New")
class News extends Table{

  IntColumn get id => integer()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get path => text().nullable()();
  BoolColumn get notifiable => boolean().nullable()();
  TextColumn get state => text().nullable()();
  IntColumn get newsTypeId => integer().named('news_type_id').nullable()();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

