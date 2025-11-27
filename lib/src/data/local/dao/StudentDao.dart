import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/pojo/StudentInformation.dart';
import 'package:colegio_americano/src/data/local/table/Grades.dart';
import 'package:colegio_americano/src/data/local/table/Parallels.dart';
import 'package:colegio_americano/src/data/local/table/Students.dart';

import 'package:drift/drift.dart';

part 'StudentDao.g.dart';

@DriftAccessor(tables: [Students, Grades, Parallels])
class StudentDao extends DatabaseAccessor<AppDatabase>
    with _$StudentDaoMixin, BaseDao<Students, Student> {
  StudentDao(AppDatabase db) : super(db);

  Stream<List<StudentInformation>> getStudentsInformationStream() {
    final query = select(students).join([
      innerJoin(grades, grades.id.equalsExp(students.gradeId)),
      innerJoin(parallels, parallels.id.equalsExp(students.parallelId))
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return StudentInformation(row.readTable(students),
            row.readTable(grades), row.readTable(parallels));
      }).toList();
    });
  }

  Stream<StudentInformation> getStudentInformationByErpCodeStream(
      String erpCode) {
    final query = select(students)
      ..where((students) => students.erpCode.equals(erpCode));

    final student = query.join([
      innerJoin(grades, grades.id.equalsExp(students.gradeId)),
      innerJoin(parallels, parallels.id.equalsExp(students.parallelId))
    ]);

    return student.map((row) {
      return StudentInformation(row.readTable(students), row.readTable(grades),
          row.readTable(parallels));
    }).watchSingle();
  }

  Future<Student> getStudentById(int id) {
    return (select(students)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  @override
  TableInfo<Students, Student> getTable() => students;
}
