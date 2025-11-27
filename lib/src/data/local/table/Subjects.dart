import 'package:drift/drift.dart';

@DataClassName("Subject")
class Subjects extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
