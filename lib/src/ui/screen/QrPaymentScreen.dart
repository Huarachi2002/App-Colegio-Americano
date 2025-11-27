import 'dart:convert';
import 'dart:typed_data';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/remote/request/DebtInformationRequest.dart';
import 'package:colegio_americano/src/ui/view_model/QrPaymentScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/ui/widgets/RetryErrorMessageWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class QrPaymentScreen extends StatefulWidget {
  final int studentId;
  final String erpCode;
  final String businessName;
  final String nit;
  final String currency;
  final String documentType;
  final String complement;

  QrPaymentScreen(
      this.studentId, this.erpCode, this.businessName, this.nit, this.currency, this.documentType, this.complement);

  @override
  State<StatefulWidget> createState() => _QrPaymentScreenState();
}

class _QrPaymentScreenState extends State<QrPaymentScreen>
    with RootScreenMixin {
  QrPaymentScreenViewModel _viewModel = QrPaymentScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.generateQrCode(
        context, widget.erpCode, widget.businessName, widget.nit,widget.documentType, widget.complement, widget.currency );
  }

  @override
  void dispose() {
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context),
      body: _bodyContent(),
    );
  }

  _bodyContent() {
    return StreamBuilder(
      stream: _viewModel.stream,
      builder: (BuildContext context,
          AsyncSnapshot<RequestStatus<Tuple2<DebtInformationRequest, String>>>
          snapshot) {
        if (!snapshot.hasData) return FullScreenLoadingWidget();
        var request = snapshot.data!;
        if (request.state == RequestStatusEnum.LOADING)
          return FullScreenLoadingWidget();
        if (request.state == RequestStatusEnum.ERROR)
          return RetryErrorMessageWidget(() {}, request.messageId);
        var data = request.data;

        DebtInformationRequest debtInformation = data.item1;
        String qrCode = data.item2;

        return Container(
          padding: EdgeInsets.only(top: 20.0),
          child: ListView(
            children: [
              _qrImage(qrCode),
              _message(
                  'Para realizar el pago utilice la app de su banco preferido y escanee la imagen del codigo qr de la galeria.'),
              _cardOptions(
                  Icons.format_list_numbered, debtInformation.transactionId
              ),
              _cardOptions(Icons.person, debtInformation.debtorName),
              _cardOptions(
                  Icons.attach_money,
                  double.parse(_viewModel.amount).toStringAsFixed(2) + " " + _viewModel.currency
              ),
              _cardOptions(
                  Icons.info_outline,
                  "${widget.erpCode}, ${debtInformation.chargeDetail.paymentPeriod} ${debtInformation.chargeDetail.paymentConcept}"
              ),
            ],
          ),
        );
      },
    );
  }

  _qrImage(String qrCodeBase64) {
    var height = MediaQuery.of(context).size.height;
    double imageHeight = height * 0.35;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: SizedBox(
            height: imageHeight,
            width: imageHeight,
            child: _getImage(qrCodeBase64),
          ),
        ),
      ),
    );
  }

  _message(String message) {
    return Container(
      padding: EdgeInsets.only(left: 8.0, top: 15.0, bottom: 15.0, right: 8.0),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }

  _cardOptions(IconData icon, String text) {
    return Container(
      child: Card(
        elevation: 4,
        child: Container(
          padding:
          EdgeInsets.only(left: 8.0, top: 15.0, bottom: 15.0, right: 8.0),
          child: GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(icon, color: Colors.black54),
                Container(
                  margin: EdgeInsets.only(left: 2.0, right: 2.0),
                ),
                Expanded(
                  child: Text(
                    text,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  _getImage(String base64Code) {
    Uint8List bytes = Base64Decoder().convert(base64Code);
    return Image.memory(bytes);
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          onPressed: () =>
              _viewModel.navigation.startStudentPaymentScreen(context)),
      title: Text('Código QR'),
      actions: [
        StreamBuilder(
          stream: _viewModel.stream,
          builder: (BuildContext context,
              AsyncSnapshot<
                  RequestStatus<Tuple2<DebtInformationRequest, String>>>
              snapshot) {
            String? qrCode;
            if (snapshot.hasData) {
              var request = snapshot.data!;
              if (request.state == RequestStatusEnum.SUCCESS) {
                qrCode = request.data.item2;
              }
            }

            return Visibility(
              visible: qrCode != null,
              child: IconButton(
                tooltip: 'Guardar Imagen',
                icon: Icon(Icons.save),
                onPressed: () {
                  _viewModel.saveQrPayment(qrCode!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
