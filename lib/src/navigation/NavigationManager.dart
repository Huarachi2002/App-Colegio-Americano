import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/navigation/RouteMap.dart';
import 'package:colegio_americano/src/navigation/argument/LicenseScreenArguments.dart';
import 'package:colegio_americano/src/ui/screen/AnnotationsScreen.dart';
import 'package:colegio_americano/src/ui/screen/BrowserScreen.dart';
import 'package:colegio_americano/src/ui/screen/DebtListScreen.dart';
import 'package:colegio_americano/src/ui/screen/EquipmentRequestScreen.dart';
import 'package:colegio_americano/src/ui/screen/HistoryDetailScreen.dart';
import 'package:colegio_americano/src/ui/screen/HistoryScreen.dart';
import 'package:colegio_americano/src/ui/screen/ImageViewerScreen.dart';
import 'package:colegio_americano/src/ui/screen/ImportationScreen.dart';
import 'package:colegio_americano/src/ui/screen/LicenseListScreen.dart';
import 'package:colegio_americano/src/ui/screen/LicenseScreen.dart';
import 'package:colegio_americano/src/ui/screen/LoginScreen.dart';
import 'package:colegio_americano/src/ui/screen/NewScreen.dart';
import 'package:colegio_americano/src/ui/screen/NewsScreen.dart';
import 'package:colegio_americano/src/ui/screen/NotificationScreen.dart';
import 'package:colegio_americano/src/ui/screen/NotificationsScreen.dart';
import 'package:colegio_americano/src/ui/screen/QrPaymentScreen.dart';
import 'package:colegio_americano/src/ui/screen/SplashScreen.dart';
import 'package:colegio_americano/src/ui/screen/StudentAnnotationScreen.dart';
import 'package:colegio_americano/src/ui/screen/StudentLicenseScreen.dart';
import 'package:colegio_americano/src/ui/screen/StudentPaymentDebtScreen.dart';
import 'package:colegio_americano/src/ui/screen/StudentReportScreen.dart';
import 'package:colegio_americano/src/ui/screen/StudentRequestScreen.dart';
import 'package:colegio_americano/src/ui/screen/VersionScreen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  late FluroRouter router;

  NavigationManager() {
    this.router = FluroRouter();
    _setupRouter();
  }

  void _setupRouter() {
    router.define(
      RouteMap.SPLASH_SCREEN_ROUTE,
      handler: _splashScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(RouteMap.VERSION_SCREEN,
        handler: _versionScreenHandler,
        transitionType: TransitionType.inFromRight);

    router.define(RouteMap.LOGIN_SCREEN_ROUTE,
        handler: _loginScreenHandler,
        transitionType: TransitionType.inFromRight);

    router.define(RouteMap.NEWS_SCREEN_ROUTE,
        handler: _newsScreenHandler,
        transitionType: TransitionType.inFromRight);

    router.define(RouteMap.NEW_SCREEN_ROUTE + '/:newId',
        handler: _newScreenHandler, transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.NOTIFICATION_SCREEN_ROUTE,
    //     handler: _notificationScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.NOTIFICATIONS_SCREEN_ROUTE,
    //     handler: _notificationsScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.STUDENT_ANNOTATION_SCREEN_ROUTE,
    //     handler: _studentAnnotationScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.STUDENT_REPORT_SCREEN_ROUTE,
    //     handler: _studentReportScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.STUDENT_REQUEST_SCREEN_ROUTE,
    //     handler: _studentRequestScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    router.define(
        RouteMap.ANNOTATION_SCREEN_ROUTE +
            '/:studentId/:studentErpCode/:studentName/:grade/:parallel',
        handler: _annotationScreenHandler,
        transitionType: TransitionType.inFromRight);

    router.define(RouteMap.BROWSER_SCREEN_ROUTE + '/:studentErpCode',
        handler: _browserScreenHandler,
        transitionType: TransitionType.inFromRight);

    // router.define(
    //     RouteMap.HISTORICAL_EQUIPMENT_REQUEST +
    //         '/:studentId/:erpCode/:name/:grade/:parallel',
    //     handler: _historicalScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    router.define(RouteMap.STUDENT_PAYMENT_SCREEN_ROUTE,
        handler: _studentPaymentScreenHandler,
        transitionType: TransitionType.inFromRight);

    router.define(
        RouteMap.DEBT_LIST_SCREEN_ROUTE +
            '/:studentId/:erpCode/:name/:grade/:parallel',
        handler: _debtListScreenHandler,
        transitionType: TransitionType.inFromRight);

    router.define(
        RouteMap.QR_PAYMENT_SCREEN_ROUTE +
            '/:studentId/:erpCode/:businessName/:nit/:currency/:documentType/:complement',
        handler: _qrPaymentScreenHandler,
        transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.NOTIFICATION_SCREEN_ROUTE + '/:notificationId',
    //     handler: _notificationScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.IMAGE_VIEWER_SCREEN_ROUTE + '/:newId/:newImageId',
    //     handler: _imageViewerScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(
    //     RouteMap.EQUIPMENT_REQUEST_SCREEN_ROUTE +
    //         '/:studentId/:erpCode/:name/:grade/:parallel',
    //     handler: _equipmentRequestHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(
    //     RouteMap.HISTORICAL_DETAIL_EQUIPMENT_REQUEST +
    //         '/:idRequest/:grade/:erpCode/:state/:date/:total',
    //     handler: _historicalDetailHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.IMPORTATION_ROUTE,
    //     handler: _importationHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.STUDENT_LICENSE_SCREEN_ROUTE,
    //     handler: _studentLicenseScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(
    //     RouteMap.LICENSE_LIST_SCREEN_ROUTE +
    //         '/:studentId/:erpCode/:name/:grade/:parallel',
    //     handler: _licenseListScreenHandler,
    //     transitionType: TransitionType.inFromRight);

    // router.define(RouteMap.LICENSE_SCREEN_ROUTE,
    //     handler: _licenseScreenHandler,
    //     transitionType: TransitionType.inFromRight);
  }

  Handler _versionScreenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          VersionScreen());

  Handler _importationHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ImportationScreen());

  Handler _historicalDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HistoryDetailScreen(
              int.parse(params['idRequest'][0]),
              params['grade'][0],
              params['erpCode'][0],
              params['state'][0],
              params['date'][0],
              params['total'][0]));

  Handler _equipmentRequestHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          EquipmentRequestScreen(
              int.parse(params['studentId'][0]),
              params['erpCode'][0],
              params['name'][0],
              params['grade'][0],
              params['parallel'][0]));

//
  Handler _qrPaymentScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        QrPaymentScreen(
            int.parse(params['studentId'][0]),
            params['erpCode'][0],
            params['businessName'][0],
            params['nit'][0],
            params['currency'][0],
            params['documentType'][0],
            params['complement'][0]),
  );

  Handler _debtListScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        DebtListScreen(int.parse(params['studentId'][0]), params['erpCode'][0],
            params['name'][0], params['grade'][0], params['parallel'][0]),
  );

  Handler _studentPaymentScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        StudentPaymentDebtScreen(),
  );

  Handler _historicalScreenHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HistoryScreen(int.parse(params['studentId'][0]), params['erpCode'][0],
              params['name'][0], params['grade'][0], params['parallel'][0]));

  Handler _loginScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        LoginScreen(),
  );

  Handler _newsScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        NewsScreen(),
  );

  Handler _notificationsScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        NotificationsScreen(),
  );

  Handler _newScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        NewScreen(int.parse(params['newId'][0])),
  );

  Handler _notificationScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        NotificationScreen(int.parse(params['notificationId'][0])),
  );

  Handler _splashScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        SplashScreen(),
  );

  Handler _studentAnnotationScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        StudentAnnotationScreen(),
  );

  Handler _studentReportScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        StudentReportScreen(),
  );

  Handler _studentRequestScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        StudentRequestScreen(),
  );

  Handler _annotationScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        AnnotationsScreen(
      int.parse(params['studentId'][0]),
      params['studentErpCode'][0],
      params['studentName'][0],
      params['grade'][0],
      params['parallel'][0],
    ),
  );

  Handler _browserScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        BrowserScreen(params['studentErpCode'][0]),
  );

  Handler _imageViewerScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        ImageViewerScreen(
            int.parse(params['newId'][0]), int.parse(params['newImageId'][0])),
  );

  Handler _studentLicenseScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        StudentLicenseScreen(),
  );

  Handler _licenseListScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
        LicenseListScreen(
            int.parse(params['studentId'][0]),
            params['erpCode'][0],
            params['name'][0],
            params['grade'][0],
            params['parallel'][0]),
  );

  Handler _licenseScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final args = context!.settings!.arguments as LicenseScreenArguments;
      return LicenseScreen(args.studentId, args.erpCode, args.name, args.grade,
          args.parallel, args.license);
    },
  );

  void navigateBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void _startScreenAsRoot(BuildContext context, String routeString) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/' + routeString, (Route<dynamic> route) => false);
  }

  Future _startScreen(BuildContext context, String route, {arguments}) {
    return Navigator.pushNamed(context, route, arguments: arguments);
  }

  void startNewsScreen(BuildContext context) =>
      _startScreenAsRoot(context, RouteMap.NEWS_SCREEN_ROUTE);

  void startNotificationsScreen(BuildContext context) =>
      _startScreenAsRoot(context, RouteMap.NOTIFICATIONS_SCREEN_ROUTE);

  void startLoginScreen(BuildContext context) =>
      _startScreenAsRoot(context, RouteMap.LOGIN_SCREEN_ROUTE);

  void startNewScreen(BuildContext context, String newId) {
    _startScreen(context, RouteMap.NEW_SCREEN_ROUTE + '/' + newId);
  }

  void startStudentAnnotationScreen(BuildContext context) =>
      _startScreenAsRoot(context, RouteMap.STUDENT_ANNOTATION_SCREEN_ROUTE);

  void startStudentReportScreen(BuildContext context) =>
      _startScreenAsRoot(context, RouteMap.STUDENT_REPORT_SCREEN_ROUTE);

  void startStudentRequestScreen(BuildContext context) =>
      _startScreenAsRoot(context, RouteMap.STUDENT_REQUEST_SCREEN_ROUTE);

  void startVersionScreen(BuildContext context) {
    _startScreenAsRoot(context, RouteMap.VERSION_SCREEN);
  }

  void startAnnotationScreen(
      BuildContext context,
      String studentId,
      String studentErpCode,
      String studentName,
      String grade,
      String parallel) {
    _startScreen(
        context,
        RouteMap.ANNOTATION_SCREEN_ROUTE +
            '/' +
            studentId +
            '/' +
            studentErpCode +
            '/' +
            studentName +
            '/' +
            grade +
            '/' +
            parallel);
  }

  void startHistoricalScreen(BuildContext context, String studentId,
      String erpCode, String name, String grade, String parallel) {
    _startScreen(
        context,
        RouteMap.HISTORICAL_EQUIPMENT_REQUEST +
            '/' +
            studentId +
            '/' +
            erpCode +
            '/' +
            name +
            '/' +
            grade +
            '/' +
            parallel);
  }

  void startDebtListScreen(BuildContext context, String studentId,
      String erpCode, String name, String grade, String parallel) {
    _startScreen(
        context,
        RouteMap.DEBT_LIST_SCREEN_ROUTE +
            '/' +
            studentId +
            '/' +
            erpCode +
            '/' +
            name +
            '/' +
            grade +
            '/' +
            parallel);
  }

  void startBrowserScreen(BuildContext context, String studentErpCode) {
    _startScreen(context, RouteMap.BROWSER_SCREEN_ROUTE + '/' + studentErpCode);
  }

  void startStudentPaymentScreen(BuildContext context) {
    _startScreen(context, RouteMap.STUDENT_PAYMENT_SCREEN_ROUTE);
  }

  void startNotificationScreen(BuildContext context, String notificationId) {
    _startScreen(
        context, RouteMap.NOTIFICATION_SCREEN_ROUTE + '/' + notificationId);
  }

  void startImageViewerScreen(
      BuildContext context, String newId, String newImageId) {
    _startScreen(context,
        RouteMap.IMAGE_VIEWER_SCREEN_ROUTE + '/' + newId + '/' + newImageId);
  }

  void startQrPaymentScreen(
      BuildContext context,
      String studentId,
      String erpCode,
      String businessName,
      String nit,
      String currency,
      String documentType,
      String complement) {
    _startScreen(
        context,
        RouteMap.QR_PAYMENT_SCREEN_ROUTE +
            '/' +
            studentId +
            '/' +
            erpCode +
            '/' +
            businessName +
            '/' +
            nit +
            '/' +
            currency +
            '/' +
            documentType +
            '/' +
            complement);
  }

  void startEquipmentRequestScreen(BuildContext context, String studentId,
      String erpCode, String name, String grade, String parallel) {
    _startScreen(
        context,
        RouteMap.EQUIPMENT_REQUEST_SCREEN_ROUTE +
            '/' +
            studentId +
            '/' +
            erpCode +
            '/' +
            name +
            '/' +
            grade +
            '/' +
            parallel);
  }

  //'/:idRequest/:grade/:erpCode/:state/:date/:total',
  void startHistoricalDetailEquipmentRequestScreen(
      BuildContext context,
      String idRequest,
      String grade,
      String erpCode,
      String state,
      String date,
      String total) {
    _startScreen(
        context,
        RouteMap.HISTORICAL_DETAIL_EQUIPMENT_REQUEST +
            '/' +
            idRequest +
            '/' +
            grade +
            '/' +
            erpCode +
            '/' +
            state +
            '/' +
            date +
            '/' +
            total);
  }

  void startImportationScreen(BuildContext context) {
    _startScreenAsRoot(context, RouteMap.IMPORTATION_ROUTE);
  }

  void startStudentLicenseScreen(BuildContext context) {
    _startScreenAsRoot(context, RouteMap.STUDENT_LICENSE_SCREEN_ROUTE);
  }

  void startLicenseListScreen(BuildContext context, String studentId,
      String erpCode, String name, String grade, String parallel) {
    _startScreen(
      context,
      RouteMap.LICENSE_LIST_SCREEN_ROUTE +
          '/' +
          studentId +
          '/' +
          erpCode +
          '/' +
          name +
          '/' +
          grade +
          '/' +
          parallel,
    );
  }

  void startLicenseScreen(
      BuildContext context,
      int studentId,
      String erpCode,
      String name,
      String grade,
      String parallel,
      LicenseListResponse? license) {
    final arguments = LicenseScreenArguments(
        studentId: studentId,
        erpCode: erpCode,
        name: name,
        grade: grade,
        parallel: parallel,
        license: license);
    _startScreen(context, RouteMap.LICENSE_SCREEN_ROUTE, arguments: arguments);
  }
}
