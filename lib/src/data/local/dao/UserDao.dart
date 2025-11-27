import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/Users.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';

import 'package:drift/drift.dart';

part 'UserDao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase>
    with _$UserDaoMixin, BaseDao<Users, User>  {

  UserDao(AppDatabase db):super(db);


  @override
  TableInfo<Users, User> getTable() => users;
}