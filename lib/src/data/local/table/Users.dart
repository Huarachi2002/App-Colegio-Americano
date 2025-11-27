import 'package:drift/drift.dart';

@DataClassName("User")
class Users extends Table {

  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get entityType => text().named('entity_type').nullable()();
  IntColumn get entityId => integer().named('entity_id').nullable()();
  TextColumn get userType => text().named('user_type').nullable()();
  TextColumn get apiToken => text().named('api_token').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}