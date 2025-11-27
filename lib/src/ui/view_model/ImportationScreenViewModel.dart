import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/AcademicManagementResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentPriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/GradesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ParallelsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/PriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/StudentsResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:drift/drift.dart';

class ImportationScreenViewModel extends BaseViewModel {
  ImportationScreenViewModel() : super();

  @override
  void dispose() {}

  importData(BuildContext context) async {
    EasyLoading.show(status: 'Importando datos...');
    Utils.isDialogActive = true;
    try {
      await _cleanTables();
      String entityId = await loginPreference.entityId;
      await _syncData(entityId, context);
      await EasyLoading.dismiss();
      Utils.isDialogActive = false;
      navigation.startNewsScreen(context);
    } catch (exception) {
      Utils.isDialogActive = false;
      await loginPreference.clearPreference();
      await EasyLoading.showError('Error importando datos',
          duration: Duration(seconds: 2));
      Future.delayed(Duration(seconds: 2), () {
        navigation.startLoginScreen(context);
      });
    }
  }

  Future _cleanTables() {
    return Future.wait([
      appDatabase.userDao.nukeTable(),
      appDatabase.gradeDao.nukeTable(),
      appDatabase.parallelDao.nukeTable(),
      appDatabase.equipmentDao.nukeTable(),
      appDatabase.priceListDao.nukeTable(),
      appDatabase.equipmentListDao.nukeTable(),
      appDatabase.equipmentListDetailDao.nukeTable(),
      appDatabase.studentDao.nukeTable(),
      appDatabase.equipmentPriceListDao.nukeTable(),
      appDatabase.academicManagementDao.nukeTable(),
      appDatabase.notificationDao.nukeTable(),
      appDatabase.equipmentRequestDetailDao.nukeTable(),
      appDatabase.equipmentRequestDao.nukeTable(),
    ]);
  }

  _syncData(String entityId, BuildContext context) async {
    var grades = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.grades(entityId)))
        .body!
        .data!;
    var parallels = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.parallels(entityId)))
        .body!
        .data!;
    var equipments = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.equipments(entityId)))
        .body!
        .data!;
    var priceLists = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.priceLists(entityId)))
        .body!
        .data!;
    var equipmentLists = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.equipmentLists(entityId)))
        .body!
        .data!;
    var students = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.students(entityId)))
        .body!
        .data!;
    var equipmentPriceLists = (await Utils.retryFuture(SyncConstants.ATTEMPTS,
            () => apiService.equipmentPriceLists(entityId)))
        .body!
        .data!;
    var academicManagement = (await Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.academicManagement()))
        .body!
        .data!;

    await _syncSaveInDatabase(
        grades.toList(),
        parallels.toList(),
        equipments.toList(),
        priceLists.toList(),
        equipmentLists.toList(),
        students.toList(),
        equipmentPriceLists.toList(),
        academicManagement);
  }

  _syncSaveInDatabase(
      List<GradesResponse> gradesResponseList,
      List<ParallelsResponse> parallelsResponseList,
      List<EquipmentsResponse> equipmentsResponseList,
      List<PriceListsResponse> priceListsResponseLists,
      List<EquipmentListsResponse> equipmentListsResponseLists,
      List<StudentsResponse> studentsResponseLists,
      List<EquipmentPriceListsResponse> equipmentPriceListsResponseLists,
      AcademicManagementResponse academicManagement) async {
    List<Insertable<Grade>> gradeList = [];
    gradesResponseList.forEach((element) {
      Insertable<Grade> gradeInsertable = GradesCompanion.insert(
          id: Value(element.id), name: Value(element.name));
      gradeList.add(gradeInsertable);
    });

    List<Insertable<Parallel>> parallelList = [];
    parallelsResponseList.forEach((element) {
      Insertable<Parallel> parallelInsertable = ParallelsCompanion.insert(
          id: Value(element.id), name: Value(element.name));
      parallelList.add(parallelInsertable);
    });

    List<Insertable<Equipment>> equipmentList = [];
    equipmentsResponseList.forEach((element) {
      Insertable<Equipment> equipmentInsertable = EquipmentsCompanion.insert(
          id: Value(element.id),
          name: Value(element.name),
          shortName: Value(element.shortName));
      equipmentList.add(equipmentInsertable);
    });

    List<Insertable<PriceList>> priceListList = [];
    priceListsResponseLists.forEach((element) {
      Insertable<PriceList> priceListInsertable = PriceListsCompanion.insert(
          id: Value(element.id), name: Value(element.name));
      priceListList.add(priceListInsertable);
    });

    List<Insertable<EquipmentList>> headerEquipmentList = [];
    List<Insertable<EquipmentListDetail>> detailEquipmentList = [];

    equipmentListsResponseLists.forEach((element) {
      var header = element.header;
      var headerEquipmentsListCompanion = EquipmentListsCompanion(
        id: Value(header.id),
        name: Value(header.name),
        state: Value(header.state),
        academicManagementId: Value(header.academicManagementId),
        gradeId: Value(header.gradeId),
        createdBy: Value(header.createdBy),
        createdAt: Value(header.createdAt),
        updatedAt: Value(header.updatedAt),
      );

      headerEquipmentList.add(headerEquipmentsListCompanion);
      element.details.forEach((item) {
        Insertable<EquipmentListDetail> equipmentListDetailInsertable =
            EquipmentListDetailsCompanion.insert(
          id: Value(item.id),
          singlePurchase: Value(item.singlePurchase),
          minQuantity: Value(double.parse(item.minQuantity)),
          maxQuantity: Value(double.parse(item.maxQuantity)),
          equipmentListId: Value(item.equipmentListId),
          equipmentId: Value(item.productId),
          createdBy: Value(item.createdBy),
          createdAt: Value(item.createdAt),
          updatedAt: Value(item.updatedAt),
        );
        detailEquipmentList.add(equipmentListDetailInsertable);
      });
    });

    List<Insertable<Student>> studentList = [];
    studentsResponseLists.forEach((element) {
      Insertable<Student> studentInsertable = StudentsCompanion.insert(
        id: Value(element.id),
        name: Value(element.name),
        erpCode: Value(element.erpCode),
        email: Value(element.email),
        invoiceName: Value(element.invoiceName),
        nit: Value(element.nit),
        state: Value(element.state),
        fatherId: Value(element.fatherId),
        gradeId: Value(element.gradeId),
        parallelId: Value(element.parallelId),
        priceListId: Value(element.priceListId),
        createdBy: Value(element.createdBy),
        createdAt: Value(element.createdAt),
        updatedAt: Value(element.updatedAt),
      );
      studentList.add(studentInsertable);
    });

    List<Insertable<EquipmentPriceList>> equipmentPriceListList = [];
    equipmentPriceListsResponseLists.forEach((element) {
      Insertable<EquipmentPriceList> equipmentPriceListInsertable =
          EquipmentPriceListsCompanion.insert(
        id: Value(element.id),
        priceListId: Value(element.priceListId),
        equipmentId: Value(element.productId),
        price: Value(double.parse(element.price)),
      );
      equipmentPriceListList.add(equipmentPriceListInsertable);
    });

    var academicManagementCompanion = AcademicManagementsCompanion(
      id: Value(academicManagement.id),
      year: Value(academicManagement.year),
      registrationStartDate: Value(academicManagement.registrationStartDate),
      registrationEndDate: Value(academicManagement.registrationEndDate),
      state: Value(academicManagement.state),
      createdBy: Value(academicManagement.createdBy),
      createdAt: Value(academicManagement.createdAt),
      updatedAt: Value(academicManagement.updatedAt),
    );

    await appDatabase.runInTransaction(() async {
      /*GRADES*/
      await appDatabase.gradeDao.insertAll(gradeList);

      /*PARALLELS*/
      await appDatabase.parallelDao.insertAll(parallelList);

      /*EQUIPMENTS*/
      await appDatabase.equipmentDao.insertAll(equipmentList);

      /*PRICE LISTS*/
      await appDatabase.priceListDao.insertAll(priceListList);

      /*EQUIPMENT LISTS*/
      await appDatabase.equipmentListDao.insertAll(headerEquipmentList);
      await appDatabase.equipmentListDetailDao.insertAll(detailEquipmentList);

      /*STUDENTS*/
      await appDatabase.studentDao.insertAll(studentList);

      /*EQUIPMENT PRICE LISTS*/
      await appDatabase.equipmentPriceListDao.insertAll(equipmentPriceListList);

      /*ACADEMIC MANAGEMENT*/
      await appDatabase.academicManagementDao
          .insertEntity(academicManagementCompanion);
    });
  }
}
