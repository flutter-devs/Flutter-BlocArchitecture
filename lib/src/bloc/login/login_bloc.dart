import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/di/app_config.dart';
import 'package:flutter_bloc_architecture/src/models/network_data_models/login/response/login_response.dart';
import 'package:flutter_bloc_architecture/src/network/repository/api_repository.dart';
import 'package:flutter_bloc_architecture/src/utils/helper.dart';
import 'package:flutter_bloc_architecture/src/utils/validator.dart';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Validator validator = Validator();

  LoginBloc() : super(UserUnavailable());

  @override
  LoginState get initialState => UserUnavailable();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignInUser) {
      yield LoginLoading();
      try {
        LoginResponse loginResponse = await appConfig<ApiRepository>().login(
          email: event.email,
          password: event.password,
        );
        if (loginResponse != null) {
          Helper.printLogValue("UserLoggedIn");
          yield UserLoggedIn();
        } else {
          Helper.printLogValue("UserLoggedOut");
          yield UserLoggedOut();
        }
      } catch (error) {
        Helper.printLogValue("LoginFailure");
        yield LoginFailure(error: error.toString());
      }
    }
    if (event is PasswordChanged) {
      yield state.copyWith(
        isPasswordValid: _isPasswordValid(event.password),
      );
    }

    if (event is EmailChanged) {
      yield state.copyWith(
        isEmailValid: _isEmailValid(event.email),
      );
    }
  }
  bool _isEmailValid(String email) {
    return validator.validateEmail(email);
  }

  bool _isPasswordValid(String password) {
    return validator.validatePassword(password);
  }
}
