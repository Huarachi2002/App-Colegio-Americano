import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/Subjects.dart';

import 'package:drift/drift.dart';

part 'SubjectDao.g.dart';
@DriftAccessor(tables: [Subjects])
class SubjectDao extends DatabaseAccessor<AppDatabase>
    with _$SubjectDaoMixin, BaseDao<Subjects, Subject>{

  SubjectDao(AppDatabase db):super(db);


  @override
  TableInfo<Subjects, Subject> getTable() => subjects;
}