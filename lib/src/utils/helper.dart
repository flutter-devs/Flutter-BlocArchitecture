import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/constants/string_constant.dart';
import 'package:flutter_bloc_architecture/src/resources/dimens.dart';
import 'package:flutter_bloc_architecture/src/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class Helper {
  static var logger = Logger();

  static printLogValue(dynamic value) {
    logger.d(value.toString());
  }

  static void showMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.white,
        fontSize: Dimens.px16);
  }

  static void showAlert(BuildContext context, String title, String errorMsg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          content: Text(errorMsg),
          actions: <Widget>[
            FlatButton(
              child: Text(StringConstant.ok),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static Widget progressWidget(GlobalKey progressKey) {
    return Container(
        height: Dimens.px56,
        child: Center(
          child: CircularProgressIndicator(
            key: progressKey,
          ),
        ));
  }

  static Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        Helper.printLogValue('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      Helper.printLogValue('not connected');
      return false;
    }
  }
}
