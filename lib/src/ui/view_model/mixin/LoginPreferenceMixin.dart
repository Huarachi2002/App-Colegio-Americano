import 'package:colegio_americano/src/data/remote/response/LoginResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';

mixin LoginPreferenceMixin on BaseViewModel{
  Future saveLoginPreference(LoginResponse loginResponse){
    return Future.wait([
      loginPreference.setUserId(loginResponse.id.toString()),
      loginPreference.setName(loginResponse.name),
      loginPreference.setUserType(loginResponse.userType),
      loginPreference.setEntityType(loginResponse.entityType),
      loginPreference.setEntityId(loginResponse.entityId.toString()),
      loginPreference.setApiToken(loginResponse.apiToken),
    ]);
  }
}