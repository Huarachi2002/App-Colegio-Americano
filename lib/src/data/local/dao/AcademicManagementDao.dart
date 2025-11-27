import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/AcademicManagements.dart';

import 'package:drift/drift.dart';

part 'AcademicManagementDao.g.dart';

@DriftAccessor(tables: [AcademicManagements])
class AcademicManagementDao extends DatabaseAccessor<AppDatabase>
    with
        _$AcademicManagementDaoMixin,
        BaseDao<AcademicManagements, AcademicManagement> {
  AcademicManagementDao(AppDatabase db) : super(db);

  Future<AcademicManagement> getAcademicManagement() {
    return (select(academicManagements)
          ..where((tbl) =>
              tbl.state.equals('messages.general.entity_state.enable')))
        .getSingle();
  }

  @override
  TableInfo<AcademicManagements, AcademicManagement> getTable() =>
      academicManagements;
}
