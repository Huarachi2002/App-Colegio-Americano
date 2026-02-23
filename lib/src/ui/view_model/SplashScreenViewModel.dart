import 'dart:async';
import 'dart:io';

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/preference/LoginPreference.dart';
import 'package:colegio_americano/src/data/local/preference/NotificationPreference.dart';
import 'package:colegio_americano/src/data/remote/ApiService.dart';

import 'package:colegio_americano/src/data/remote/LicenseApiService.dart';
import 'package:colegio_americano/src/data/remote/response/VersionResponse.dart';
import 'package:colegio_americano/src/navigation/NavigationManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenViewModel {
  late GetIt injector;
  late NavigationManager navigationManager;
  late LoginPreference loginPreference;
  late AppDatabase appDatabase;
  late NotificationPreference notificationPreference;

  SplashScreenViewModel();

  startSetupDependencyInjection(BuildContext context) {
    _setupDependencyInjection().then((value) {
      callWebService(context);
    }).catchError((onError) async {
      await EasyLoading.dismiss();
      print(onError);
    });
  }

  callWebService(BuildContext context) {
    EasyLoading.show(status: 'Cargando...');
    GetIt injector = GetIt.instance;
    ApiService apiService = injector<ApiService>();
    LicenseApiService licenseApiService = injector<LicenseApiService>();

    apiService.getVersions().then((data) async {
      VersionResponse versionResponse = data.body!.data!;

      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentVersion = packageInfo.version;
      String serverVersion = Platform.isAndroid
          ? versionResponse.apkVersion
          : versionResponse.ipaVersion;

      if (currentVersion.compareTo(serverVersion) < 0) {
        await EasyLoading.dismiss();
        navigationManager.startVersionScreen(context);
      } else {
        await getNewsUrl(apiService);
        bool isLoggedIn = await loginPreference.isLoggedIn;
        bool isUpdateData = await loginPreference.isUpdateData;
        if (isLoggedIn) {
          await EasyLoading.dismiss();
          if (isUpdateData) {
            await loginPreference.setUpdateData(false);
            navigationManager.startImportationScreen(context);
          } else {
            navigationManager.startNewsScreen(context);
          }
        } else {
          await loginPreference.setUpdateData(false);
          await EasyLoading.dismiss();
          navigationManager.startNewsScreen(context);
        }
      }
    }).catchError((error) async {
      bool isLoggedIn = await loginPreference.isLoggedIn;
      bool isUpdateData = await loginPreference.isUpdateData;
      if (isLoggedIn) {
        await EasyLoading.dismiss();
        if (isUpdateData) {
          await loginPreference.setUpdateData(false);
          navigationManager.startImportationScreen(context);
        } else {
          navigationManager.startNewsScreen(context);
        }
      } else {
        await loginPreference.setUpdateData(false);
        await EasyLoading.dismiss();
        navigationManager.startNewsScreen(context);
      }
    });
  }

  Future _setupDependencyInjection() {
    GetIt injector = GetIt.instance;
    injector.registerSingleton<NavigationManager>(NavigationManager());
    injector.registerSingleton<ApiService>(ApiService.create());
    injector.registerSingleton<LicenseApiService>(LicenseApiService.create());
    injector
        .registerSingleton<NotificationPreference>(NotificationPreference());
    injector.registerSingleton<AppDatabase>(AppDatabase());

    if (!injector.isRegistered<LoginPreference>()) {
      injector.registerSingleton<LoginPreference>(LoginPreference());
    }

    navigationManager = injector<NavigationManager>();
    appDatabase = injector<AppDatabase>();
    loginPreference = injector<LoginPreference>();
    notificationPreference = injector<NotificationPreference>();

    return Future.wait([
      loginPreference.loadSharedPreference(),
      notificationPreference.loadSharedPreference()
    ]);
  }

  Future getNewsUrl(ApiService apiService) async {
    try {
      final response = await apiService.getNewsUrl();
      if (response.isSuccessful && response.body!.data != null) {
        GetIt injector = GetIt.instance;
        LoginPreference loginPreference = injector<LoginPreference>();
        loginPreference.setNewsUrl(response.body!.data!);
      }
    } catch (e) {
      print("[NEWS] Error => $e");
    }
  }
}
