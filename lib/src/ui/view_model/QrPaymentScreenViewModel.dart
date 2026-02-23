import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:colegio_americano/src/data/remote/request/StudentCodeRequest.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/ChargeDetailRequest.dart';
import 'package:colegio_americano/src/data/remote/request/DebtInformationRequest.dart';
import 'package:colegio_americano/src/data/remote/request/InvoiceDetailRequest.dart';
import 'package:colegio_americano/src/data/remote/request/QrGenerationRequest.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tuple/tuple.dart';
import 'package:built_collection/built_collection.dart';

class QrPaymentScreenViewModel extends BaseViewModel {
  bool isSaving = false;
  late StreamController<RequestStatus<Tuple2<DebtInformationRequest, String>>>
      _streamController;

  QrPaymentScreenViewModel() : super() {
    _streamController = StreamController<
        RequestStatus<Tuple2<DebtInformationRequest, String>>>.broadcast();
  }

  Function(RequestStatus<Tuple2<DebtInformationRequest, String>>)
      get streamSink => _streamController.sink.add;

  Stream<RequestStatus<Tuple2<DebtInformationRequest, String>>> get stream =>
      _streamController.stream;

  String currency = '';
  String amount = '';

  @override
  void dispose() {
    _streamController.close();
  }

  generateQrCode(
      BuildContext context,
      String erpCode,
      String businessName,
      String nit,
      String documentType,
      String complement,
      String currency) async {
    streamSink(RequestStatus.loadingState());
    try {
      StudentCodeRequest studentCodeRequest =
          StudentCodeRequest((b) => b..studentErpCode = erpCode);
      var response1 = await Utils.retryFuture(
          SyncConstants.ATTEMPTS, () => apiService.getDebt(studentCodeRequest));

      if (!response1.isSuccessful) throw "error";

      var exchangeRateResponse = await Utils.retryFuture(
          SyncConstants.ATTEMPTS, () => apiService.getExchangeRate());

      if (!exchangeRateResponse.isSuccessful) throw "error";

      double exchangeRate = double.parse(exchangeRateResponse.body!.data!);

      DebtInformationRequest debtInformationRequest = response1.body!.data!;

      ChargeDetailRequestBuilder chargeDetailRequestBuilder =
          ChargeDetailRequestBuilder();
      chargeDetailRequestBuilder.paymentPeriod =
          debtInformationRequest.chargeDetail.paymentPeriod;
      chargeDetailRequestBuilder.paymentConcept =
          debtInformationRequest.chargeDetail.paymentConcept;
      chargeDetailRequestBuilder.isInvoice =
          debtInformationRequest.chargeDetail.isInvoice;

      String paymentAmount = debtInformationRequest.chargeDetail.paymentAmount;

      String paymentDiscount =
          debtInformationRequest.chargeDetail.paymentDiscount;

      String paymentPenalty =
          debtInformationRequest.chargeDetail.paymentPenalty;

      chargeDetailRequestBuilder.paymentAmount = paymentAmount;

      chargeDetailRequestBuilder.paymentDiscount = paymentDiscount;

      chargeDetailRequestBuilder.paymentPenalty = paymentPenalty;

      InvoiceDetailRequestBuilder invoiceDetailRequestBuilder =
          InvoiceDetailRequestBuilder();
      invoiceDetailRequestBuilder.idGenerateInvoice =
          debtInformationRequest.invoiceDetail.idGenerateInvoice;
      invoiceDetailRequestBuilder.modifyInvoiceData =
          debtInformationRequest.invoiceDetail.modifyInvoiceData;
      invoiceDetailRequestBuilder.invoiceName = businessName;
      invoiceDetailRequestBuilder.nitCiFact = nit;
      invoiceDetailRequestBuilder.documentType = documentType;

      invoiceDetailRequestBuilder.complement = complement;

      DebtInformationRequestBuilder debtInformationRequestBuilder =
          DebtInformationRequestBuilder();
      debtInformationRequestBuilder.debtorName =
          debtInformationRequest.debtorName;

      debtInformationRequestBuilder.amount = currency == 'BOB'
          ? debtInformationRequest.amount
          : _convertWithExchangeRate(
              debtInformationRequest.amount, exchangeRate);

      //debtInformationRequestBuilder.transactionId =  "${999000 + Random.secure().nextInt(200)}";
      debtInformationRequestBuilder.transactionId =
          debtInformationRequest.transactionId;
      debtInformationRequestBuilder.currency = currency;
      debtInformationRequestBuilder.processId =
          debtInformationRequest.processId;
      debtInformationRequestBuilder.invoiceDetail = invoiceDetailRequestBuilder;
      debtInformationRequestBuilder.chargeDetail = chargeDetailRequestBuilder;

      QrGenerationRequestBuilder builder = QrGenerationRequestBuilder();
      builder.erpCode = erpCode;
      builder.debtInformation = debtInformationRequestBuilder;

      var response2 = await Utils.retryFuture(SyncConstants.ATTEMPTS,
          () => apiService.generateQrPayment(builder.build()));

      if (!response2.isSuccessful) throw "error";

      String qrCode = response2.body!.data!;
      if (qrCode == null) throw Exception();
      Tuple2<DebtInformationRequest, String> tuple =
          Tuple2(debtInformationRequest, qrCode);
      this.currency = currency;
      this.amount = debtInformationRequestBuilder.amount!;
      streamSink(RequestStatus.successState(tuple));
      saveQrPayment(qrCode);
    } catch (exception) {
      streamSink(RequestStatus.errorState(
          AppLocalizations.of(context).translate('retry_payment_message')));
    }
  }

  Future<void> saveQrPayment(String qrCode) async {
    if (isSaving) return;

    isSaving = true;

    try {
      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        int sdkInt = androidInfo.version.sdkInt;

        PermissionStatus status;
        if (sdkInt >= 33) {
          status = await Permission.photos.request();
        } else {
          status = await Permission.storage.request();
        }

        if (!status.isGranted) {
          if (status.isPermanentlyDenied) {
            EasyLoading.showInfo(
                'Se requieren permisos para guardar imágenes. Por favor actívalos en Configuración.',
                duration: Duration(seconds: 5),
                dismissOnTap: true);
          } else {
            EasyLoading.showInfo('Permiso denegado para guardar el código QR.',
                duration: Duration(seconds: 3), dismissOnTap: true);
          }
          isSaving = false;
          return;
        }
      }

      await _saveQrCode(qrCode);
    } catch (e) {
      print("Error solicitando permisos: $e");
      EasyLoading.showError('Error al guardar el QR: $e',
          duration: Duration(seconds: 3), dismissOnTap: true);
      isSaving = false;
    }
  }

  Future<void> _saveQrCode(String base64Code) async {
    try {
      if (base64Code != null) {
        if (isSaving) {
          String newName =
              "QR" + DateTime.now().millisecondsSinceEpoch.toString();
          Uint8List bytes = Base64Decoder().convert(base64Code);
          String dir = (await getApplicationDocumentsDirectory()).path;
          String fullPath = '$dir/$newName.png';
          File file = File(fullPath);
          await file.writeAsBytes(bytes);
          final result = await ImageGallerySaverPlus.saveImage(bytes);
          isSaving = false;
          final isSuccess = result["isSuccess"];
          if (!isSuccess) throw 1;
          EasyLoading.showSuccess('Código QR guardado en galeria.',
              duration: Duration(seconds: 10), dismissOnTap: true);
        }
      }
    } catch (exception) {
      isSaving = false;
      EasyLoading.showError('No se pudo guardar el código QR en galeria',
          duration: Duration(seconds: 5), dismissOnTap: true);
    }
  }

  String _convertWithExchangeRate(String amount, double exchangeRate) {
    double value = double.parse(amount);
    return (value * exchangeRate).toStringAsFixed(6);
  }
}
