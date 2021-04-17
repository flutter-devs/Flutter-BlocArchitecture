
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/bottom_nav/checkbox_cubit.dart';
import 'package:flutter_bloc_architecture/src/constants/string_constant.dart';
import 'package:flutter_bloc_architecture/src/network/repository/api_repository.dart';
import 'package:flutter_bloc_architecture/src/resources/app_theme.dart';
import 'package:flutter_bloc_architecture/src/utils/navigation_service.dart';
import 'package:flutter_bloc_architecture/src/utils/screen_router.dart';

import 'bloc/bottom_nav/bottom_nav_cubit.dart';
import 'bloc/login/login_bloc.dart';
import 'di/app_config.dart';
import 'ui/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) {
              return LoginBloc(
              );
            },
          ),
          BlocProvider<BottomNavCubit>(
            create: (context) => BottomNavCubit(),
          ),
          BlocProvider<CheckboxCubit>(
            create: (context) => CheckboxCubit(),
          ),
        ],
        child: MaterialApp(
            title: StringConstant.app_name,
            theme: AppTheme.appTheme(),
            navigatorKey: appConfig<NavigationService>().navigatorKey,
            onGenerateRoute: ScreenRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            home: SplashScreen()));
  }
}