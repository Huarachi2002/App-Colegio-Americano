import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/StudentsResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:drift/drift.dart';

/// ImportationScreenViewModel - Versión simplificada
/// Solo importa estudiantes para el módulo de pagos
/// Alineado con backend NestJS
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
    } catch (exception, stackTrace) {
      print('[IMPORT ERROR] Exception: $exception');
      print('[IMPORT ERROR] StackTrace: $stackTrace');
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
    // Solo limpiamos las tablas necesarias para la versión simplificada
    return Future.wait([
      appDatabase.studentDao.nukeTable(),
    ]);
  }

  _syncData(String entityId, BuildContext context) async {
    print('[IMPORT] Sincronizando estudiantes para entityId: $entityId');

    var response = await Utils.retryFuture(
        SyncConstants.ATTEMPTS, () => apiService.students());

    print('[IMPORT] Response body: ${response.body}');

    if (response.body == null || response.body!.data == null) {
      print('[IMPORT] No hay estudiantes para importar');
      return;
    }

    var students = response.body!.data!;
    print('[IMPORT] Estudiantes recibidos: ${students.length}');

    // Guardamos estudiantes en la base de datos
    await _syncSaveStudentsInDatabase(students.toList());
  }

  _syncSaveStudentsInDatabase(
      List<StudentsResponse> studentsResponseLists) async {
    List<Insertable<Student>> studentList = [];

    studentsResponseLists.forEach((element) {
      print(
          '[IMPORT] Procesando estudiante: ${element.name} (${element.erpCode})');

      Insertable<Student> studentInsertable = StudentsCompanion.insert(
        id: Value(element.id),
        name: Value(element.name),
        erpCode: Value(element.erpCode),
        email: Value(element.email),
        state: Value(element.state),
        fatherId: Value(element.fatherId),
        gradeId: Value(element.gradeId),
        parallelId: Value(element.parallelId),
        createdAt: Value(element.createdAt),
        updatedAt: Value(element.updatedAt),
      );
      studentList.add(studentInsertable);
    });

    await appDatabase.runInTransaction(() async {
      await appDatabase.studentDao.insertAll(studentList);
    });

    print('[IMPORT] Estudiantes guardados en BD: ${studentList.length}');
  }
}
