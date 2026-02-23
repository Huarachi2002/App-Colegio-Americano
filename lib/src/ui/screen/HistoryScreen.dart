import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';
import 'package:colegio_americano/src/ui/view_model/HistoryScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/ui/widgets/RetryErrorMessageWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final int studentId;
  final String erpCode;
  final String name;
  final String grade;
  final String parallel;

  HistoryScreen(
      this.studentId, this.erpCode, this.name, this.grade, this.parallel);

  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with RootScreenMixin {
  HistoryScreenViewModel _viewModel = new HistoryScreenViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.updateHistorical(
        widget.studentId.toString(), widget.erpCode.toString());
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
    return StreamBuilder(
      stream: _viewModel.stream,
      builder: (BuildContext context,
          AsyncSnapshot<RequestStatus<List<EquipmentRequest>>> snapshot) {
        if (!snapshot.hasData) return FullScreenLoadingWidget();
        var dataRequest = snapshot.data!;

        if (dataRequest.state == RequestStatusEnum.LOADING)
          return FullScreenLoadingWidget();

        if (dataRequest.state == RequestStatusEnum.ERROR)
          return RetryErrorMessageWidget(() {}, dataRequest.messageId);

        var data = dataRequest.data;

        return Column(
          children: [
            _cardInformationAnnotations(
                widget.name, widget.erpCode, widget.grade, widget.parallel),
            _listRequests(data)
          ],
        );
      },
    );
  }

  _listRequests(List<EquipmentRequest> requests) {
    return Expanded(
      flex: 6,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: requests.length,
        primary: false,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(4.0),
        itemBuilder: (BuildContext context, int index) {
          return _cardEquipmentRequest(requests[index]);
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
                'Codigo: ' +
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
          AppLocalizations.of(context)
              .translate('menu_title_request_historical'),
        ),
        actions: [
          StreamBuilder(
              stream: _viewModel.enableStream,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasError) return Container();
                if (!snapshot.hasData) return Container();
                if (!(snapshot.data ?? false)) return Container();
                return IconButton(
                  tooltip: 'Crear pedido',
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _viewModel.navigation.startEquipmentRequestScreen(
                        context,
                        widget.studentId.toString(),
                        widget.erpCode,
                        widget.name,
                        widget.grade,
                        widget.parallel);
                  },
                );
              }),
        ]);
  }

  _cardEquipmentRequest(EquipmentRequest request) {
    String erpCode =
        request.erpCode == null ? 'Sin código' : request.erpCode ?? "";
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(widget.grade),
              subtitle: Text('Codigo: ' +
                  erpCode +
                  '\nEstado: ' +
                  _convertState(request.state) +
                  '\nFecha: ' +
                  (request.date ?? "") +
                  '\nTotal: ' +
                  request.total.toStringAsFixed(2)),
              isThreeLine: true,
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: SccsColors.white,
                  backgroundColor: SccsColors.navyBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: SccsColors.navyBlue),
                  ),
                ),
                onPressed: () {
                  _viewModel.navigation
                      .startHistoricalDetailEquipmentRequestScreen(
                          context,
                          request.id.toString(),
                          widget.grade,
                          request.erpCode ?? 'Sin código',
                          _convertState(request.state),
                          (request.date ?? ""),
                          request.total.toStringAsFixed(2));
                },
                child: Text(
                  'Detalle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _convertState(String state) {
    switch (state) {
      case 'messages.general.order_state.annulled':
        return 'Anulado';
      case 'messages.general.order_state.processing':
        return 'Procesando';
      case 'messages.general.order_state.processed':
        return 'Procesado';
      case 'messages.general.order_state.cancellation_pending':
        return 'Pendiente de cancelación';
      case 'messages.general.order_state.error':
        return 'Error';
      case 'messages.general.order_state.cancellation_error':
        return 'Error en cancelación';
      case 'messages.general.order_state.closed':
        return 'Cerrado';
      default:
        return '';
    }
  }
}
