import 'dart:async';

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/LoginRequest.dart';
import 'package:colegio_americano/src/data/remote/response/AcademicManagementResponse.dart';
import 'package:colegio_americano/src/data/remote/response/HeaderEquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentPriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/GradesResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LoginResponse.dart';
import 'package:colegio_americano/src/data/remote/response/ParallelsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/PriceListsResponse.dart';
import 'package:colegio_americano/src/data/remote/response/StudentsResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:colegio_americano/src/ui/view_model/mixin/LoginPreferenceMixin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:drift/drift.dart';

class LoginScreenViewModel extends BaseViewModel with LoginPreferenceMixin {
  late StreamController<bool> _passwordStreamController;

  LoginScreenViewModel() : super() {
    _passwordStreamController = StreamController<bool>.broadcast();
  }

  Function(bool) get passwordStreamSink => _passwordStreamController.sink.add;

  Stream<bool> get passwordStream => _passwordStreamController.stream;

  @override
  void dispose() {
    _passwordStreamController.close();
  }

  doLogin(BuildContext context, String userName, String password) {
    Utils.getUniqueId().then((uuid) {
      LoginRequest request = LoginRequest((loginRequest) => loginRequest
        ..username = userName
        ..password = password
        ..deviceToken = uuid);

      EasyLoading.show(status: 'Verificando usuario...');
      Utils.retryFuture(SyncConstants.ATTEMPTS, () => apiService.login(request))
          .then((response) async {
        try {
          await saveLoginPreference(response.body!.data!);

          // login inscripciones
          String idFather = await loginPreference.entityId;
          final getFatherResponse = await Utils.retryFuture(
            SyncConstants.ATTEMPTS,
            () => apiService.getFatherCode(int.parse(idFather)),
          );
          if (getFatherResponse.isSuccessful) {
            loginPreference.setFatherErpCode(getFatherResponse.body!.data!);
            // Comentado: Módulo de licencias deshabilitado en esta versión
            // await Utils.issueToken();
          }

          await loginPreference.setLoggedIn(true);
          await EasyLoading.dismiss();
          // Importamos solo estudiantes para el módulo de pagos
          navigation.startImportationScreen(context);
        } catch (exception, stackTrace) {
          print('[LOGIN ERROR] Exception: $exception');
          print('[LOGIN ERROR] StackTrace: $stackTrace');
          await EasyLoading.dismiss();
          EasyLoading.showError('Datos incorrectos',
              duration: Duration(seconds: 2), dismissOnTap: true);
        }
      }).catchError((exception) async {
        await EasyLoading.dismiss();
        EasyLoading.showError('Datos incorrectos',
            duration: Duration(seconds: 2), dismissOnTap: true);
      });
    });
  }
}
