import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DebtDetailResponse.dart';
import 'package:colegio_americano/src/data/remote/response/DebtResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';
import 'package:colegio_americano/src/ui/view_model/DebtListScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/ui/widgets/RetryErrorMessageWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:tuple/tuple.dart';

class DebtListScreen extends StatefulWidget {
  final int studentId;
  final String erpCode;
  final String name;
  final String grade;
  final String parallel;

  DebtListScreen(
      this.studentId, this.erpCode, this.name, this.grade, this.parallel);

  @override
  State<StatefulWidget> createState() => _DebtListScreenState();
}

class _DebtListScreenState extends State<DebtListScreen> with RootScreenMixin {
  DebtListScreenViewModel _viewModel = DebtListScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.getDebtList(context, widget.erpCode);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(onBackPressed);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context),
      body: _bodyContent(context),
    );
  }

  _bodyContent(BuildContext context) {
    return Column(
      children: [
        _cardInformationAnnotations(
            widget.name, widget.erpCode, widget.grade, widget.parallel),
        StreamBuilder(
          stream: _viewModel.invoiceDataStream,
          builder: (BuildContext context,
              AsyncSnapshot<Tuple5<String, String, String, int, String>>
                  snapshot) {
            if (!snapshot.hasData)
              return Visibility(visible: false, child: Container());
            print("snapshot.data DebtListScreen: " + snapshot.data.toString());
            return _invoiceInformation(
                snapshot.data!.item1,
                snapshot.data!.item2,
                snapshot.data!.item3,
                snapshot.data!.item4,
                snapshot.data!.item5);
          },
        ),
        StreamBuilder(
          stream: _viewModel.stream,
          builder: (BuildContext context,
              AsyncSnapshot<RequestStatus<DebtResponse>> snapshot) {
            if (!snapshot.hasData) return FullScreenLoadingWidget();
            var dataRequest = snapshot.data!;

            if (dataRequest.state == RequestStatusEnum.LOADING)
              return FullScreenLoadingWidget();

            if (dataRequest.state == RequestStatusEnum.ERROR)
              return RetryErrorMessageWidget(() {}, dataRequest.messageId);

            var data = dataRequest.data;

            if (data == null)
              return RetryErrorMessageWidget(
                  () {},
                  AppLocalizations.of(context)
                      .translate('no_pending_debts_message'));

            return _listDebts(data.details.toList());
          },
        )
      ],
    );
  }

  _listDebts(List<DebtDetailResponse> list) {
    return Expanded(
      flex: 6,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        primary: false,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(4.0),
        itemBuilder: (BuildContext context, int index) {
          return _cardDebt(list[index], index);
        },
      ),
    );
  }

  _cardInformationAnnotations(
      String studentName, String erpCode, String grade, String parallel) {
    return Container(
      child: Card(
        color: SccsColors.navyBlue,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                studentName,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                AppLocalizations.of(context).translate('code_label') +
                    erpCode,

                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              isThreeLine: true,
              leading: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _invoiceInformation(String businessName, String nit, String currency,
      int documentType, String complement) {
    final documentTypes = [
      'CI - Cedula de Identidad',
      'CEX - Cedula de Extranjeria',
      'PAS - Pasaporte',
      'OD - Otro Documento',
      'NIT - Numero de Identificacion Tributaria'
    ];
    // Validar que documentType esté en rango válido (1-5), usar valor por defecto si es 0
    final int safeIndex = (documentType >= 1 && documentType <= 5)
        ? documentType - 1
        : 0; // Usar CI como valor por defecto
    final String documentTypeString = documentTypes[safeIndex];
    return Container(
      child: Card(
        color: SccsColors.navyBlue,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                'Razón Social: ' + businessName,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Numero de documento: ' + nit,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  Text(
                    'Tipo de Documento: ' + documentTypeString,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  Text(
                    'Complemento: ' + complement,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ],
              ),
              leading: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              trailing: GestureDetector(
                onTap: () {
                  _asyncInputDialog(context, businessName, nit, currency,
                          documentType, complement)
                      .then((value) {
                    if (value == null) return;
                    if (value.isNotEmpty) {
                      print("VALUE DebListScreen: " + value);
                      var stringAsArray = value.split("|");
                      String businessNameValue = stringAsArray[0];
                      String nitValue = stringAsArray[1];
                      String currencyValue = stringAsArray[2];
                      int documentTypeValue = int.parse(stringAsArray[3]);
                      String complementValue = stringAsArray[4];

                      print("Conversion Correcta: " +
                          businessNameValue +
                          " " +
                          nitValue +
                          " " +
                          currencyValue +
                          " " +
                          documentTypeValue.toString() +
                          " " +
                          complementValue);
                      _viewModel.updateInvoiceData(businessNameValue, nitValue,
                          currencyValue, documentTypeValue, complementValue);
                    }
                  });
                },
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cardDebt(DebtDetailResponse debtDetail, int index) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(debtDetail.debtConcept),
              subtitle: Text(
                AppLocalizations.of(context).translate('period_label') +
                    debtDetail.period +
                    '\n' +
                    AppLocalizations.of(context).translate('amount_label') +
                    double.parse(debtDetail.amount).toStringAsFixed(2),
              ),
              trailing: Visibility(
                visible: index == 0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: SccsColors.navyBlue,
                    backgroundColor: SccsColors.navyBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: SccsColors.navyBlue),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate('payment_label'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Utils.showConfirmAlert(
                        context,
                        AppLocalizations.of(context)
                            .translate('alert_payment_title'),
                        AppLocalizations.of(context)
                                .translate('alert_payment_description') +
                            'en BOB?',
                        AppLocalizations.of(context)
                            .translate('alert_accept_label'),
                        AppLocalizations.of(context)
                            .translate('alert_cancel_label'), () {
                      _viewModel.navigation.startQrPaymentScreen(
                        context,
                        widget.studentId.toString(),
                        widget.erpCode,
                        _viewModel.businessName,
                        _viewModel.nit,
                        _viewModel.currency,
                        _viewModel.documentType.toString(),
                        _viewModel.complement,
                      );
                    });
                  },
                ),
              ),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        alignment: Alignment.centerLeft,
        onPressed: () async {
          _viewModel.navigation.navigateBack(context);
        },
      ),
      title: Text(
        AppLocalizations.of(context).translate('menu_title_payment'),
      ),
    );
  }

  Future<String?> _asyncInputDialog(BuildContext context, String businessName,
      String nit, String currency, int documentType, String complement) async {
    Utils.isDialogActive = true;
    TextEditingController businessNameController = TextEditingController();
    TextEditingController nitController = TextEditingController();
    TextEditingController complementoController = TextEditingController();
    businessNameController.text = businessName;
    nitController.text = nit;
    String currencyValue = currency;
    int documentTypeValue = documentType;
    complementoController.text = complement;

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Datos de facturación'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: businessNameController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Razón Social'),
                ),
                TextField(
                  controller: nitController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Nit'),
                ),

                DropdownButtonFormField<int>(
                  value: documentTypeValue,
                  isExpanded: true, // Esto arregla el overflow horizontal
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  decoration: InputDecoration(
                      labelText: 'Tipo de Documento',
                      // isDense: true, // Hace el dropdown más compacto
                      contentPadding: EdgeInsets.symmetric(vertical: 8)),
                  items: [
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text('CI - Cedula de Identidad'),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text('CEX - Cedula de Extranjeria'),
                    ),
                    DropdownMenuItem<int>(
                      value: 3,
                      child: Text('PAS - Pasaporte'),
                    ),
                    DropdownMenuItem<int>(
                      value: 4,
                      child: Text('OD - Otro Documento'),
                    ),
                    DropdownMenuItem<int>(
                      value: 5,
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 250), // Forzar ancho máximo
                        child: Text(
                          'NIT - Numero de Identificacion Tributaria',
                          overflow: TextOverflow
                              .visible, // Permite que el texto sea visible completamente
                          softWrap: true, // Permite wrap de texto
                        ),
                      ),
                    ),
                  ],
                  onChanged: (int? newValue) {
                    setState(() {
                      documentTypeValue = newValue!;
                    });
                  },
                ),

                TextField(
                  controller: complementoController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Complemento'),
                ),

                // Container(
                //   height: 20,
                // ),
              ],
            );
          }),
          actions: [
            TextButton(
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Utils.isDialogActive = false;
                Navigator.of(context).pop('');
              },
            ),
            TextButton(
              child: Text(
                'Aceptar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Utils.isDialogActive = false;
                String b = businessNameController.text;
                String n = nitController.text;
                int d = documentTypeValue;
                String c = complementoController.text;
                Navigator.of(context).pop(b +
                    "|" +
                    n +
                    '|' +
                    currencyValue +
                    '|' +
                    d.toString() +
                    '|' +
                    c);
              },
            ),
          ],
        );
      },
    );
  }
}
