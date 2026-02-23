import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/preference/LoginPreference.dart';
import 'package:colegio_americano/src/data/remote/ApiService.dart';

import 'package:colegio_americano/src/data/remote/LicenseApiService.dart';
import 'package:colegio_americano/src/navigation/NavigationManager.dart';
import 'package:get_it/get_it.dart';

abstract class BaseViewModel {
  late GetIt _injector;
  late LoginPreference loginPreference;
  late NavigationManager navigation;
  late AppDatabase appDatabase;
  late ApiService apiService;

  late LicenseApiService licenseApiService;

  BaseViewModel() {
    _injector = GetIt.instance;
    loginPreference = _injector<LoginPreference>();
    navigation = _injector<NavigationManager>();
    appDatabase = _injector<AppDatabase>();
    apiService = _injector<ApiService>();

    licenseApiService = _injector<LicenseApiService>();
  }

  void dispose() {}
}
