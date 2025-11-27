import 'package:shared_preferences/shared_preferences.dart';

class BasePreference {
  late SharedPreferences _preferences;

  Future loadSharedPreference() {
    return SharedPreferences.getInstance()
        .then((sharedPreferences) => _preferences = sharedPreferences);
  }

  Future<bool> addString(String key, String value) async =>
      _preferences.setString(key, value);

  Future<bool> addInteger(String key, int value) async =>
      _preferences.setInt(key, value);

  Future<bool> addBool(String key, bool value) async =>
      _preferences.setBool(key, value);

  Future<bool> addDouble(String key, double value) async =>
      _preferences.setDouble(key, value);

  Future<String> getString(String key) async {
    return _preferences.getString(key) ?? '';
  }

  Future<bool> getBool(String key) async {
    return _preferences.getBool(key) ?? false;
  }

  Future<int> getInt(String key) async {
    return _preferences.getInt(key) ?? 0;
  }

  Future<double> getDouble(String key) async {
    return _preferences.getDouble(key) ?? 0;
  }

  bool exist(String key) {
    return _preferences.containsKey(key);
  }

  Future clear() {
    return _preferences.clear();
  }
}
