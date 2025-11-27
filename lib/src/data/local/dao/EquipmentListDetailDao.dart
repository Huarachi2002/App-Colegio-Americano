


import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentListDetails.dart';

import 'package:drift/drift.dart';

part 'EquipmentListDetailDao.g.dart';
@DriftAccessor(tables: [EquipmentListDetails])
class EquipmentListDetailDao extends DatabaseAccessor<AppDatabase>
    with _$EquipmentListDetailDaoMixin, BaseDao<EquipmentListDetails, EquipmentListDetail> {


  EquipmentListDetailDao(AppDatabase db):super(db);

  @override
  TableInfo<EquipmentListDetails, EquipmentListDetail> getTable() => equipmentListDetails;
}