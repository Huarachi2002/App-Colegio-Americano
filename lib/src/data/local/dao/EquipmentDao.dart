import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/Equipments.dart';

import 'package:drift/drift.dart';

part 'EquipmentDao.g.dart';
@DriftAccessor(tables: [Equipments])
class EquipmentDao extends DatabaseAccessor<AppDatabase>
    with _$EquipmentDaoMixin, BaseDao<Equipments, Equipment> {

  EquipmentDao(AppDatabase db):super(db);


  @override
  TableInfo<Equipments, Equipment> getTable() => equipments;
}