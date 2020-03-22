import 'package:flutter_bloc_architecture/src/data/repository/repository_interfaces/i_preferences_repository.dart';
import 'package:flutter_bloc_architecture/src/data/data_provider/preference_connector.dart';

class PreferencesRepository extends IPreferencesRepository {
  static const String LOGIN = "LOGIN";
  PreferenceConnector preferenceConnector;

  PreferencesRepository() {
    preferenceConnector = PreferenceConnector();
  }

  @override
  void setLoginStatus(bool loginValue) {
    preferenceConnector.setBool(LOGIN, loginValue);
  }

  @override
  Future<bool> isLogged() {
    return preferenceConnector.getBool(LOGIN);
  }
}
