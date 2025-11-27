
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/Grades.dart';

import 'package:drift/drift.dart';

part 'GradeDao.g.dart';
@DriftAccessor(tables: [Grades])
class GradeDao extends DatabaseAccessor<AppDatabase>
    with _$GradeDaoMixin, BaseDao<Grades, Grade>{

  GradeDao(AppDatabase db):super(db);


  @override
  TableInfo<Grades, Grade> getTable() => grades;
}