import 'package:colegio_americano/src/data/local/pojo/StudentInformation.dart';
import 'package:colegio_americano/src/ui/widgets/CardInformation.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/StudentRequestViewModel.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/navigation/menu/DrawerMenu.dart';

class StudentRequestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentRequestScreenState();
}

class _StudentRequestScreenState extends State<StudentRequestScreen>
    with RootScreenMixin {
  StudentRequestViewModel _viewModel = StudentRequestViewModel();

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
      drawer: DrawerMenu(),
      body: _bodyContent(context),
    );
  }

  _bodyContent(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.appDatabase.studentDao.getStudentsInformationStream(),
      builder: (BuildContext context,
          AsyncSnapshot<List<StudentInformation>> snapshot) {
        if (!snapshot.hasData) return FullScreenLoadingWidget();
        var data = snapshot.data;
        if (data != null) {
          return Column(
            children: [
              CardInformation(
                  text: AppLocalizations.of(context)
                      .translate('info_view_request')),
              _listStudents(data)
            ],
          );
        } else {
          return FullScreenLoadingWidget();
        }
      },
    );
  }

  _listStudents(List<StudentInformation> studentInformationList) {
    return Expanded(
      flex: 6,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: studentInformationList.length,
          primary: false,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.all(4.0),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  StudentInformation student = studentInformationList[index];
                  _viewModel.navigation.startHistoricalScreen(
                      context,
                      student.student.id.toString(),
                      student.student.erpCode ?? "",
                      student.student.name ?? "",
                      student.grade?.name ?? "",
                      student.parallel?.name ?? "");
                },
                child: _cardStudent(studentInformationList[index]));
          }),
    );
  }

  _cardStudent(StudentInformation studentInformation) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(studentInformation.student.name ?? ""),
              subtitle: Text('Codigo: ' +
                  (studentInformation.student.erpCode ?? "")),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)
          .translate('menu_title_buying_materials')),
    );
  }
}
