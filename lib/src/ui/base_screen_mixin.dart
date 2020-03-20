import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/utils/app_colors.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

mixin BaseScreenMixin<T extends StatefulWidget> on State<T> {
  ProgressDialog progressDialog;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void setUpResources();

  Widget appBar();

  Widget body();

  Future<bool> isNetworkConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  void showLoading(BuildContext context, String message) {
    progressDialog = ProgressDialog(context, isDismissible: false);
    progressDialog.update(
      message: message,
    );
    progressDialog.style(
        backgroundColor: Theme.of(context).backgroundColor,
        messageTextStyle: TextStyle(color: AppColors.black),
        progressWidget: Center(child: CircularProgressIndicator()));
    progressDialog.show();
  }

  void hideLoading() {
    progressDialog?.hide();
  }

  showSnackBar(
      {@required Widget body, @required GlobalKey<ScaffoldState> scaffoldKey}) {
    scaffoldKey.currentState.hideCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: body));
  }

  showToast(String msg, BuildContext context,
      {int duration = 1,
      int gravity = 0,
      double backgroundRadius = 20,
      Border border}) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM,
        backgroundColor: Theme.of(context).accentColor,
        border: border,
        backgroundRadius: backgroundRadius,
        textColor: Theme.of(context).textTheme.caption.color);
  }
}
