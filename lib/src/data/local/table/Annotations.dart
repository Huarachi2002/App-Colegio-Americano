import 'package:drift/drift.dart';

@DataClassName("Annotation")
class Annotations extends Table {

  IntColumn get id => integer()();
  TextColumn get date => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get subject => text().nullable()();
  TextColumn get description => text().named('text').nullable()();
  IntColumn get studentId => integer().named('student_id').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}