
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/Parallels.dart';

import 'package:drift/drift.dart';

part 'ParallelDao.g.dart';
@DriftAccessor(tables: [Parallels])
class ParallelDao  extends DatabaseAccessor<AppDatabase>
    with _$ParallelDaoMixin, BaseDao<Parallels, Parallel>{

  ParallelDao(AppDatabase db):super(db);


  @override
  TableInfo<Parallels, Parallel> getTable() => parallels;
}