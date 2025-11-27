import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/RouteMap.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

mixin RootScreenMixin<T extends StatefulWidget> on State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ///Method to catch android back button
  ///[stopDefaultButtonEvent] only false if it is able to catch event
  ///return `true` if ignore default behavior otherwise false
  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo routeInfo) {
    if (scaffoldKey.currentState!.isDrawerOpen) return false;

    var routeName = ModalRoute.of(context)!.settings.name!;

    //Validation to avoid event overlap
    if (!stopDefaultButtonEvent) {
      if(routeName == '/news_screen_route')
        return false;
      if (Navigator.canPop(context)) {
        if (Utils.isDialogActive) return true;
        //Add validation with specific routeName
        if (routeName.contains(RouteMap.QR_PAYMENT_SCREEN_ROUTE)) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/' + RouteMap.STUDENT_PAYMENT_SCREEN_ROUTE,
              (Route<dynamic> route) => false);
        } else {
          Navigator.pop(context);
        }
      } else {
        //Add validation with specific routeName
        Utils.showExitAlert(context);
      }
    }
    return true;
  }


}
