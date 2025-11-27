

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/pojo/AbsenceTypesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/LastAbsenceDatePojo.dart';
import 'package:colegio_americano/src/data/local/table/Absences.dart';
import 'package:colegio_americano/src/data/local/table/Annotations.dart';

import 'package:drift/drift.dart';

part 'AbsenceDao.g.dart';

@DriftAccessor(tables: [Absences])
class AbsenceDao extends DatabaseAccessor<AppDatabase>
    with _$AbsenceDaoMixin, BaseDao<Absences, Absence> {

  AbsenceDao(AppDatabase db):super(db);

  Future deleteAbsenceById(int studentId) {
    return (delete(absences)
      ..where((an) => an.studentId.equals(studentId)))
        .go();
  }

  Future<List<Absence>> getAbsencesByStudentIdAsFuture(int studentId){
    return (select(absences)
        ..where((ab) => ab.studentId.equals(studentId))
        ..orderBy([(ab) => OrderingTerm.desc(ab.id)])).get();
  }

  Future<List<AbsenceTypesPojo>> getAbsenceTypesByStudentIdAsFuture(int studentId){
    final query = selectOnly(absences,distinct: true)
      ..addColumns([absences.type])
      ..where(absences.studentId.equals(studentId));

    return query.map((row) {
      return AbsenceTypesPojo(row.rawData.data['absences.type']);
    }).get();
  }

  Future<LastAbsenceDatePojo> getLastAbsenceDateByStudentIdAsFuture(int studentId){
    final query = select(absences)
      ..limit(1)
      ..where((ab) => ab.studentId.equals(studentId))
      ..orderBy([(ab) => OrderingTerm.desc(ab.id)]);

    return query.map((row) {
      return LastAbsenceDatePojo(
          row.id,
          row.createdAt!
      );
    }).getSingle();
  }

  @override
  TableInfo<Absences, Absence> getTable() => absences;
}