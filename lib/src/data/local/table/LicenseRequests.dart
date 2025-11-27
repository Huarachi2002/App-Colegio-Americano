import 'package:drift/drift.dart';

@DataClassName("LicenseRequest")
class LicenseRequests extends Table {
  IntColumn get id => integer()();

  TextColumn get studentCode => text().named("student_code")();

  DateTimeColumn get date => dateTime()();

  DateTimeColumn get startDate => dateTime().named('start_date')();

  DateTimeColumn get endDate => dateTime().named('end_date')();

  TextColumn get status => text()();

  BoolColumn get test => boolean()();

  TextColumn get reason => text()();

  TextColumn get requesterName => text().named("requester_name")();

  IntColumn get requesterPhone => integer().named("requester_phone").nullable()();

  TextColumn get requesterEmail => text().named("requester_email").nullable()();

  TextColumn get attachment => text()();

  // Foreign keys

  IntColumn get studentId => integer().named('student_id')();

  IntColumn get gradeId => integer().named('grade_id')();

  IntColumn get parallelId => integer().named('parallel_id')();

  IntColumn get academicManagementId =>
      integer().named('academic_management_id')();

  IntColumn get subjectId => integer().named("subject_id")();

  @override
  Set<Column> get primaryKey => {id};
}
