

import 'package:drift/drift.dart';

@DataClassName("Grade")
class Grades extends Table{

  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}