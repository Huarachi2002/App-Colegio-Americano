import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/NotificationScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NotificationScreen extends StatefulWidget {
  final int notificationId;

  NotificationScreen(this.notificationId);

  @override
  State<StatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with RootScreenMixin {
  NotificationScreenViewModel _viewModel = NotificationScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    _viewModel.getNotification(widget.notificationId.toString());
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
        stream: _viewModel.notificationsStream,
        builder: (BuildContext context,
            AsyncSnapshot<RequestStatus<NotificationResponse>> snapshot) {
          if (!snapshot.hasData) return FullScreenLoadingWidget();
          var request = snapshot.data!;
          if (request.state == RequestStatusEnum.LOADING)
            return FullScreenLoadingWidget();

          var data = request.data;
          if (data != null) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: _notification(data),
                ),
              ),
            );
          } else {
            return FullScreenLoadingWidget();
          }
        });
  }

  _notification(NotificationResponse notificationData) {
    final ThemeData theme = Theme.of(context);
    theme.textTheme.displayLarge!.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.titleMedium!;
    List<Widget> list = [];

    if (notificationData.url != '') {
      list = [
        _notificationName(notificationData.title, descriptionStyle),
        _notificationImage(
            context, SyncConstants.SERVER_URL + '/' + notificationData.url),
        Divider(
          thickness: 1.5,
          height: 2,
        ),
        _notificationDescriptionTitle(descriptionStyle),
        _notificationDescriptionText(notificationData.message),
      ];
    } else {
      list = [
        _notificationName(notificationData.title, descriptionStyle),
        Divider(
          thickness: 1.5,
          height: 2,
        ),
        _notificationDescriptionText(notificationData.message),
      ];
    }

    return list;
  }

  _notificationImage(BuildContext context, String url) {
    return Card(
      elevation: 2.0,
      child: Container(
          color: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: _getImage(url),
          )),
    );
  }

  _getImage(String url,
      {boxType = BoxFit.contain, defaultAsset = 'assets/no_image.png'}) {
    if (url == null)
      return Image.asset(
        defaultAsset,
        fit: boxType,
      );
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      placeholder: (context, url) => Image.asset(
        defaultAsset,
        fit: BoxFit.scaleDown,
      ),
      errorWidget: (context, url, error) => Image.asset(
        defaultAsset,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  _notificationName(String value, TextStyle descriptionStyle) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
      child: Text(
        value,
        maxLines: 3,
        style: descriptionStyle.copyWith(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  _notificationDescriptionTitle(TextStyle descriptionStyle) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: DefaultTextStyle(
        style: descriptionStyle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                AppLocalizations.of(context).translate('description_label'),
                style: descriptionStyle.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _notificationDescriptionText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
      // child: Text(
      //   text,
      //   textAlign: TextAlign.justify,
      //   style: TextStyle(fontSize: 13.0, color: Colors.black38),
      // ),
      child: Html(
        data: text,
        // onLinkTap: (value){
        //   print(value);
        // },
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
          AppLocalizations.of(context).translate('menu_title_notification')),
    );
  }
}
