import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/constants/page_route_constants.dart';
import 'package:flutter_bloc_architecture/src/ui/screens/home/home_screen.dart';
import 'package:flutter_bloc_architecture/src/ui/screens/login/login_screen.dart';
import 'package:flutter_bloc_architecture/src/ui/screens/splash/splash_screen.dart';

class ScreenRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteConstants.home_screen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case PageRouteConstants.splash_screen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case PageRouteConstants.login_screen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
