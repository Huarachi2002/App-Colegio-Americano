import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/NewsImages.dart';

import 'package:drift/drift.dart';

part 'NewImageDao.g.dart';

@DriftAccessor(tables: [NewsImages])
class NewImageDao extends DatabaseAccessor<AppDatabase>
    with _$NewImageDaoMixin, BaseDao<NewsImages, NewImage> {


  NewImageDao(AppDatabase db): super(db);

  Future<List<NewImage>> getNewImagesByIdAsFuture(int newId){
    return (select(newsImages)
      ..where((ni) => ni.newId.equals(newId)))
        .get();
  }

  Stream<List<NewImage>> getNewImagesByIdAsStream(int newId){
    return (select(newsImages)
      ..where((ni) => ni.newId.equals(newId)))
        .watch();
  }

  Stream<NewImage> getNewImageByIdAsStream(int newImageId){
    return (select(newsImages)
      ..where((n) => n.id.equals(newImageId)))
        .watchSingle();
  }

  @override
  TableInfo<NewsImages, NewImage> getTable() => newsImages;
}