import 'package:colegio_americano/src/data/local/table/Types.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';

import 'package:drift/drift.dart';

part 'TypeDao.g.dart';

@DriftAccessor(tables: [Types])
class TypeDao extends DatabaseAccessor<AppDatabase>
    with _$TypeDaoMixin, BaseDao<Types, Type> {


  TypeDao(AppDatabase db):super(db);

  @override
  TableInfo<Types, Type> getTable() => types;
}