

import 'package:drift/drift.dart';

@DataClassName("EquipmentList")
class EquipmentLists extends Table {

  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get state => text().nullable()();
  IntColumn get academicManagementId => integer().named('academic_management_id').nullable()();
  IntColumn get gradeId => integer().named('grade_id').nullable()();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}