import 'package:drift/drift.dart';

@DataClassName("NewImage")
class NewsImages extends Table {

  IntColumn get id => integer()();
  TextColumn get path => text().nullable()();
  IntColumn get newId => integer().named('new_id')();

  @override
  Set<Column> get primaryKey => {id};
}