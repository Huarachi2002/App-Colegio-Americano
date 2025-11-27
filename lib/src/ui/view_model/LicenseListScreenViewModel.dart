import 'dart:async';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/LicenseApiService.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/LicenseListRequest.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:drift/drift.dart';

class LicenseListScreenViewModel extends BaseViewModel {
  late BehaviorSubject<bool> _enabledStreamController;

  Stream<bool> get enabledStream => _enabledStreamController.stream;

  Function(bool) get enabledStreamSink => _enabledStreamController.sink.add;

  late BehaviorSubject<RequestStatus<List<LicenseListResponse>>>
      licensesStreamController;
  List<LicenseListResponse> _licensesList = [];

  LicenseListScreenViewModel() : super() {
    licensesStreamController = BehaviorSubject<RequestStatus<List<LicenseListResponse>>>();
    _enabledStreamController = BehaviorSubject<bool>();
  }

  Function(RequestStatus<List<LicenseListResponse>>) get licensesStreamSink =>
      licensesStreamController.sink.add;

  Stream<RequestStatus<List<LicenseListResponse>>> get licensesStream =>
      licensesStreamController.stream;

  @override
  void dispose() {
    licensesStreamController.close();
    _enabledStreamController.close();
  }

  Future<void> getLicenses(BuildContext context, String erpCode) async {
    // Consumo
    licensesStreamSink(RequestStatus.loadingState());
    try {
      LicenseListRequestBuilder body = LicenseListRequestBuilder();
      body.search = erpCode;
      body.position = 0;
      body.quantity = 50;

      var response = await Utils.retryFuture(
          SyncConstants.ATTEMPTS,
          () => licenseApiService.getLicenseList(body.build())
      );
      if(!response.isSuccessful) throw Exception();
      _licensesList = response.body!.toList();
      licensesStreamSink(RequestStatus.successState(_licensesList));
      await Future.delayed(Duration(milliseconds: 500));
      enabledStreamSink(true);
    } catch (e) {
      print('Error al obtener las licencias: $e');
      licensesStreamSink(RequestStatus.errorState(
          AppLocalizations.of(context).translate('retry_licenses_message'))); //'Error al obtener las licencias, por favor intente más tarde'
    }
  }
}
