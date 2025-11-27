import 'package:drift/drift.dart';

@DataClassName("Equipment")
class Equipments extends Table {

  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get shortName => text().named('short_name').nullable()();

  @override
  Set<Column> get primaryKey => {id};

}