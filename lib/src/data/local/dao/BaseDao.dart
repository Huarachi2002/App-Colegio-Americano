import 'package:colegio_americano/src/data/local/AppDatabase.dart';

import 'package:drift/drift.dart';

mixin BaseDao<T extends Table, E extends DataClass>
on DatabaseAccessor<AppDatabase> {
  Future<bool> updateEntity(Insertable<E> entity) =>
      update(this.getTable()).replace(entity);

  Future<int> deleteEntity(Insertable<E> entity) =>
      delete(this.getTable()).delete(entity);

  Future<int> insertEntity(Insertable<E> entity) =>
      into(this.getTable()).insert(entity);

  Future<int> nukeTable() => (delete(this.getTable())).go();

  Future<void> insertAll(List<Insertable<E>> entities) async {
    await batch((batch) {
      batch.insertAll(getTable(), entities);
    });
  }

  TableInfo<T, E> getTable();
}