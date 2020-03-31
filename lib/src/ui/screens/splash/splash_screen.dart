import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/constants/page_route_constants.dart';
import 'package:flutter_bloc_architecture/src/resources/dimens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  //animated splash
  _startAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
          ..addListener(() {
            if (animationController.isCompleted) {
              Navigator.of(context).pushNamed(PageRouteConstants.login_screen);
            }
            setState(() {});
          });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Spacer(),
            Image.asset(
              'assets/images/logo.png',
              width: animation.value * 250,
              height: animation.value * 250,
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.px10),
                child: Image.asset(
                  'assets/images/powered_by.png',
                  height: Dimens.px25,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
