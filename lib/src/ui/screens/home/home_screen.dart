import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/constants/font_constants.dart';
import 'package:flutter_bloc_architecture/src/constants/string_constant.dart';
import 'package:flutter_bloc_architecture/src/resources/app_colors.dart';
import 'package:flutter_bloc_architecture/src/resources/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Text(
            StringConstant.welcome_to_home_screen,
            style: AppTextStyles.getExtraLargeText(
                size.width, AppColors.black, FontConstant.kBold),
          ),
        ),
      ),
    );
  }
}
