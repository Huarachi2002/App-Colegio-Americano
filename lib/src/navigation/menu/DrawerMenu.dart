import 'package:colegio_americano/src/data/local/preference/LoginPreference.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/NavigationManager.dart';
import 'package:colegio_americano/src/navigation/RouteMap.dart';
import 'package:colegio_americano/src/data/remote/configuration/Menu.dart';
import 'package:colegio_americano/src/data/remote/configuration/UserTypes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetIt injector = GetIt.instance;
    NavigationManager _navigationManager = injector<NavigationManager>();
    LoginPreference _loginPreference = injector<LoginPreference>();
    String _routeName = ModalRoute.of(context)!.settings.name!;
    return FutureBuilder(
      future: _loginPreference.isLoggedIn,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData){
          return _notLoggedDrawer(context, _navigationManager, _routeName,_loginPreference);
        }
        bool isLoggedIn = snapshot.data!;
        if (isLoggedIn){
          return _loggedDrawer(context, _navigationManager, _loginPreference, _routeName);
        }
        return _notLoggedDrawer(context, _navigationManager, _routeName,_loginPreference);
      },
    );
  }

  _notLoggedDrawer(BuildContext context, NavigationManager _navigationManager,
      String _routeName,LoginPreference _loginPreference) {
    return Drawer(
      child: ListView(
        children: [
          _options(context, _navigationManager, false, _routeName,_loginPreference),
        ],
      ),
    );
  }

  _loggedDrawer(BuildContext context, NavigationManager _navigationManager,
      LoginPreference _loginPreference, String _routeName) {
    return Drawer(
      child: ListView(
        children: [
          _header(_loginPreference),
          _options(context, _navigationManager, true, _routeName,_loginPreference),
          _logoutOption(context, _navigationManager, _loginPreference),
        ],
      ),
    );
  }

  _options(BuildContext context, NavigationManager _navigationManager,
      bool isLoggedIn, String _routeName, LoginPreference _loginPreference) {
    return FutureBuilder(
        initialData: '',
        future: _loginPreference.userType,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Card(
            elevation: 4.0,
            child: Column(
              children: [
                Ink(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: new Text(
                        AppLocalizations.of(context).translate('menu_title_news')),
                    onTap: () {
                      _navigationManager.startNewsScreen(context);
                    },
                  ),
                  color: _routeName.contains(RouteMap.NEWS_SCREEN_ROUTE)
                      ? Colors.grey[300]
                      : Colors.transparent,
                ),
                Visibility(
                  visible: _getVisibility(snapshot.data!, isLoggedIn, 'equipments'),
                  child: Ink(
                    child: ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text(
                          AppLocalizations.of(context).translate('menu_title_buying_materials')),
                      onTap: () {
                        _navigationManager.startStudentRequestScreen(context);
                      },
                    ),
                    color: _routeName.contains(RouteMap.STUDENT_REQUEST_SCREEN_ROUTE)
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                ),
                Visibility(
                  visible: isLoggedIn,
                  child: Ink(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(
                          AppLocalizations.of(context).translate('menu_title_payment')),
                      onTap: () {
                        _navigationManager.startStudentPaymentScreen(context);
                      },
                    ),
                    color: _routeName.contains(RouteMap.STUDENT_PAYMENT_SCREEN_ROUTE)
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                ),
                Visibility(
                  visible: _getVisibility(snapshot.data!, isLoggedIn, 'reports'),
                  child: Ink(
                    child: ListTile(
                      leading: Icon(Icons.card_giftcard_outlined),
                      title: Text(
                          AppLocalizations.of(context).translate('menu_title_report_card')),
                      onTap: () {
                        _navigationManager.startStudentReportScreen(context);
                      },
                    ),
                    color: _routeName.contains(RouteMap.STUDENT_REPORT_SCREEN_ROUTE)
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                ),
                Visibility(
                  visible: _getVisibility(snapshot.data!, isLoggedIn, 'annotations'),
                  child: Ink(
                    child: ListTile(
                      leading: Icon(Icons.create),
                      title: Text(
                          AppLocalizations.of(context).translate('menu_title_annotations_assists')),
                      onTap: () {
                        _navigationManager.startStudentAnnotationScreen(context);
                      },
                    ),
                    color: _routeName.contains(RouteMap.STUDENT_ANNOTATION_SCREEN_ROUTE)
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                ),

                Ink(
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: new Text(
                        AppLocalizations.of(context).translate('menu_title_notifications')),
                    onTap: () {
                      _navigationManager.startNotificationsScreen(context);
                    },
                  ),
                  color: _routeName.contains(RouteMap.NOTIFICATIONS_SCREEN_ROUTE)
                      ? Colors.grey[300]
                      : Colors.transparent,
                ),

                Visibility(
                  visible: _getVisibility(snapshot.data!, isLoggedIn, 'licenses'),
                  child: Ink(
                    child: ListTile(
                      leading: Icon(Icons.description),
                      title: new Text(
                          AppLocalizations.of(context).translate('menu_title_license_requests')),
                      onTap: () {
                        _navigationManager.startStudentLicenseScreen(context);
                      },
                    ),
                    color: _routeName.contains(RouteMap.STUDENT_LICENSE_SCREEN_ROUTE)
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                ),
                Visibility(
                  visible: !isLoggedIn,
                  child: Ink(
                    child: ListTile(
                      leading: Icon(Icons.input),
                      title: Text(
                          AppLocalizations.of(context).translate('menu_title_login')),
                      onTap: () {
                        _navigationManager.startLoginScreen(context);
                      },
                    ),
                    color: _routeName.contains(RouteMap.LOGIN_SCREEN_ROUTE)
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          );
        }
    );


  }

  _logoutOption(BuildContext context, NavigationManager _navigationManager,
      LoginPreference _loginPreference) {
    return Card(
      elevation: 4.0,
      child: new ListTile(
        leading: Icon(Icons.power_settings_new),
        title: new Text(
          AppLocalizations.of(context).translate('menu_title_logout'),
          style: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
        ),
        onTap: () {
          _loginPreference.clearPreference().then((value) {
            _navigationManager.startNewsScreen(context);
          });
        },
      ),
    );
  }

  Widget _header(LoginPreference loginPreference) {
    return FutureBuilder(
      initialData: '',
      future: loginPreference.name,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Card(
            child: InkWell(
              child: UserAccountsDrawerHeader(
                accountName: Text(snapshot.data!),
                accountEmail: FutureBuilder(
                  initialData: '',
                  future: loginPreference.entityType,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return Text(getType(snapshot.data!));
                  }
                ),
                currentAccountPicture:
                CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
              ),
              onTap: () {},
            ));
      },
    );
  }

  String getType(String type){
    switch(type){
      case UserTypes.PARENT_MODEL:
        return "Padre de familia";
      case UserTypes.STUDENT_MODEL:
        return "Estudiante";
      default:
        return "Empleado";
    }
  }

  bool _getVisibility(String userType, bool isLoggedIn,String screen) {
    bool sw;
    if(userType == ''){
      sw = Menu.MENU_CONFIG[Menu.MENU_CONFIG.length -1][screen]!;
    }else{
      sw = Menu.MENU_CONFIG[int.parse(userType)][screen]!;
    }
    return sw;
  }
}
