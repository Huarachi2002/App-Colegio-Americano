

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentPriceLists.dart';

import 'package:drift/drift.dart';

part 'EquipmentPriceListDao.g.dart';
@DriftAccessor(tables: [EquipmentPriceLists])
class EquipmentPriceListDao extends DatabaseAccessor<AppDatabase>
    with _$EquipmentPriceListDaoMixin, BaseDao<EquipmentPriceLists, EquipmentPriceList>{

  EquipmentPriceListDao(AppDatabase db):super(db);

  @override
  TableInfo<EquipmentPriceLists, EquipmentPriceList> getTable() => equipmentPriceLists;
}