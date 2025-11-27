import 'package:drift/drift.dart';

@DataClassName("Notification")
class Notifications extends Table {
  IntColumn get id => integer()();
  IntColumn get code => integer().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get message => text().nullable()();
  TextColumn get url => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}