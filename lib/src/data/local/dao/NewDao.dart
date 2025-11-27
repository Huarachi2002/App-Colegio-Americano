import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/News.dart';

import 'package:drift/drift.dart';

part 'NewDao.g.dart';

@DriftAccessor(tables: [News])
class NewDao extends DatabaseAccessor<AppDatabase>
    with _$NewDaoMixin, BaseDao<News, New> {


  NewDao(AppDatabase db):super(db);


  Stream<List<New>> getNewAsStream() =>
      (select(news)).watch();

  Future<List<New>> getNewAsFuture() =>
      (select(news)).get();

  Future<New> getNewByIdAsFuture(int newId){
    return (select(news)
      ..where((n) => n.id.equals(newId)))
        .getSingle();
  }

  Stream<New> getNewByIdAsStream(int newId){
    return (select(news)
      ..where((n) => n.id.equals(newId)))
        .watchSingle();
  }


  @override
  TableInfo<News, New> getTable() => news;
}