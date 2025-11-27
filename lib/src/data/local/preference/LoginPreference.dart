import 'package:colegio_americano/src/data/local/preference/BasePreference.dart';

class LoginPreference extends BasePreference {
  static const String USER_ID_KEY = 'user_id_key';
  static const String NAME_KEY = 'name_key';
  static const String ENTITY_TYPE_KEY = 'entity_type_key';
  static const String ENTITY_ID_KEY = 'entity_id_key';
  static const String API_TOKEN_KEY = 'api_token_key';
  static const String USER_TYPE_KEY = 'user_type_key';
  static const String USER_NAME_TYPE_KEY = 'user_name_type_key';
  static const String IS_LOGGED_IN_KEY = 'is_logged_in_key';
  static const String FCM_TOKEN_KEY = 'fcm_token_key';
  static const String FCM_ID_KEY = 'fcm_id_key';
  static const String UPDATE_DATA_KEY = 'update_data_key';
  static const String LICENSE_AUTH_TOKEN_KEY = "license_auth_token_key";
  static const String FATHER_ERP_CODE = 'father_erp_code';
  static const String NEWS_URL_KEY = 'news_url';

  Future<String> get userId => getString(USER_ID_KEY);

  Future<String> get name => getString(NAME_KEY);

  Future<String> get entityType => getString(ENTITY_TYPE_KEY);

  Future<String> get entityId => getString(ENTITY_ID_KEY);

  Future<String> get apiToken => getString(API_TOKEN_KEY);

  Future<String> get userType => getString(USER_TYPE_KEY);

  Future<String> get userNameType => getString(USER_NAME_TYPE_KEY);

  Future<bool> get isLoggedIn => getBool(IS_LOGGED_IN_KEY);

  Future<String> get fcmToken => getString(FCM_TOKEN_KEY);

  Future<String> get fcmId => getString(FCM_ID_KEY);

  Future<bool> get isUpdateData => getBool(UPDATE_DATA_KEY);

  Future<String> get licenseAuthTokenKey => getString(LICENSE_AUTH_TOKEN_KEY);

  Future<String> get fatherErpCode => getString(FATHER_ERP_CODE);

  Future<String> get newsUrl => getString(NEWS_URL_KEY);

  Future<bool> setUserId(String value) => addString(USER_ID_KEY, value);

  Future<bool> setName(String value) => addString(NAME_KEY, value);

  Future<bool> setEntityType(String value) => addString(ENTITY_TYPE_KEY, value);

  Future<bool> setEntityId(String value) => addString(ENTITY_ID_KEY, value);

  Future<bool> setApiToken(String value) => addString(API_TOKEN_KEY, value);

  Future<bool> setUserType(String value) => addString(USER_TYPE_KEY, value);

  Future<bool> setUserNameType(String value) =>
      addString(USER_NAME_TYPE_KEY, value);

  Future<bool> setLoggedIn(bool value) => addBool(IS_LOGGED_IN_KEY, value);

  Future<bool> setFcmToken(String value) => addString(FCM_TOKEN_KEY, value);

  Future<bool> setFcmId(String value) => addString(FCM_ID_KEY, value);

  Future<bool> setUpdateData(bool value) => addBool(UPDATE_DATA_KEY, value);

  Future<bool> setLicenseAuthTokenKey(String value) =>
      addString(LICENSE_AUTH_TOKEN_KEY, value);

  Future<bool> setFatherErpCode(String value) =>
      addString(FATHER_ERP_CODE, value);

  Future<bool> setNewsUrl(String value) =>
      addString(NEWS_URL_KEY, value);

  Future<List<String>> get nameAndUser async {
    List<String> l = [];
    await name.then((value) => l.add(value));
    await userType.then((value) => l.add(value));
    return l;
  }

  Future clearPreference() {
    return Future.wait([
      setUserId(''),
      setName(''),
      setUserType(''),
      setEntityId(''),
      setEntityType(''),
      setApiToken(''),
      setLoggedIn(false),
      setFcmId(''),
      setFatherErpCode("")
    ]);
  }
}
