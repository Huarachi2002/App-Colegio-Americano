import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/HistoryDetailScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatefulWidget {
  final int idRequest;
  final String grade;
  final String erpCode;
  final String state;
  final String date;
  final String total;

  HistoryDetailScreen(this.idRequest, this.grade, this.erpCode, this.state,
      this.date, this.total);

  @override
  State<StatefulWidget> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen>
    with RootScreenMixin {
  HistoryDetailScreenViewModel _viewModel = HistoryDetailScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
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
    return FutureBuilder(
      future: _viewModel.appDatabase.detailEquipmentRequest(widget.idRequest).get(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DetailEquipmentRequestResult>> snapshot) {
        if (!snapshot.hasData) return FullScreenLoadingWidget();
        final data = snapshot.data!;
        if (data.length == 0) return FullScreenLoadingWidget();
        return ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _cardInformationAnnotations(widget.grade, widget.erpCode,
                  widget.state, widget.date, widget.total + ' USD');
            } else {
              return ListTile(
                title: Text(data[index - 1].name ?? ""),
                subtitle: Text(_generateItemText(
                    data[index - 1].price.toStringAsFixed(2),
                    data[index - 1].quantity.toStringAsFixed(0))),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Subtotal: ' +
                        snapshot.data![index - 1].subtotal.toStringAsFixed(2) +
                        ' USD')
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }

  _generateItemText(String price, String quantity) {
    String base = 'Precio: |price| USD\nCantidad: |quantity|';

    String result = base.replaceAll('|price|', price);
    result = result.replaceAll('|quantity|', quantity);

    return result;
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        alignment: Alignment.centerLeft,
        onPressed: () {
          _viewModel.navigation.navigateBack(context);
        },
      ),
      title: Text(
        AppLocalizations.of(context)
            .translate('menu_title_request_detail_historical'),
      ),
    );
  }

  _cardInformationAnnotations(
      String grade, String erpCode, String state, String date, String total) {
    return Container(
      child: Card(
        color: Colors.red,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                grade,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Codigo: ' +
                    erpCode +
                    '\nEstado: ' +
                    state +
                    '\nFecha: ' +
                    date +
                    '\nTotal: ' +
                    total,
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
}
