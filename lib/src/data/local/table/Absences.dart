

import 'package:drift/drift.dart';

@DataClassName("Absence")
class Absences extends Table {

  IntColumn get id => integer()();
  TextColumn get date => text().nullable()();
  IntColumn get startTime => integer().named('start_time').nullable()();
  IntColumn get endTime => integer().named('end_time').nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get time => integer().nullable()();
  TextColumn get absenceGroup => text().named('absence_group').nullable()();
  IntColumn get studentId => integer().named('student_id').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

}