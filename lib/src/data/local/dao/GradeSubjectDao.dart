import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/GradesSubjects.dart';

import 'package:drift/drift.dart';

part 'GradeSubjectDao.g.dart';
@DriftAccessor(tables: [GradesSubjects])
class GradeSubjectDao extends DatabaseAccessor<AppDatabase>
    with _$GradeSubjectDaoMixin, BaseDao<GradesSubjects, GradeSubject>{

  GradeSubjectDao(AppDatabase db):super(db);


  @override
  TableInfo<GradesSubjects, GradeSubject> getTable() => gradesSubjects;
}