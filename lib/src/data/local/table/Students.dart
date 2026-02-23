import 'package:drift/drift.dart';

/// Tabla Students - Alineada con backend NestJS
/// Columnas eliminadas (obsoletas): invoiceName, nit, priceListId, createdBy
@DataClassName("Student")
class Students extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get erpCode => text().named('erp_code').nullable()();
  TextColumn get email => text().nullable()();
  IntColumn get state =>
      integer().named('state').nullable()(); // Cambiado a int
  IntColumn get fatherId => integer().named('father_id').nullable()();
  IntColumn get gradeId => integer().named('grade_id').nullable()();
  IntColumn get parallelId => integer().named('parallel_id').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
