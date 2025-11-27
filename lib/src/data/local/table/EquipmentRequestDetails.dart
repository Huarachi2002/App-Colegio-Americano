import 'package:drift/drift.dart';

@DataClassName("EquipmentRequestDetail")
class EquipmentRequestDetails extends Table{
  IntColumn get id => integer()();
  RealColumn get quantity => real()();
  RealColumn get price => real()();
  RealColumn get subTotal => real().named('sub_total')();
  IntColumn get equipmentId => integer().named('equipment_id')();
  IntColumn get equipmentRequestId => integer().named('equipment_request_id')();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}