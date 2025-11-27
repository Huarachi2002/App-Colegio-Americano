import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/PriceLists.dart';

import 'package:drift/drift.dart';

part 'PriceListDao.g.dart';
@DriftAccessor(tables: [PriceLists])
class PriceListDao extends DatabaseAccessor<AppDatabase>
    with _$PriceListDaoMixin, BaseDao<PriceLists, PriceList>{

  PriceListDao(AppDatabase db):super(db);

  @override
  TableInfo<PriceLists, PriceList> getTable() => priceLists;
}