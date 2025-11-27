import 'package:drift/drift.dart';

@DataClassName("GradeSubject")
class GradesSubjects extends Table{

  
  IntColumn get id => integer()();
  IntColumn get gradeId => integer().named('grade_id')();
  IntColumn get subjectId => integer().named('subject_id')();

  @override
  Set<Column> get primaryKey => {id};
}