import 'package:drift/drift.dart';

@DataClassName("Type")
class Types extends Table{
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}