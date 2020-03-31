import 'package:flutter_bloc_architecture/src/constants/regex_constant.dart';

class Validator {
  bool validateEmail(String value) {
    RegExp regExp = RegExp(RegexConstant.valid_email);
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword(String value) {
    if (value.length == 0) {
      return false;
    } else if (value.length < 4) {
      return false;
    } else {
      return true;
    }
  }
}
