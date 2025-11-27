import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentRequestDetails.dart';
import 'package:colegio_americano/src/data/local/table/Equipments.dart';

import 'package:drift/drift.dart';

part 'EquipmentRequestDetailDao.g.dart';

@DriftAccessor(tables: [EquipmentRequestDetails, Equipments])
class EquipmentRequestDetailDao extends DatabaseAccessor<AppDatabase> with  _$EquipmentRequestDetailDaoMixin, BaseDao<EquipmentRequestDetails, EquipmentRequestDetail>{

  EquipmentRequestDetailDao(AppDatabase db): super(db);

  @override
  TableInfo<EquipmentRequestDetails, EquipmentRequestDetail> getTable() => equipmentRequestDetails;
}