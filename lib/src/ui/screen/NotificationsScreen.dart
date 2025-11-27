import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart' as notification;
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/menu/DrawerMenu.dart';
import 'package:colegio_americano/src/ui/view_model/NotificationsViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/ui/widgets/RetryErrorMessageWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with RootScreenMixin {

  NotificationsViewModel _viewModel = NotificationsViewModel();


  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.getNotifications(context);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context),
      drawer: DrawerMenu(),
      body: _bodyContent(),
    );
  }

  _bodyContent(){
    return StreamBuilder(
        stream: _viewModel.notificationsStream,
        builder: (BuildContext context,
            AsyncSnapshot<RequestStatus<List<NotificationResponse>>> snapshot){
          if (!snapshot.hasData) return FullScreenLoadingWidget();
          var response = snapshot.data!;
          if(response.state == RequestStatusEnum.LOADING) return FullScreenLoadingWidget();
          if(response.state == RequestStatusEnum.ERROR) return RetryErrorMessageWidget(() => {}, 'No se pudo obtener las notificaciones, por favor intente más tarde.');
          var list = response.data;
          if(list.length > 0){
            return RefreshIndicator(
              onRefresh: _getData,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          _viewModel.navigation.startNotificationScreen(context,list[index].id.toString());
                        },
                        child: _notificationsCard(list[index],context)
                    );
                  }
              ),
            );
          }else{
            return Center(
              child: Text(
                'Sin notificaciones para mostrar',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),
              ),
            );
          }
        });
  }

  _notificationsCard(NotificationResponse notification, BuildContext context){
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(removeAllHtmlTags(notification.message).substring(0, 30) + '...'),
        leading: getIcon(0),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Text(
          AppLocalizations.of(context).translate('menu_title_notifications')),
    );
  }

  Future<void> _getData() async {
    _viewModel.getNotifications(context);
  }

  getIcon(int code) {
    switch(code) {
      case 0: {
        return Icon(Icons.notifications);
      }
      case 1: {
        return Icon(Icons.mail);
      }
      case 2: {
        return Icon(Icons.wallpaper);
      }
      default: {
        return Icon(Icons.notifications);
      }
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}