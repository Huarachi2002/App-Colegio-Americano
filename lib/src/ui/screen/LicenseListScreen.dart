import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';
import 'package:colegio_americano/src/ui/view_model/LicenseListScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/ui/widgets/RetryErrorMessageWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LicenseListScreen extends StatefulWidget {
  final int studentId;
  final String erpCode;
  final String name;
  final String grade;
  final String parallel;

  const LicenseListScreen(
      this.studentId, this.erpCode, this.name, this.grade, this.parallel,
      {Key? key})
      : super(key: key);

  @override
  _LicenseListScreenState createState() => _LicenseListScreenState();
}

class _LicenseListScreenState extends State<LicenseListScreen>
    with RootScreenMixin {
  LicenseListScreenViewModel _viewModel = new LicenseListScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.getLicenses(context, widget.erpCode);
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
      stream: _viewModel.licensesStream,
      builder: (BuildContext context,
          AsyncSnapshot<RequestStatus<List<LicenseListResponse>>> snapshot) {
        if (!snapshot.hasData) return FullScreenLoadingWidget();
        var data = snapshot.data!;
        if (data.state == RequestStatusEnum.LOADING)
          return FullScreenLoadingWidget();
        if (data.state == RequestStatusEnum.ERROR)
          return RetryErrorMessageWidget(
            () => _viewModel.getLicenses(context, widget.erpCode),
            AppLocalizations.of(context)
                .translate("retry_license_requests_message"),
          );

        if (data.data.isEmpty)
          return RetryErrorMessageWidget(
              () => _viewModel.getLicenses(context, widget.erpCode),
              AppLocalizations.of(context)
                  .translate('no_license_requests_message'));
        return Column(
          children: [
            _cardInformationAnnotations(
              widget.name,
              widget.erpCode,
              widget.grade,
              widget.parallel,
            ),
            _listRequests(data.data)
          ],
        );
      },
    );
  }

  _listRequests(List<LicenseListResponse> requests) {
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
          return _cardLicenseRequest(requests[index]);
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

  _cardLicenseRequest(LicenseListResponse request) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final DateFormat hourFormatter = DateFormat.Hm();
    final String formatted = formatter.format(request.date!.toLocal());
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Fecha de registro: $formatted'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Hora: ${hourFormatter.format(request.date!.toLocal())}'),
                  Text(
                      'Duración: ${request.quantityPeriod} ${SyncConstants.LICENSE_PERIODS[request.licensePeriod! - 1]}(s)'),
                  Text(
                    'Tipo: ${SyncConstants.LICENSE_TYPES[request.licenseType! - 1]}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text('Estado: ${request.status}'),
                ],
              ),
              isThreeLine: true,
              onTap: () {
                _viewModel.navigation.startLicenseScreen(
                    context,
                    widget.studentId,
                    widget.erpCode,
                    widget.name,
                    widget.grade,
                    widget.parallel,
                    request);
              },
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
        AppLocalizations.of(context).translate('menu_title_license_list'),
      ),
      actions: [
        StreamBuilder(
          stream: _viewModel.enabledStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            bool enabled = false;
            if (!snapshot.hasError && snapshot.hasData)
              enabled = snapshot.data!;
            if (!enabled) return Container();
            return IconButton(
              tooltip: 'Nueva licencia',
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                _viewModel.navigation.startLicenseScreen(
                    context,
                    widget.studentId,
                    widget.erpCode,
                    widget.name,
                    widget.grade,
                    widget.parallel,
                    null);
              },
            );
          },
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    Locale locale = Localizations.localeOf(context);
    final DateFormat formatter = DateFormat.yMd(locale.toString()).add_jm();
    final String formatted = formatter.format(date);
    return formatted;
  }
}
