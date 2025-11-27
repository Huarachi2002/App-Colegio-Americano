

import 'package:drift/drift.dart';

@DataClassName("AcademicManagement")
class AcademicManagements extends Table {

  IntColumn get id => integer()();
  IntColumn get year => integer().nullable()();
  TextColumn get registrationStartDate => text().named('registration_start_date').nullable()();
  TextColumn get registrationEndDate => text().named('registration_end_date').nullable()();
  TextColumn get state => text().nullable()();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

}