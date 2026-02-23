import 'dart:async';
import 'dart:convert';

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/model/EquipmentRequestModel.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/EquipmentRequest.dart'
    as prefix1;
import 'package:colegio_americano/src/data/remote/request/EquipmentRequestDetail.dart'
    as prefix0;
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EquipmentRequestScreenViewModel extends BaseViewModel {
  late StreamController<List<EquipmentRequestModel>> _streamController;
  late StreamController<List<StudentHistoricalEquipmentRequestResult>>
      _streamHistoricalController;

  List<EquipmentRequestModel> listModel = [];
  List<StudentHistoricalEquipmentRequestResult> listHistorical = [];

  EquipmentRequestScreenViewModel() : super() {
    _streamController =
        StreamController<List<EquipmentRequestModel>>.broadcast();
    _streamHistoricalController = StreamController<
        List<StudentHistoricalEquipmentRequestResult>>.broadcast();
  }

  Function(List<EquipmentRequestModel>) get streamSink =>
      _streamController.sink.add;

  Stream<List<EquipmentRequestModel>> get stream => _streamController.stream;

  Function(List<StudentHistoricalEquipmentRequestResult>)
      get streamSinkHistorical => _streamHistoricalController.sink.add;

  Stream<List<StudentHistoricalEquipmentRequestResult>> get streamHistorical =>
      _streamHistoricalController.stream;

  @override
  void dispose() {
    _streamController.close();
    _streamHistoricalController.close();
  }

  changeCheckBox(int index) {
    if (listModel.length > 0) {
      listModel[index].isSelected = !listModel[index].isSelected;
      if (listModel[index].isSelected) {
        listModel[index].quantity = 1;
      } else {
        listModel[index].quantity = 0;
      }
      streamSink(listModel);
    }
  }

  loadListModel(int studentId) async {
    streamSink(listModel);
    AcademicManagement academicManagement =
        await appDatabase.academicManagementDao.getAcademicManagement();
    List<StudentEquipmentListResult> equipmentList = await appDatabase
        .studentEquipmentList(studentId, academicManagement.year)
        .get();
    List<StudentHistoricalEquipmentRequestResult> historicalEquipmentRequest =
        await appDatabase
            .studentHistoricalEquipmentRequest(
                studentId,
                academicManagement.year,
                'messages.general.order_state.annulled')
            .get();

    List<EquipmentRequestModel> filteredResult = [];

    equipmentList.forEach((element) {
      StudentHistoricalEquipmentRequestResult? equipmentSearched =
          historicalEquipmentRequest.singleWhere((ele) => ele.id == element.id,
              orElse: () {
        return StudentHistoricalEquipmentRequestResult(
            id: 0, price: 0, quantity: 0, subTotal: 0);
      });

      bool isRegistrationInterval = _isRegistrationInterval(academicManagement);

      if (equipmentSearched.id == 0) {
        //Product wasn't bought
        EquipmentRequestModel model = EquipmentRequestModel();
        model.id = element.id;
        model.name = element.name!;
        model.quantity = element.min!;
        model.min = element.min!;
        model.max = element.max!;
        model.isSingle = element.single == 'Si';
        model.price = element.price!;
        model.isOptional = element.min == 0 ? true : false;
        model.isSelected = element.min == 0 ? false : true;
        model.equipmentListId = element.equipmentListId;
        model.isRegistrationInterval = isRegistrationInterval;
        filteredResult.add(model);
      } else {
        if (isRegistrationInterval) {
          if ((equipmentSearched.quantity ?? 0) < equipmentSearched.max! &&
              element.single == 'No') {
            var newMax =
                equipmentSearched.max! - (equipmentSearched.quantity ?? 0);
            EquipmentRequestModel model = EquipmentRequestModel();
            model.id = element.id;
            model.name = element.name!;
            model.price = element.price!;
            model.quantity = 0;
            model.min = 0;
            model.max = newMax.toDouble();
            model.isSingle = element.single == 'Si';
            model.isOptional = true;
            model.isSelected = false;
            model.equipmentListId = element.equipmentListId;
            model.isRegistrationInterval = isRegistrationInterval;
            filteredResult.add(model);
          }
        } else {
          if (element.single == 'No') {
            EquipmentRequestModel model = EquipmentRequestModel();
            model.id = element.id;
            model.name = element.name!;
            model.quantity = 0;
            model.isSingle = element.single == 'Si';
            model.price = element.price!;
            model.isOptional = true;
            model.isSelected = false;
            model.min = 0;
            model.max = 0;
            model.equipmentListId = element.equipmentListId;
            model.isRegistrationInterval = isRegistrationInterval;
            filteredResult.add(model);
          }
        }
      }
    });
    listModel = filteredResult;
    streamSink(listModel);
  }

  loadHistorical(int studentId) async {
    streamSinkHistorical(listHistorical);
    AcademicManagement academicManagement =
        await appDatabase.academicManagementDao.getAcademicManagement();

    List<StudentHistoricalEquipmentRequestResult> historicalEquipmentRequest =
        await appDatabase
            .studentHistoricalEquipmentRequest(
                studentId,
                academicManagement.year,
                'messages.general.order_state.annulled')
            .get();

    listHistorical = historicalEquipmentRequest;
    streamSinkHistorical(listHistorical);
  }

  bool _isRegistrationInterval(AcademicManagement academicManagement) {
    DateTime startDate = DateFormat('yyyy-MM-dd')
        .parse(academicManagement.registrationStartDate!);
    DateTime endDate =
        DateFormat('yyyy-MM-dd').parse(academicManagement.registrationEndDate!);

    DateTime current = DateTime.now();

    return startDate.isBefore(current) && endDate.isAfter(current);
  }

  sendRequest(BuildContext context, int studentId) async {
    List<EquipmentRequestModel> selected = [];

    listModel.forEach((element) {
      if (element.isSelected) {
        selected.add(element);
      }
    });

    if (selected.length > 0) {
      EasyLoading.show(status: 'Enviando...');

      Student student = await appDatabase.studentDao.getStudentById(studentId);
      AcademicManagement academicManagement =
          await appDatabase.academicManagementDao.getAcademicManagement();

      double total = _getTotal(selected);

      String base = DateTime.now().millisecondsSinceEpoch.toString() +
          total.toStringAsFixed(2);

      String token = sha256.convert(utf8.encode(base)).toString();

      var request = prefix1.EquipmentRequest(
        (equipmentRequest) => equipmentRequest
          ..date = ''
          ..total = total.toStringAsFixed(2)
          ..studentId = studentId.toString()
          ..priceListId = '' // Campo eliminado de Students, usar valor vacío
          ..token = token
          ..equipmentListId = selected[0].equipmentListId.toString()
          ..academicManagementId = academicManagement.id.toString()
          ..details = ListBuilder<prefix0.EquipmentRequestDetail>(
            selected.map((item) {
              return prefix0.EquipmentRequestDetail((line) => line
                ..subtotal = (item.quantity * item.price).toStringAsFixed(2)
                ..price = item.price.toStringAsFixed(2)
                ..productId = item.id.toString()
                ..quantity = item.quantity.toStringAsFixed(0));
            }),
          ),
      );

      try {
        var response = await Utils.retryFuture(SyncConstants.ATTEMPTS,
            () => apiService.saveEquipmentRequest(request));

        await EasyLoading.dismiss();
        if (response.body!.code == 1) {
          _showSendSuccessAlert(context);
        } else {
          await EasyLoading.showError(
              'No se pudo enviar el pedido, por favor intente más tarde.',
              duration: Duration(seconds: 4),
              dismissOnTap: true);
        }
      } catch (exception) {
        await EasyLoading.dismiss();
        await EasyLoading.showError(
            'No se pudo enviar el pedido, por favor intente más tarde.',
            duration: Duration(seconds: 4),
            dismissOnTap: true);
      }
    }
  }

  double _getTotal(List<EquipmentRequestModel> list) {
    double total = 0;
    list.forEach((element) {
      total += (element.price * element.quantity);
    });

    return double.parse(total.toStringAsFixed(2));
  }

  _showSendSuccessAlert(BuildContext context) {
    Utils.isDialogActive = true;
    Alert(
      context: context,
      type: AlertType.success,
      style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
      title: "Pedido",
      desc: "Su pedido se envió correctamente",
      buttons: [
        DialogButton(
          color: Colors.red,
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Utils.isDialogActive = false;
            navigation.startStudentRequestScreen(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}
