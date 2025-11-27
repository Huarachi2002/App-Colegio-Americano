import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/NavigationManager.dart';
import 'package:colegio_americano/src/navigation/RouteMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: _getLocalizationDelegates(),
      supportedLocales: _getSupportedLocales(),
      localeResolutionCallback: (locale, supportedLocales) =>
          _getResolutionCallback(locale, supportedLocales),
      title: 'CA SANTA CRUZ',
      theme: ThemeData(
          useMaterial3: false,
          primaryColor: Colors.red,
          primaryColorDark: Colors.white30,
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red)),
      onGenerateRoute: NavigationManager().router.generator,
      initialRoute: RouteMap.SPLASH_SCREEN_ROUTE,
      builder: EasyLoading.init(),
    );
  }

  List<LocalizationsDelegate> _getLocalizationDelegates() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  _getSupportedLocales() => [const Locale('es', 'BO')];

  _getResolutionCallback(locale, supportedLocales) {
    return supportedLocales.first;
  }
}
