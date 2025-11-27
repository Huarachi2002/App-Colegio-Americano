

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentLists.dart';

import 'package:drift/drift.dart';

part 'EquipmentListDao.g.dart';
@DriftAccessor(tables: [EquipmentLists])
class EquipmentListDao extends DatabaseAccessor<AppDatabase>
    with _$EquipmentListDaoMixin, BaseDao<EquipmentLists, EquipmentList> {

  EquipmentListDao(AppDatabase db):super(db);

  @override
  TableInfo<EquipmentLists, EquipmentList> getTable() => equipmentLists;
}