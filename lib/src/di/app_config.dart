import 'package:flutter_bloc_architecture/src/data/repository/api_repository.dart';
import 'package:flutter_bloc_architecture/src/data/repository/preferences_repository.dart';
import 'package:get_it/get_it.dart';

GetIt appConfig = GetIt.I;

void setupAppConfig() {
  appConfig.registerFactory(() => APIRepository());
  appConfig.registerFactory(() => PreferencesRepository());
}
