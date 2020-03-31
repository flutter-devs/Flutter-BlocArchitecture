import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_architecture/src/constants/string_constant.dart';
import 'package:flutter_bloc_architecture/src/di/app_config.dart';
import 'package:flutter_bloc_architecture/src/network/repository/api_repository.dart';
import 'package:flutter_bloc_architecture/src/resources/app_theme.dart';
import 'package:flutter_bloc_architecture/src/ui/screens/splash/splash_screen.dart';
import 'package:flutter_bloc_architecture/src/utils/navigation_service.dart';
import 'package:flutter_bloc_architecture/src/utils/router.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiRepository = ApiRepository();
    //login bloc
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) {
              return LoginBloc(
                apiRepository: apiRepository,
              );
            },
          ),
        ],
        child: MaterialApp(
            title: StringConstant.app_name,
            theme: AppTheme.appTheme(),
            navigatorKey: appConfig<NavigationService>().navigatorKey,
            onGenerateRoute: Router.generateRoute,
            debugShowCheckedModeBanner: false,
            home: SplashScreen()));
  }
}