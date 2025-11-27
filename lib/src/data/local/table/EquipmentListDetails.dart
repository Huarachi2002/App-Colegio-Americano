import 'package:drift/drift.dart';

@DataClassName("EquipmentListDetail")
class EquipmentListDetails extends Table {

  IntColumn get id => integer()();
  TextColumn get singlePurchase => text().named('single_purchase').nullable()();
  RealColumn get minQuantity => real().named('min_quantity').nullable()();
  RealColumn get maxQuantity => real().named('max_quantity').nullable()();
  IntColumn get equipmentListId => integer().named('equipment_list_id').nullable()();
  IntColumn get equipmentId => integer().named('equipment_id').nullable()();
  IntColumn get createdBy => integer().named('created_by').nullable()();
  TextColumn get createdAt => text().named('created_at').nullable()();
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

}
