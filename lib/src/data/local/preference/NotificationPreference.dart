import 'package:colegio_americano/src/data/local/preference/BasePreference.dart';

class NotificationPreference extends BasePreference {
  static const String IS_NOTIFICATION_PRESSED_KEY =
      'is_notification_pressed_key';
  static const String NOTIFICATION_CODE_KEY = 'notification_code_key';

  Future<bool> get isNotificationPressed =>
      getBool(IS_NOTIFICATION_PRESSED_KEY);

  Future<String> get getNotificationCode => getString(NOTIFICATION_CODE_KEY);

  Future<bool> setNotificationPressed(bool value) =>
      addBool(IS_NOTIFICATION_PRESSED_KEY, value);

  Future<bool> setNotificationCode(String value) =>
      addString(NOTIFICATION_CODE_KEY, value);

  Future clearPreference() {
    return Future.wait(
        [setNotificationCode(""), setNotificationPressed(false)]);
  }
}
