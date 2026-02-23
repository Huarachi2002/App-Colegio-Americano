import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/StudentCodeRequest.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DebtResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

class DebtListScreenViewModel extends BaseViewModel {
  late BehaviorSubject<RequestStatus<DebtResponse>> _streamController;
  late BehaviorSubject<Tuple5<String, String, String, int, String>>
      _invoiceDataStreamController;
  String businessName = '';
  String nit = '';
  int documentType = 1;
  String complement = '';
  String currency = 'BOB';
  double exchangeRate = 0.0;

  DebtListScreenViewModel() : super() {
    _streamController = BehaviorSubject<RequestStatus<DebtResponse>>();
    _invoiceDataStreamController =
        BehaviorSubject<Tuple5<String, String, String, int, String>>();
  }

  Function(RequestStatus<DebtResponse>) get streamSink =>
      _streamController.sink.add;

  Stream<RequestStatus<DebtResponse>> get stream => _streamController.stream;

  Function(Tuple5<String, String, String, int, String>)
      get invoiceDataStreamSink => _invoiceDataStreamController.sink.add;

  Stream<Tuple5<String, String, String, int, String>> get invoiceDataStream =>
      _invoiceDataStreamController.stream;

  @override
  void dispose() {
    _streamController.close();
    _invoiceDataStreamController.close();
  }

  Future<void> getDebtList(BuildContext context, String erpCode) async {
    streamSink(RequestStatus.loadingState());
    try {
      // var statusResponse = await Utils.retryFuture(
      //     SyncConstants.ATTEMPTS, () => apiService.getDebtStatus(erpCode)
      // );
      // final state = statusResponse.body?.data ?? '';
      // if (state.contains('M')) {
      //   final message = statusResponse.body!.message;
      //   streamSink(RequestStatus.errorState(message));
      //   return;
      // }

      // Crear objeto StudentCodeRequest con el erpCode
      final studentCodeRequest =
          StudentCodeRequest((b) => b..studentErpCode = erpCode);

      var responseInvoice = await Utils.retryFuture(
          SyncConstants.ATTEMPTS, () => apiService.getDebt(studentCodeRequest));

      if (!responseInvoice.isSuccessful) throw 1;

      var invoiceData = responseInvoice.body!.data!.invoiceDetail;

      print("invoiceData DebListScreenViewModel: " + invoiceData.toString());

      var response = await Utils.retryFuture(SyncConstants.ATTEMPTS,
          () => apiService.getPendingDebts(studentCodeRequest));

      var data = response.body!.data;

      businessName = invoiceData.invoiceName ?? "";
      nit = invoiceData.nitCiFact ?? "";

      documentType = int.parse(invoiceData.documentType ?? "1");
      complement = invoiceData.complement ?? "";
      if (complement == "Sin comple") {
        complement = "";
      }

      if (data != null) {
        invoiceDataStreamSink(
            Tuple5(businessName, nit, currency, documentType, complement));
        await Future.delayed(Duration(milliseconds: 500));
        streamSink(RequestStatus.successState(data));
      } else {
        streamSink(RequestStatus.errorState('No tiene deudas pendientes'));
      }
    } catch (exception) {
      print('Error en getDebtList: $exception');
      streamSink(RequestStatus.errorState(
          AppLocalizations.of(context).translate('retry_debts_message')));
    }
  }

  updateInvoiceData(String? businessName, String? nit, String currency,
      int? documentType, String? complement) {
    if (businessName != null && businessName.isNotEmpty) {
      this.businessName = businessName;
    }
    if (nit != null && nit.isNotEmpty) {
      this.nit = nit;
    }

    this.currency = currency;
    if (documentType != null) {
      this.documentType = documentType;
    }
    if (complement != null && complement.isNotEmpty) {
      this.complement = complement;
    }
    invoiceDataStreamSink(Tuple5(this.businessName, this.nit, this.currency,
        this.documentType, this.complement));
  }

  updateCurrencyData(String currency) {
    this.currency = currency;
  }

  Future<ApiResponse<String>?> getDebtStatus(erpCode) async {
    try {
      var response = await apiService.getDebtStatus(erpCode);
      if (response.error != null) throw Exception('Error al recuperar');
      return response.body;
    } catch (e) {
      var apiResponse = ApiResponseBuilder<String>();
      apiResponse.data = '';
      apiResponse.code = -1;
      apiResponse.message = '';
      return apiResponse.build();
    }
  }
}
