import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/local/pojo/AbsencesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/AnnotationsAndAbsencesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/AnnotationsPojo.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/data/local/pojo/ChildrensPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/InformationsPojo.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';
import 'package:colegio_americano/src/ui/view_model/AnnotationsScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AnnotationsScreen extends StatefulWidget {
  final int studentId;
  final String studentErpCode;
  final String studentName;
  final String grade;
  final String parallel;

  AnnotationsScreen(this.studentId, this.studentErpCode, this.studentName,
      this.grade, this.parallel);

  @override
  State<StatefulWidget> createState() => _AnnotationsScreenState();
}

class _AnnotationsScreenState extends State<AnnotationsScreen>
    with RootScreenMixin {
  AnnotationsScreenViewModel _viewModel = AnnotationsScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.getAnnotation(context, widget.studentErpCode, widget.studentId);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Future.value(''),
      initialData: '',
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return _getScaffold(context, snapshot.data != '');
      },
    );
  }

  _getScaffold(BuildContext context, bool bool) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context),
      body: _bodyContent(context),
    );
  }

  _bodyContent(BuildContext context) {
    return Column(
      children: <Widget>[
        _cardInformationAnnotations(),
        _listAnnotations(),
      ],
    );
  }

  _listAnnotations() {
    return Expanded(
      flex: 6,
      child: Container(
        child: StreamBuilder(
            initialData:
                RequestStatus<AnnotationsAndAbsencesPojo>.loadingState(),
            stream: _viewModel.annotationsStream,
            builder: (BuildContext context,
                AsyncSnapshot<RequestStatus<AnnotationsAndAbsencesPojo>>
                    snapshot) {
              if (!snapshot.hasData) return FullScreenLoadingWidget();
              var requestStatus = snapshot.data!;
              switch (requestStatus.state) {
                case RequestStatusEnum.LOADING:
                  return FullScreenLoadingWidget();
                case RequestStatusEnum.SUCCESS:
                  var data = requestStatus.data;
                  return ListView(
                    children: [
                      _annotations(data.annotations),
                      _absences(data.absences),
                    ],
                  );
                default:
                  return FullScreenLoadingWidget();
              }
            }),
      ),
    );
  }

  _annotations(AnnotationsPojo annotations) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        ExpansionTile(
            leading: Icon(
              Icons.assignment_outlined,
              color: Colors.black,
            ),
            title: Text(
              annotations.name,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            children: _expansionChildren(annotations.children))
      ],
    );
  }

  _absences(AbsencesPojo absences) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        ExpansionTile(
            leading: Icon(
              Icons.alarm,
              color: Colors.black,
            ),
            title: Text(
              absences.name,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            children: _expansionChildren(absences.children))
      ],
    );
  }

  _expansionChildren(List<ChildrensPojo> children) {
    List<Widget> list = [];
    for (var i = 0; i < children.length; i++) {
      Widget expansion = ExpansionTile(
          title: Text(
            children[i].name,
            style: TextStyle(color: Colors.black),
          ),
          children: _listTileInformation(children[i].children));
      list.add(expansion);
    }

    return list;
  }

  _listTileInformation(List<InformationsPojo> informations) {
    List<Widget> list = [];
    for (var i = 0; i < informations.length; i++) {
      Widget listTile = ListTile(
        title: Html(
          data: informations[i].title,
        ),
        subtitle: Html(
          data: informations[i].information,
        ),
      );
      list.add(listTile);
    }
    return list;
  }

  _cardInformationAnnotations() {
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
                widget.studentName,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              subtitle: Text(
                  'Codigo: ' +
                      widget.studentErpCode,
                  style: TextStyle(fontSize: 15.0, color: Colors.white)),
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
      title: Text(AppLocalizations.of(context)
          .translate('menu_title_annotations_assists')),
    );
  }
}
