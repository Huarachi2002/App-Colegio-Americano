import 'package:drift/drift.dart';

@DataClassName("Student")
class Students extends Table {

  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get erpCode => text().named('erp_code').nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get invoiceName => text().named('invoice_name').nullable()();
  TextColumn get nit => text().nullable()();
  TextColumn get state => text().named('state').nullable()();
  IntColumn get fatherId => integer().named('father_id').nullable()();
  IntColumn get gradeId => integer().named('grade_id').nullable()();
  IntColumn get parallelId => integer().named('parallel_id').nullable()();
  IntColumn get priceListId => integer().named('price_list_id').nullable()();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

}