import 'package:colegio_americano/src/data/local/dao/AbsenceDao.dart';
import 'package:colegio_americano/src/data/local/dao/AcademicManagementDao.dart';
import 'package:colegio_americano/src/data/local/dao/AnnotationDao.dart';
import 'package:colegio_americano/src/data/local/dao/EquipmentDao.dart';
import 'package:colegio_americano/src/data/local/dao/EquipmentListDao.dart';
import 'package:colegio_americano/src/data/local/dao/EquipmentListDetailDao.dart';
import 'package:colegio_americano/src/data/local/dao/EquipmentPriceListDao.dart';
import 'package:colegio_americano/src/data/local/dao/EquipmentRequestDao.dart';
import 'package:colegio_americano/src/data/local/dao/EquipmentRequestDetailDao.dart';
import 'package:colegio_americano/src/data/local/dao/GradeDao.dart';
import 'package:colegio_americano/src/data/local/dao/LicenseRequestDao.dart';
import 'package:colegio_americano/src/data/local/dao/NewDao.dart';
import 'package:colegio_americano/src/data/local/dao/NewImageDao.dart';
import 'package:colegio_americano/src/data/local/dao/NotificationDao.dart';
import 'package:colegio_americano/src/data/local/dao/ParallelDao.dart';
import 'package:colegio_americano/src/data/local/dao/PriceListDao.dart';
import 'package:colegio_americano/src/data/local/dao/StudentDao.dart';
import 'package:colegio_americano/src/data/local/dao/TypeDao.dart';
import 'package:colegio_americano/src/data/local/dao/UserDao.dart';
import 'package:colegio_americano/src/data/local/dao/SubjectDao.dart';
import 'package:colegio_americano/src/data/local/dao/GradeSubjectDao.dart';

import 'package:colegio_americano/src/data/local/table/Absences.dart';
import 'package:colegio_americano/src/data/local/table/AcademicManagements.dart';
import 'package:colegio_americano/src/data/local/table/Annotations.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentListDetails.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentLists.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentPriceLists.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentRequestDetails.dart';
import 'package:colegio_americano/src/data/local/table/EquipmentRequests.dart';
import 'package:colegio_americano/src/data/local/table/Equipments.dart';
import 'package:colegio_americano/src/data/local/table/LicenseRequests.dart';
import 'package:colegio_americano/src/data/local/table/News.dart';
import 'package:colegio_americano/src/data/local/table/NewsImages.dart';
import 'package:colegio_americano/src/data/local/table/Notifications.dart';
import 'package:colegio_americano/src/data/local/table/Parallels.dart';
import 'package:colegio_americano/src/data/local/table/PriceLists.dart';
import 'package:colegio_americano/src/data/local/table/Students.dart';
import 'package:colegio_americano/src/data/local/table/Types.dart';
import 'package:colegio_americano/src/data/local/table/Users.dart';
import 'package:colegio_americano/src/data/local/table/Grades.dart';
import 'package:colegio_americano/src/data/local/table/Subjects.dart';
import 'package:colegio_americano/src/data/local/table/GradesSubjects.dart';

import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

part 'AppDatabase.g.dart';

@DriftDatabase(
  tables: [
    Types,
    News,
    NewsImages,
    Notifications,
    Users,
    Grades,
    Parallels,
    Equipments,
    PriceLists,
    EquipmentLists,
    Students,
    EquipmentPriceLists,
    AcademicManagements,
    EquipmentListDetails,
    Annotations,
    Absences,
    EquipmentRequests,
    EquipmentRequestDetails,
    LicenseRequests,
    Subjects,
    GradesSubjects,
  ],
  daos: [
    TypeDao,
    NewDao,
    NewImageDao,
    NotificationDao,
    UserDao,
    GradeDao,
    ParallelDao,
    EquipmentDao,
    PriceListDao,
    EquipmentListDao,
    StudentDao,
    EquipmentPriceListDao,
    AcademicManagementDao,
    EquipmentListDetailDao,
    AnnotationDao,
    AbsenceDao,
    EquipmentRequestDao,
    EquipmentRequestDetailDao,
    LicenseRequestDao,
    SubjectDao,
    GradeSubjectDao,
  ],
  queries: {
    'studentEquipmentList':
        'SELECT equipments.id as id, equipments.name as name, equipments.short_name as short_name,equipment_list_details.min_quantity as min,equipment_list_details.max_quantity as max,equipment_list_details.single_purchase as single, equipment_price_lists.price as price,academic_managements.id as academic_management_id,equipment_lists.id as equipment_list_id FROM equipments INNER JOIN equipment_list_details ON equipment_list_details.equipment_id = equipments.id INNER JOIN equipment_lists ON equipment_list_details.equipment_list_id = equipment_lists.id INNER JOIN academic_managements ON academic_managements.id = equipment_lists.academic_management_id INNER JOIN grades ON equipment_lists.grade_id = grades.id INNER JOIN students ON students.grade_id = grades.id INNER JOIN equipment_price_lists ON equipment_price_lists.equipment_id = equipments.id INNER JOIN price_lists ON equipment_price_lists.price_list_id = price_lists.id AND students.price_list_id = price_lists.id WHERE students.id = :studentId AND academic_managements.year = :year',
    'studentHistoricalEquipmentRequest':
        'SELECT equipments.id as id, equipments.name as name, SUM(equipment_request_details.quantity) as quantity, equipment_request_details.price as price, round(SUM(equipment_request_details.sub_total), 2) as sub_total, equipment_list_details.min_quantity as min, equipment_list_details.max_quantity as max FROM equipment_requests INNER JOIN academic_managements ON academic_managements.id = equipment_requests.academic_management_id INNER JOIN students ON students.id = equipment_requests.student_id INNER JOIN equipment_request_details ON equipment_request_details.equipment_request_id = equipment_requests.id INNER JOIN equipments ON equipments.id = equipment_request_details.equipment_id INNER JOIN equipment_list_details ON equipment_list_details.equipment_id = equipments.id INNER JOIN equipment_lists ON equipment_lists.id = equipment_list_details.equipment_list_id INNER JOIN grades ON grades.id = equipment_lists.grade_id AND grades.id = students.grade_id WHERE students.id = :studentId AND academic_managements.year = :year AND equipment_requests.state != :state GROUP BY equipments.id',
    'detailEquipmentRequest':
        'SELECT equipment_request_details.id as id, equipments.name as name, equipment_request_details.quantity as quantity, equipment_request_details.price as price, equipment_request_details.sub_total as subtotal FROM equipment_request_details INNER JOIN equipments ON equipment_request_details.equipment_id = equipments.id WHERE equipment_request_details.equipment_request_id = :idRequest'
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future runInTransaction(Function function) {
    return transaction(() => function());
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.createTable(licenseRequests);
            await migrator.createTable(subjects);
            await migrator.createTable(gradesSubjects);
          }
        },
      );
}

QueryExecutor _openConnection() {
  return SqfliteQueryExecutor.inDatabaseFolder(path: 'conectate_app_test.db');
}
