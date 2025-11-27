import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentRequests.dart';

import 'package:drift/drift.dart';

part 'EquipmentRequestDao.g.dart';

@DriftAccessor(tables: [EquipmentRequests])
class EquipmentRequestDao extends DatabaseAccessor<AppDatabase>
    with
        _$EquipmentRequestDaoMixin,
        BaseDao<EquipmentRequests, EquipmentRequest> {
  EquipmentRequestDao(AppDatabase db) : super(db);

  Future<List<EquipmentRequest>> getHeadersByStudentFuture(int studentId) {
    return (select(equipmentRequests)
          ..where((eqr) => eqr.studentId.equals(studentId)))
        .get();
  }

  @override
  TableInfo<EquipmentRequests, EquipmentRequest> getTable() =>
      equipmentRequests;
}
