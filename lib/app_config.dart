import 'package:flutter_bloc_architecture/src/repository/api_repository.dart';
import 'package:flutter_bloc_architecture/src/repository/preferences_repository.dart';
import 'package:get_it/get_it.dart';

const String locatorDarkMode = "darkMode";
GetIt appConfig = GetIt.I;

void setupAppConfig() {
  appConfig.registerFactory(() => APIRepository());
  appConfig.registerFactory(() => PreferencesRepository());
}
