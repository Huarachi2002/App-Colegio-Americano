

import 'package:drift/drift.dart';

@DataClassName("EquipmentPriceList")
class EquipmentPriceLists extends Table {

  IntColumn get id => integer()();
  IntColumn get priceListId => integer().named('price_list_id').nullable()();
  IntColumn get equipmentId => integer().named('equipment_id').nullable()();
  RealColumn get price => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};

}
