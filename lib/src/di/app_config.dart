import 'package:flutter_bloc_architecture/src/network/repository/api_repository.dart';
import 'package:flutter_bloc_architecture/src/sharedpref/preference_connector.dart';
import 'package:flutter_bloc_architecture/src/utils/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt appConfig = GetIt.I;

void setupAppConfig() {
  appConfig.registerFactory(() => ApiRepository());
  appConfig.registerFactory(() => NavigationService());
  appConfig.registerFactory(() => PreferenceConnector());
}
