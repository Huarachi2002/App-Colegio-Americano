import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/LicenseRequests.dart';

import 'package:drift/drift.dart';

part 'LicenseRequestDao.g.dart';

@DriftAccessor(tables: [LicenseRequests])
class LicenseRequestDao extends DatabaseAccessor<AppDatabase>
    with _$LicenseRequestDaoMixin, BaseDao<LicenseRequests, LicenseRequest> {
  LicenseRequestDao(AppDatabase db) : super(db);

  Stream<List<LicenseRequest>> getLicenseRequestsByStudentCode(
      String studentCode) {
    print(studentCode);
    return (select(licenseRequests)
          ..where(
            (lr) => lr.studentCode.equals(studentCode),
          ))
        .watch();
  }

  @override
  TableInfo<LicenseRequests, LicenseRequest> getTable() => licenseRequests;
}
