import 'package:drift/drift.dart';

@DataClassName('EquipmentRequest')
class EquipmentRequests extends Table{
  IntColumn get id => integer()();
  TextColumn get erpCode => text().named('erp_code').nullable()();
  TextColumn get state => text()();
  TextColumn get date => text().nullable()();
  TextColumn get token => text().nullable()();
  RealColumn get total => real()();
  IntColumn get priceListId => integer().named('price_list_id')();
  IntColumn get equipmentListId => integer().named('equipment_list_id')();
  IntColumn get studentId => integer().named('student_id')();
  IntColumn get employeeId => integer().named('employee_id').nullable()();
  IntColumn get academicManagementId => integer().named('academic_management_id')();
  IntColumn get createdBy => integer().nullable()();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};
}