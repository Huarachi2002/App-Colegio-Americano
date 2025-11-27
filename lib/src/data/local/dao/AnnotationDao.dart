import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/pojo/AnnotationTypesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/LastAnnotationDatePojo.dart';
import 'package:colegio_americano/src/data/local/table/Annotations.dart';

import 'package:drift/drift.dart';

part 'AnnotationDao.g.dart';

@DriftAccessor(tables: [Annotations])
class AnnotationDao extends DatabaseAccessor<AppDatabase>
    with _$AnnotationDaoMixin, BaseDao<Annotations, Annotation> {

  AnnotationDao(AppDatabase db):super(db);

  Future deleteAnnotationById(int studentId) {
    return (delete(annotations)
      ..where((an) => an.studentId.equals(studentId)))
        .go();
  }

  Future<List<Annotation>> getAnnotationsByStudentIdAsFuture(int studentId){
    return (select(annotations)
      ..where((an) => an.studentId.equals(studentId))
      ..orderBy([(an) => OrderingTerm.desc(an.id)])).get();
  }

  Future<List<AnnotationTypesPojo>> getAnnotationTypesByStudentIdAsFuture(int studentId) {
    final query = selectOnly(annotations,distinct: true)
        ..addColumns([annotations.type])
        ..where(annotations.studentId.equals(studentId));

    return query.map((ele) {
      return AnnotationTypesPojo(ele.rawData.data['annotations.type']);
    }).get();
  }

  Future<LastAnnotationDatePojo> getLastAnnotationDateByStudentIdAsFuture(int studentId){
    final query = select(annotations)
        ..limit(1)
        ..where((an) => an.studentId.equals(studentId))
        ..orderBy([(an) => OrderingTerm.desc(an.id)]);

    return query.map((row) {
      return LastAnnotationDatePojo(
          row.id,
          row.createdAt!
      );
    }).getSingle();
  }

  @override
  TableInfo<Annotations, Annotation> getTable() => annotations;
}